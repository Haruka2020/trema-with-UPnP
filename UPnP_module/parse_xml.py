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


location = 'http://192.168.11.1:50324/gatedesc.xml'

device_dict = get_device_dict(location)
print(device_dict)
