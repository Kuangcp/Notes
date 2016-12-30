import zipfile
import os
from threading import Thread
import time
#压缩文件的路径
path = r'F:\\Myth_Notes\\Python\\Python.zip'
#password='1234'
 
def pojie_zip(path,password):
 if path[-4:]=='.zip':
  #path = dir+ '\\' +file
  #print path
  zip = zipfile.ZipFile(path, "r",zipfile.zlib.DEFLATED)
  #print zip.namelist()
  try:
   #若解压成功，则返回True,和密码
   zip.extractall(path='C:\\Users\\Administrator\\Desktop\\',members=zip.namelist() , pwd=password)
   print ' ----success!,The password is %s' % password
   zip.close()
   return True
  except:
   pass #如果发生异常，不报错
  print 'error'
   
   
def get_pass():
 #密码字典的路径
 passPath='F:\\Myth_Notes\\Python\\zip.txt'
 passFile=open(passPath,'r')
 for line in passFile.readlines():
  password=line.strip('\n')
  print 'Try the password %s' % password 
  if pojie_zip(path,password):
   break
 passFile.close()
if __name__=='__main__':
 start=time.clock()
 get_pass()
 print "done (%.2f seconds)" % (time.clock() - start)
