import socket
import re

M_SEARCH  = 'M-SEARCH * HTTP/1.1\r\n'
M_SEARCH += 'MX: 3\r\n'
M_SEARCH += 'HOST: 239.255.255.250:1900\r\n'
M_SEARCH += 'MAN: "ssdp:discover"\r\n'
M_SEARCH += 'ST: upnp:rootdevice\r\n'
M_SEARCH += '\r\n'


s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
s.settimeout(5)   # 5秒でタイムアウト
#s.bind(('', 1900))

# M-SEARCHをマルチキャストする
s.sendto(M_SEARCH.encode('utf-8'), ('239.255.255.250', 1900))
f = open('rootdevice.txt','w+')
while True:
    try:
        response, address = s.recvfrom(8192)
        #address = ''.join(map(str,address))
        st ='from '+address[0]+' '+str(address[1])+'\r\f'
        f.write(st)
        res = response.decode('utf-8')

        #res = re.sub('\r\n'.encode('utf-8'),'¥n'.encode('utf-8'),response)
        f.write(res)
        f.write('=' * 40)
        f.write('\r\f')
    except (socket.timeout, e): # タイムアウトしたときの処理
        print ('timeout\n'+e)
        break

s.close()
f.close()
