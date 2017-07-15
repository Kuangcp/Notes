'''
    输出帮助文档，命令最长25
'''

def read_alias():
    contents = []
    with open('/home/kcp/.bash_aliases') as alias:
        lines = alias.readlines()
        for line in lines:
            line = line.strip()
            #print(line)
            if line == '' or line == ' ':
                continue
            else:
                contents.append(line)
    return contents

def divide_str():
    contents = read_alias()
    #print(contents)
    result = []
    for line in contents:
        if line.startswith('\n'):
            continue
        elif line.startswith('#'):
            result.append(line)
        else :
            temp = line.split('=')
            #print(temp)
            name = temp[0].split(' ')[1]
            comment = temp[1].split('#')[1]
            result.append(name+'$'+comment.strip())
    return result

def out_help():
    command_len = 23
    result = divide_str()
    for line in result:
        if line.startswith('#'):
            print('-'*55+' 【'+line[2:]+'】')
        else:
            temp = line.split('$')
            space = command_len - len(temp[0])
            print(temp[0], ' '*space,temp[1])

def main():
    out_help()
        
main()
