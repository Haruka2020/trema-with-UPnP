from parse_location import *
import pymysql


def main():
    location_dict = get_rootdevice_dict_scrape('./rootdevice.txt')
    rootdevice_dict,service_dict = get_device_and_service_dict(location_dict)


    #接続情報
    db = pymysql.connect(
             host='192.168.11.11',
             user='haruka',
             password='password',
             db='UPnP_List',
             charset='utf8',
             cursorclass=pymysql.cursors.DictCursor
        )
    insert_service(db,service_dict)
    db.close()







def insert_rootDevice(db,rootdevice_dict):
    #カーソル
    stmt = db.cursor()
    for deviceID,device_data_dict in rootdevice_dict.items():
        deviceType = device_data_dict['deviceType']
        friendlyName = device_data_dict['friendlyName']
        ip = device_data_dict['ip']
        port = device_data_dict['port']
        manufacturer  = device_data_dict['manufacturer']
        stmt.execute("Insert IGNORE into rootDevice VALUES(%s, %s, %s, %s, %s, %s)" ,(deviceID,deviceType,friendlyName,manufacturer,ip,port))
        db.commit()
    stmt.close()

def insert_service(db,service_dict):
    #カーソル
    stmt = db.cursor()
    for rootUDN,service_list in service_dict.items():
        for service_data_dict in service_list:
            serviceID = service_data_dict['serviceID']
            serviceType = service_data_dict['serviceType']
            controlURL = service_data_dict['controlURL']
            SCPDURL = service_data_dict['SCPDURL']
            deviceUDN =service_data_dict['deviceUDN']
            stmt.execute("Insert IGNORE into service VALUES(%s, %s, %s, %s, %s, %s)" ,(serviceID,serviceType,deviceUDN,rootUDN,controlURL,SCPDURL))
            db.commit()
    stmt.close()
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
