#!/usr/bin/python3
# 处理 markdown 常用操作
print("1 生成文档目录\n")
print("2 行首添加 - \n")
############
choose = input("请输入操作")
#choose = "2"
print(choose)
if(choose == "1"):
    filepath = input("请输入文件全路径")
    print("输入的是：",filepath)
    file =  open(filepath,"r+")
    file.write("\n")
    for line in file:
        print("- ",line)
        file.write("- "+line)
elif(choose == "2"): 
    filepath = input("请输入文件全路径")
    print("输入的是：",filepath)
    file =  open(filepath,"r+")
    file.write("\n\r")
    for line in file:
        if(line.startswith("#")):
            #print(line)
            #print(line.count("#"))
            line = line.strip('\n')
            weight = line.count("#")
            tab = ""
            for i in range(weight-1):
                tab+="    "
            line = line.replace("#","").strip()
            print(tab+"- ["+line+"](#"+line+")")
            file.write(tab+"- ["+line+"](#"+line+")\n")
# 测试文件：/home/mythos/Documents/Notes/Myth_Notes/Python/zip.txt
# /home/mythos/Documents/Notes/Myth_Notes/TXT/Linux/Docker.md
