`目录 start`
 
- [算法](#算法)
    - [匹配算法](#匹配算法)
    - [安全](#安全)
        - [密码学](#密码学)
            - [Diffie-Hellman Key Exchange算法](#diffie-hellman-key-exchange算法)

`目录 end` *目录创建于2018-01-20*
****************************************
# 算法


## 匹配算法
- [字符串相似度匹配](http://zjwyhll.blog.163.com/blog/static/75149781201281142630851/)


## 安全

### 密码学

#### Diffie-Hellman Key Exchange算法
> Whitfield Diffie 和 Martin Hellman ，他们于２０１５年获得了计算机科学领域的最高奖：图灵奖

![码农翻身](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/arithmetic/Diffie-HellmanKeyExchange.png)

6. 最后神奇的魔法发生了， 我们两个得到了同样的值 s = 10！
-  这个s 的值只有我们两个才知道，  其实就是密钥了， 可以用来做加密解密了（ 当然，这只是一个例子，实际的密钥不会这么短）， 我们俩的通讯从此就安全了。
    -  “数学家小帅哥说了， 原因很简单，(gｘ mod p)ｙ mod p　和　(gｙ mod p)ｘ mod p　是相等的！ ”
    -  “那黑客不能从公开传输的 p = 17, g = 3, a = 6 , b = 12 推算出s = 10 吗？” 我问道。
    -  “当然不能， 不过前提是需要使用非常大的p , x, y,  这样以来，即使黑客动用地球上所有的计算资源， 也推算不出来。 ”