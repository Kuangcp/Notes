import os
import subprocess

# 2017-06-11 18:48:38
paths =[
    '/home/kcp/Documents/Notes/Code_Notes#技术笔记',
    '/home/kcp/Documents/Notes/GhostPushLight#鬼吹灯项目',
    '/home/kcp/Documents/Notes/diary#个人日记',
    '/home/kcp/Documents/Notes/Kuangcp.github.io#个人博客',
    '/home/kcp/IdeaProjects/TestRun/MythRedis#客户端',
    '/home/kcp/PycharmProjects/LearnPython#python学习记录',
    '/home/kcp/IdeaProjects/SpringBoot/JavaBase#Java基础学习',
    '/home/kcp/IdeaProjects/SpringBoot/JavaToolKit#Java工具包',
    '/home/kcp/IdeaProjects/test/RedisLearning#Redis学习记录之Java'
]




# 执行命令,如果仓库没有变动就不输出
def command(cmd):
    result=[]
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in p.stdout.readlines():
        line = line.decode()
        if(line != "无文件要提交，干净的工作区\n"):
            result.append(line.rstrip())
            #print(">"+line+"<")
        else:
#            print("？？？？")
            result = []
            return 0 # 如果没有变动就直接退出，不输出了   
# 输出所有结果              
    for re in result:
        print("> ",re)
#        result.remove(re)
          

def hang(count,name):
    print(".....................................................................",count,"\n",name)

def title(title):
    print("                          "+title)


def print_info(path,count):
    
    temp = path.split("#")[0]
    name = path.split("#")[1]
    hang(count,path)
#    result.append("             "+name+"\n")
#    title(name)
#    hang()
    command('cd '+temp+' && git status')
#    result = [] 
    #os.system('cd '+temp+' && git status')

# 主要部分
count = 0
for path in paths:    
    count = count+1
#    print(path)
    print_info(path,count)
    
    
    
    
#    hang()
#command("cd /home/kcp/IdeaProjects/TestRun/MythRedis && git status")










