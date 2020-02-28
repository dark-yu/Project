"""
第二种方案
"""
from socket import *
addr=('127.0.0.1',8088)
sockfd=socket(AF_INET,SOCK_DGRAM)
file=input("请输入需要上传的图片：")
f=open(file,'rb')
while True:
    data=f.readline(1024)
    if not data:
        break
    sockfd.sendto(data,addr)
    data,addr=sockfd.recvfrom(1024)
    print("rece:",data)
f.close()
sockfd.close()