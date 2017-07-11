cd = File.dirname(__FILE__)
require 'mysql2'
require "#{cd}/mysql/get_db"
require "#{cd}/mysql/insert_password"

def main
  ip = '192.168.11.1'
  port = '50324'
  s_ip = '192.168.1.100'
  body = ""
  body <<get_suggest(ip,port,s_ip)
  puts body
end


def get_suggest(ip,port,s_ip)
  body =""
  client = get_db()
  body << set_body(ip,port,s_ip,client)
  return body
end



def set_body(ip,port,s_ip,client)
  body = "ip:#{s_ip} が "
  device_results = get_device_results(client,ip,port)
  if(device_results.size != 0)
    service_results = get_service_results(client,device_results)
    set_body_device_service(body,device_results,service_results)
  else
    body<<" ip:#{ip} と通信しようとしています"
  end
  return body
  #send_mail(body)
end

def get_lan_link(id,password,remote_password)
  body ="以下のリンクにアクセスして、ルール設定の許可をして下さい"
	body<<"\nLAN内からの場合\n"
  body<<"https://192.168.11.11/check.php?id=#{id}&password=#{password}\n"
	body<<"LAN外からの場合\n"
  body<<"https://172.20.67.92/check.php?id=#{id}&password=#{remote_password}\n"
  return body
end

def get_wan_link(id,password)
  body ="以下のリンクにアクセスして、ルール設定の許可をして下さい(LAN内からのみ)"
  body<<"\nhttps://192.168.11.11/check.php?id=#{id}&password=#{password}'\n"
  return body	
end

def get_device_results(client,ip,port)
  sql = %Q{select * from UPnP_List.rootDevice Where ip = '#{ip}' and port = '#{port}'}
  results = client.query(sql)
end

def get_service_results(client,device_results)
  sql = ''
  device_results.each do |record|
    sql = %Q{select D.friendlyName,S.serviceType from UPnP_List.rootDevice D, UPnP_List.service S Where D.deviceID = S.rootUDN and D.deviceID = '#{record['deviceID']}'}
  end
  service_results = client.query(sql)
end
def set_body_device_service(body,device_results,service_results)
  device_results.each do |record|
    deviceType = record['deviceType'].match(%r'.*:(.+?):(.+?)')[1]
    body<<record['friendlyName']
    body<<"(#{deviceType}、#{record['manufacturer']}) を利用しようとしています。\n"
    deviceID = record['deviceID']
  end
  body<<"このデバイスは以下のサービス提供します\n"
  service_results.each do |record|
    serviceType = record['serviceType'].match(%r'.*:(.+?):(.+?)')[1]
    body<<"・#{serviceType}\n"
  end
  return body
end
require 'rbconfig'





def show_all(results)
  results.each do |row|
    row.each do |key,value|
      puts key+'=>'+value
    end
    puts "=============================================="
  end
end

if __FILE__ == $0
    main
end
