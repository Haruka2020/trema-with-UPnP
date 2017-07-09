import re
import sqlite3
from urllib.request import urlopen
import urllib.request
from bs4 import BeautifulSoup


def main():
    rootdevice_dict = get_rootdevice_dict_scrape('./rootdevice.txt')
    device_dict = {}
    for location in rootdevice_dict.values():
        device_dict.update(get_device_dict(location))



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
    device_data = {'friendlyName':friendlyName,'servicelist':servicelist,'ip':ip,'port':port}
    device_dict = {UDN:device_data}
    return device_dict

if __name__ == '__main__':
    main()
