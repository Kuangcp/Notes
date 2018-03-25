import os
import sys
import getopt
import subprocess

'''
    通过运行脚本，读取文件夹的文件生成目录，为了gitbook
    使用： python3 readFolder_tree -h 查看帮助
'''
# 忽略的文件夹
ignoreFolder=['.git', 'SQL', 'Article']
# 所有要被忽略的文件
ignoreFile=['PULL_REQUEST_TEMPLATE.md', 'ISSUE_TEMPLATE.md', 'CODE_OF_CONDUCT.md',
       'README.md', 'CSS3.md', 'HTML5.md']

flag_show=False
flag_append=False
result = []

def showHelp():
    print("使用: python3 readFolder_tree.py [-s] [-a] [-h] ")
    print("参数说明: \n -s     : 控制台显示生成的目录\n -a     : 生成的目录追加到文件中去\n -h     : 帮助")

# 列出所有文件的列表 并排好序
def listFiles(name):
    lists = []
    dir_list = []
    temp = os.listdir(name)
    temp.sort()
    for r in temp:
        if(not os.path.isdir(name+'/'+r)):
            lists.append(r)
        else:
            dir_list.append(r)
    lists.sort()
    lists = dir_list + lists
    return lists 
        
# 处理文件
def handlerFile(name,count,path):
    temp=''
    for i in range(1,count+1,1):
        temp = temp+'    '
    temp = temp+'* '
    # print(temp,'[-',name,'-](./',path,')')
    if not name in ignoreFile:
        result.append(temp+'[ '+name[:-3]+' ](./'+path+')')
        # result.append("<a href='"+path+"'>"+name[:-3]+"</a>")

# 处理标题(文件夹)
def handlerFolder(name,count):
    ''''''
    temp=''
    for i in range(1,count,1):
        temp = temp+'    '
    temp = temp+'* '
    # 输出文件夹目录
    #print(temp,name.split('/'))
    result.append(temp+'【 '+name+' 】') 


# 递归 读取文件夹
def readFolder(name,count):
    if(os.path.isdir(name)):
        handlerFolder(name,count)
        for fold in listFiles(name):
            if fold in ignoreFolder:
                continue
            if not os.path.isdir(name+'/'+fold):
                #print("不是目录--------",fold)
                handlerFile(fold,count,name+'/'+fold)
            
            readFolder(name+'/'+fold,count+1)



Folders = os.listdir('./')
Folders.sort()
# 处理根目录下的md文件
for fold in Folders:
    if fold.endswith('.md'):
        if fold in ignoreFile:
            continue
        #print("md::::"+fold)
        result.append("* [ "+fold[:-3]+" ](./"+fold+")")
        # result.append("<a href='"+fold+"'>"+fold[:-3]+"</a>")

# 得到根目录下所有文件夹，然后开始递归得到所有文件       
for fold in Folders:
    if(os.path.isdir(fold)):
        if(fold in ignoreFolder):
            continue
        readFolder(fold,1)

# 处理参数
opts, args = getopt.getopt(sys.argv[1:], "sha")
for op,value in opts:
    # 只在终端输出
    if op == "-s":
        for res in result:
            print(res) 
    # 追加到gitbook的目录文件中
    elif op == "-a":
        subprocess.call('mv SUMMARY.md SUMMARY.md.bak',shell=True)
        with open('SUMMARY.md','w+') as dest:
            dest.write('# Summary\n\n* [Introduction](README.md)\n\n')
            for res in result:
                dest.write(res+'\n')
        print('重新生成目录树完成!')
    # 帮助信息
    elif op == "-h":
        showHelp()


