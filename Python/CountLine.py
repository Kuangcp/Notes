#coding=utf-8
'''
Created on 2016年10月5日
@author: Myth
@TODO只能统计当前文件夹下声明了的文件后缀，需要改进：
递归检索同级目录及其子文件夹下的所有文件的行数

   原作： E-Mail    : Mike_Zhang@live.com
'''
import sys,os

extens = [".py",".java",".txt",".bat",".sql",".md",".xml",".properties",".js",".css",".html",".jsp"]

linesCount = 0
filesCount = 0
outfile = open('out.txt','w+')

def funCount(dirName):
    global extens,linesCount,filesCount
    for root,dirs,fileNames in os.walk(dirName):
        for f in fileNames:
            fname = os.path.join(root,f)
            try :
                ext = f[f.rindex('.'):]
                if(extens.count(ext) > 0):
                    '''print 'support'''
                    filesCount += 1
                    '''print fname'''
                    l_count = len(open(fname).readlines())
                    print fname," :  ",l_count
                    
                    outfile.write(fname+" : "+str(l_count)+"\n")
                    
                    linesCount += l_count
                    
                else:
                    print ext," : not support"
            except:
                '''print "Error occur!"'''
                pass

'''
获取这个脚本的同级目录及其子目录所有文件
if len(sys.argv) > 1 :
    for m_dir in sys.argv[1:]:        
        print m_dir
        funCount(m_dir)
else :
    funCount(".")        
'''
path = raw_input('input a string:')

funCount(path)
print "files count : ",filesCount
print "lines count : ",linesCount
outfile.write("\n--------------------------\nfiles count :"+str(filesCount)+"\nlines count : "+str(linesCount))
outfile.close()
raw_input("Press Enter to continue") 
