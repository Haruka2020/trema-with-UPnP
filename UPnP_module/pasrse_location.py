import re
import sqlite3
from urllib.request import urlopen
import urllib.request
from html import unescape


def main():
    rootdevice_dict = get_rootdevice_dict_scrape('./rootdevice.txt')
    










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
        #title = re.search(r'<p itemprop="name".*?</p>',partial_html).group(0)
        #title = re.sub(r'<.*?>','',title)
        #title = unescape(title)
        #print(url)
        #books.append({'url':url,'title':title})
    #return books

if __name__ == '__main__':
    main()
