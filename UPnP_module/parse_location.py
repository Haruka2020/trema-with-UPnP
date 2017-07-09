import re
import sqlite3
from urllib.request import urlopen
import urllib.request
from bs4 import BeautifulSoup


def main():
    rootdevice_dict = get_rootdevice_dict_scrape('./rootdevice.txt')
    device_dict = {}
    service_dict = {}
    for location in rootdevice_dict.values():
        device_dict.update(get_device_dict(location))
    for location in rootdevice_dict.values():
        service_dict.update(get_service_dict(location))
    print(service_dict)

#-----------------------------------------------------------------

def get_rootdevice_dict_scrape(file):
    f = open(file,'r')
    lines=f.readlines()
    f.close()
    rootdevice_dict = {}
    uuid = None
    location = None
    for line in lines:
        if(re.search(r'location.*',line,re.I)):
            location = re.search(r'location.*',line,re.I).group()
            location = location.split(' ')[1]
        if(re.search(r'USN.*',line,re.I)):
            uuid = re.search(r'USN.*',line,re.I).group()
            uuid = uuid.split(' ')[1]
        if(location and uuid):
            rootdevice_dict[uuid]=location
            location = None
            uuid = None
    return rootdevice_dict

def get_service_list(soup):
    servicelist = []
    for service in soup.find_all('serviceType'):
        servicelist.append(service.text)
    return servicelist

def get_friendlyName(soup):
    friendlyName = soup.friendlyName.text
    return friendlyName

def get_UDN(soup):
    UDN = soup.UDN.text
    return UDN

def get_deviceType(soup):
    deviceType = soup.deviceType.text
    return deviceType

def get_ip_and_port(location):
    location = re.search(r'.*?//(.*?):(.*?)/',location,re.I)
    ip = location.group(1)
    port = location.group(2)
    return ip,port

def get_device_dict(location):
    ip,port = get_ip_and_port(location)
    xml = urlopen(location)
    soup = BeautifulSoup(xml,'xml')
    UDN = get_UDN(soup)
    deviceType = get_deviceType(soup)
    friendlyName = get_friendlyName(soup)
    servicelist = get_service_list(soup)
    device_data = {'deviceType':deviceType,'friendlyName':friendlyName,'servicelist':servicelist,'ip':ip,'port':port}
    device_dict = {UDN:device_data}
    return device_dict

def get_service_dict(location):
    service_list = []
    ip,port = get_ip_and_port(location)
    xml = urlopen(location)
    soup = BeautifulSoup(xml,'xml')
    rootUDN = get_UDN(soup)
    for device in soup.find_all('device'):
        servicelist = device.serviceList
        deviceUDN = device.UDN.text
        print(device.friendlyName.text)
        for service in servicelist.find_all('service'):
            serviceType = service.serviceType.text
            controlURL = service.controlURL.text
            SCPDURL = service.SCPDURL.text
            serviceID = service.serviceId.text
            service_data = {'rootUDN':rootUDN,'deviceUDN':deviceUDN,'serviceType':serviceType,'controlURL':controlURL,'SCPDURL':SCPDURL}
            service_list.append(service_data)
        service_dict = {rootUDN:service_list}
    return service_dict

if __name__ == '__main__':
    main()

"""
device_dict
{uuid:device_data_dict{}}

device_data_dict
{'UDN':UDN,'friendlyName':friendlyName,'servicelist':servicelist[],'ip':ip,'port':port,'manufacturer':manufacturer}

servicelist
[serviceType,serviceType,.......]

service_dict
{rootUDN:service_list[]}

service_list
[service_data_dict,service_data_dict,.............]

service_data_dict
{'rootUDN':rootUDN,'deviceUDN':deviceUDN,'serviceType':serviceType,'controlURL':controlURL,'SCPDURL':SCPDURL}
"""
