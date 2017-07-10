import os
import sys
import getopt

'''
    通过运行脚本，读取文件夹的文件生成目录，为了gitbook
    使用： python3 create_tree -h 查看帮助
'''
# 忽略的文件夹
dirs=['.git','Images','Shell','bat','SQL','ConfigFiles']
flag_show=False
flag_append=False
result = []


def show_help():
    print("使用: python3 create_tree.py [-s] [-a] [-h] ")
    print("参数说明: \n -s     : 控制台显示生成的目录\n -a     : 生成的目录追加到文件中去\n -h     : 帮助")

# 列出所有文件的列表
def listfiles(name):
	#print('_________',name,not os.path.isdir(name))
	lists = []
	dir_list = []
	temp = os.listdir(name)
	for r in temp:
		if(not os.path.isdir(name+'/'+r)):
			lists.append(r)
		else:
			#print("是目录:::::::::::",r)
			dir_list.insert(0, r)
			#lists.insert(0,r)
	lists.sort()
	lists = dir_list + lists
	return lists 
        
# 输出行
def print_line(name,count,path):
    temp=''
    for i in range(1,count+1,1):
        temp = temp+'    '
    temp = temp+'* '
    #print(temp,'[',name,'](./',path,')')
    result.append(temp+'[ '+name[:-3]+' ](./'+path+')')

def print_title(name,count):
	temp=''
	for i in range(1,count,1):
		temp = temp+'    '
	temp = temp+'* '
	# 输出文件夹目录
	#print(temp,name.split('/'))
	result.append(temp+'【 '+name+' 】') 
# 递归
def create(name,count):
    if(os.path.isdir(name)):
        print_title(name,count)
        for fold in listfiles(name):
            if (fold in dirs):
                continue
            if(not os.path.isdir(name+'/'+fold)):
                #print("不是目录--------",fold)
                print_line(fold,count,name+'/'+fold)
            
            create(name+'/'+fold,count+1)
    else:
        return

# 处理参数
opts, args = getopt.getopt(sys.argv[1:], "sha")
for op,value in opts:
    if op == "-s":
        flag_show = True
        #print("show")
    elif op == "-a":
        flag_append = True
        #print("append")
    elif op == "-h":
        show_help()

# 得到根目录下所有文件夹
Folders = os.listdir('./')
Folders.sort()
for fold in Folders:
    if(os.path.isdir(fold)):
        if(fold in dirs):
            continue
        create(fold,1)

# 终端输出
if flag_show : 
    for res in result:
        print(res)     

# 追加到gitbook的目录文件中
if flag_append :
    with open('SUMMARY.md','a') as dest:
        for res in result:
            dest.write(res+'\n')
        
## 要不要直接输出到文件中去呢，这样就不用复制粘贴了，不过为了自由添加 ，还是暂时不去动吧


