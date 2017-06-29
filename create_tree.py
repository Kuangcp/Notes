import os

# 忽略的文件夹
dirs=['.git','Images','Shell','bat','SQL','ConfigFiles']


result = []
# 列出所有文件的列表
def listfiles(name):
	#print('_________',name,not os.path.isdir(name))
	lists = []
	temp = os.listdir(name)
	for r in temp:
		if(not os.path.isdir(name+'/'+r)):
			lists.append(r)
		else:
			#print("是目录:::::::::::",r)
			lists.insert(0,r)
	
	return lists 
        
# 输出行
def print_line(name,count,path):
    temp=''
    for i in range(1,count+1,1):
        temp = temp+'    '
    temp = temp+'* '
    
    #print(temp,'[',name,'](./',path,')')
    result.append(temp+'[ '+name+' ](./'+path+')')

def print_title(name,count):
	temp=''
	for i in range(1,count,1):
		temp = temp+'    '
	temp = temp+'* '
	print(temp,name.split('/'))
	result.append(temp+name)      
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


# 得到根目录下所有文件夹
Folders = os.listdir('./')
for fold in Folders:
    if(os.path.isdir(fold)):
        if(fold in dirs):
            continue
        create(fold,1)
 
for res in result:
	print(res)     

## 要不要直接输出到文件中去呢，这样就不用复制粘贴了，不过为了自由添加 ，还是暂时不去动吧


