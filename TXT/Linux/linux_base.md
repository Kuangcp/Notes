# Linux 系统

## 软件管理
### 安装命令
- 1,deb 安装deb包
	- ` sudo  dpkg  -i  *.deb`
-  2,apt-get
	- `sudo apt-get install xxx`
	- ``
- 3,make install 源代码安装
	    //1.解压缩
		`tar -zxf nagios-4.0.2.tar.gz ` 
		//2.进入目录
		`cd nagios-4.0.2`
		//3.配置
		`./configure --prefix=/usr/local/nagios  `   
		//4.编译
		`make all`
		//5.安装
		`make install && make install-init && make install-commandmode && make install-config`
		
- 1，以root权限打开文件管理
	-   sudo nautilus
- 2，查看已安装的应用
	- dpkg --list
- 3,彻底卸载应用
	- sudo apt-get --purge remove 应用名
- 4，只卸载程序，保留配置文件
	- sudo apt-get remove 应用名

*****

### 创建自定义快捷方式
[Desktop Entry] #每个desktop文件都以这个标签开始，说明这是一个Desktop Entry文件
Version = 1.0 #标明Desktop Entry的版本（可选）
Name = Firefox #程序名称（必须），这里以创建一个Firefox的快捷方式为例
GenericName = Web Browser #程序通用名称（可选）
Comment = A Web Browser #程序描述（可选）
Exec = firefox %u #程序的启动命令（必选），可以带参数运行,当下面的Type为Application，此项有效
Icon = firefox #设置快捷方式的图标（可选）
Terminal = false #是否在终端中运行（可选），当Type为Application，此项有效
Type = Application #desktop的类型（必选），常见值有“Application”和“Link”
Categories = GNOME;Application;Network; #注明在菜单栏中显示的类别（可选）