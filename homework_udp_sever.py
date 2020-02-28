from socket import *
addr=('127.0.0.1',8088)
sockfd=socket(AF_INET,SOCK_DGRAM)
sockfd.bind(addr)
f=open('gg.jpg','wb')
while True:
    data,addr=sockfd.recvfrom(1024)
    if not data:
        break
    f.write(data)
    f.flush()
    sockfd.sendto(b'Thanks',addr)
f.close()
sockfd.close()
