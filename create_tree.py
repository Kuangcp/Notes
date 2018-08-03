import os
import sys
import getopt
import subprocess

'''
    通过运行脚本，读取文件夹的文件生成目录，为了gitbook和wiki
    使用： python3 create_tree.py -h 查看帮助
'''
# 忽略的文件夹
ignoreFolder=['.git', 'backup']
# 所有要被忽略的文件
ignoreFile=['PULL_REQUEST_TEMPLATE.md', 'ISSUE_TEMPLATE.md', 'CODE_OF_CONDUCT.md',
       'README.md', 'Readme.md', 'CSS3.md', 'HTML5.md', '_Sidebar.md']
result = []

def showHelp():
    print("使用: python3 readFolder_tree.py [-s] [-a] [-h] ")
    print("参数说明: \n -s     : 控制台显示生成的目录\n -a     : 生成的目录追加到文件中去\n -w     : 生成Wiki格式目录\n -h     : 帮助")

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
def handlerFile(name, count, path, wiki=False):
    temp = '    '*count
    if not name in ignoreFile:
        if wiki == False:
            result.append(temp+'* [ '+name[:-3]+' ](/'+path+')')
        else:
            result.append(temp+'* ['+name[:-3]+']('+name[:-3]+')')  # wiki 目录

# 处理标题(文件夹)
def handlerFolder(name, count):
    temp = '    '*(int(count)-1)
    result.append(temp+'* 【 '+name+' 】') 

# 递归 读取文件夹
def readFolder(name, count, wiki=False):
    handlerFolder(name,count)
    for fold in listFiles(name):
        if fold in ignoreFolder:
            continue
        if not os.path.isdir(name+'/'+fold):
            handlerFile(fold, count, name+'/'+fold, wiki)
        else:
            readFolder(name+'/'+fold, count+1, wiki)

def readAll(wiki=False):
    Folders = os.listdir('./')
    Folders.sort()
    # 处理根目录下的md文件
    for fold in Folders:
        if fold.endswith('.md') and not fold in ignoreFile:
            if wiki == False:
                result.append("* [ "+fold[:-3]+" ](./"+fold+")")
            else:
                result.append("* [ "+fold[:-3]+" ]("+fold[:-3]+")")
    # 得到根目录下所有文件夹，然后开始递归得到所有文件       
    for fold in Folders:
        if os.path.isdir(fold) and not fold in ignoreFolder :
            readFolder(fold, 1, wiki)

# 处理参数
opts, args = getopt.getopt(sys.argv[1:], "shaw")
for op,value in opts:
    # 只在终端输出
    if op == "-s":
        readAll()
        for res in result:
            print(res) 
    # 追加到SUMMARY
    elif op == "-a":
        readAll()
        subprocess.call('mv SUMMARY.md SUMMARY.md.bak',shell=True)
        with open('SUMMARY.md','w+') as dest:
            dest.write('# Summary\n\n* [ Introduction ](README.md)\n\n')
            for res in result:
                dest.write(res+'\n')
        print('重新生成目录树完成!')
    # 追加到 _Sidebar.md
    elif op == "-w":
        readAll(True)
        with open('_Sidebar.md','w+') as dest:
            dest.write('* [ Introduction ](Home)\n')
            for res in result:
                dest.write(res+'\n')
    # 帮助信息
    elif op == "-h":
        showHelp()
