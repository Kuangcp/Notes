##安装
* 下载zip包解压，将bin目录配置至PATH
* 修改conf下53行的setting标签，指定本地仓库的路径
* 在eclipse或Myeclipse中add，并采用自己的setting文件

*************************************************************
##Maven常用命令:

* mvn archetype:generate ：创建 Maven 项目
* mvn compile ：编译源代码
* mvn test-compile ：编译测试代码
* mvn test ： 运行应用程序中的单元测试
* mvn site ： 生成项目相关信息的网站
* mvn clean ：清除目标目录中的生成结果
* mvn package ： 依据项目生成 jar 文件
* mvn install ：在本地 Repository 中安装 jar
* mvn deploy：将jar包发布到远程仓库
* mvn eclipse:eclipse ：生成 Eclipse 项目文件

Maven和Ant的区别一:

1.ant脚本是可以直接运行在maven中的。maven和ant最大的差别就是在于maven的编译以及所有的脚本都有一个基础，就是POM（project object model）。这个模型定义了项目的方方面面，然后各式各样的脚本在这个模型上工作，而ant完全是自己定义，显然maven更胜一筹。

2.maven对所依赖的包有明确的定义，如使用那个包，版本是多少，一目了然。而ant则通常是简单的inclde 所有的jar。导致的最终结果就是，你根本无法确定JBoss中的lib下的common－logging 是哪个版本的，唯一的方法就是打开 META－INF 目录下MANIFEST.MF。

3.maven是基于中央仓库的编译，即把编译所需要的资源放在一个中央仓库里，如jar，tld，pom，等。当编译的时候，maven会自动在仓库中找到相应的包，如果本地仓库没有，则从设定好的远程仓库中下载到本地。这一切都是自动的，而ant需要自己定义了。这个好处导致的结果就是，用maven编译的项目在发布的时候只需要发布源码，小得很，而反之，ant的发布则要把所有的包一起发布，显然maven又胜了一筹。

4.maven有大量的重用脚本可以利用，如生成网站，生成javadoc，sourcecode reference，等。而ant都需要自己去写。

5.maven目前不足的地方就是没有象ant那样成熟的GUI界面，不过mavengui正在努力中。目前使用maven最好的方法还是命令行，又快又方便
2

Maven的优势:

•协同开发的基本规范，为大家提供方便的协作的模式，能增加代码的复用，提高生产率。

•提供方便，规范化的打包方法，是公司完成自动构建系统的核心部分，能帮助提高敏捷开发的效率(敏捷开发提倡尽早集成)。

•减少冗余，减少出错的可能。

•中心资源库管理，能减低源码库的大小，中心资源库可以统一定期备份。

•目录结构规范，让开发者从一个maven项目过度到另一maven项目很容易。

•大量的开源项目使用了maven。