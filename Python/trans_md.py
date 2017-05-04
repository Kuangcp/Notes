#!/usr/bin/python3
# 处理 markdown 常用操作
# 目录采用的URL的编码，要用这个实现转码
import urllib.parse
print("1 行首添加 - \n")
print("2 生成文档目录\n")
print("3 测试  \n")
############
choose = input("请输入操作")
#choose = "2"
#print(choose)

def openfile():
    filepath = input("请输入文件完整路径或者直接拖动文件到终端")
    filepath = filepath.replace("'"," ").strip()
    print("输入的是：",filepath)
    file =  open(filepath,"r+")
    return file

if(choose == "1"):
    file = openfile()
    file.write("\n")
    for line in file:
        print("- ",line)
        file.write("- "+line)
elif(choose == "2"): 
    file = openfile()
    file.write("\n\r")
    for line in file:
        if(line.startswith("#")):
            line = line.strip('\n')
            weight = line.count("#")
            tab = ""
            # 空格格式的安排
            for i in range(weight-1):
                tab+="    "
            line = line.replace("#","").strip()
            temp = line
            line = line.replace(".","").strip()
            line = line.replace(" ","").strip()
            # 将中文和特殊字符进行URL编码
            result = urllib.parse.quote_from_bytes(line.lower().encode('utf-8'))
            file.write(tab+"- ["+temp+"](#"+result+")\n")
            print(tab+"- ["+temp+"](#"+result+")\n")
            
elif(choose == "3"):
    print(urllib.parse.quote_from_bytes(".Redis资料篇".lower().encode('utf-8'))) 
    file = openfile()
    for line in file:
        print(line)
    file.close()
    #temp = "资料篇".encode('utf-8')
    #print(temp)
    #print(temp.encode('utf-8'))
    
    
    
# 测试文件：/home/mythos/Documents/Notes/Myth_Notes/Python/zip.txt
# /home/mythos/Documents/Notes/Myth_Notes/TXT/Linux/Docker.md



