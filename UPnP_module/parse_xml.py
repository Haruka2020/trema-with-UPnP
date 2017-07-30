import re
from bs4 import BeautifulSoup
from urllib.request import urlopen
import urllib.request



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

def get_manufacture(soup):
    manufacturer = soup.manufacturer.text
    return manufacturer

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
    friendlyName = get_friendlyName(soup)
    servicelist = get_service_list(soup)
    manufacturer = get_manufacture(soup)
    device_data = {'friendlyName':friendlyName,'servicelist':servicelist,'ip':ip,'port':port,'manufacturer':manufacturer}
    device_dict = {UDN:device_data}
    return device_dict
def get_service_dict(soup):
    soup = BeautifulSoup(xml,lo)
    root = get_UDN(soup)

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


location = 'http://192.168.11.1:50324/gatedesc.xml'

device_dict = get_device_dict(location)
service_dict = get_service_dict(location)
print(service_dict)


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
