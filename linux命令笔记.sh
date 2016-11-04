Linux
************************************************************************************************************
1.Vim编辑器
	vim -O2 file1 file2    # 垂直分屏		
	vim -on file1 file2    # 水平分屏
	vim + file			#打开文件并且光标的位置在文件末尾
	vim +n file			#打开文件并且光标的位置在第n行，修改文件时很有用
	vim -r filename		#打开上次vi编辑时发生崩溃的filename，否则需要删除隐藏的备份文件
	vim +/pattern filename  #打开文件并将光标置于第一个与patter匹配的处，并且会高亮显示匹配的字符串
	Ctrl+W [操作]      # 切屏操作
	:n                 # 编辑下一个文件
	:2n                # 编辑下二个文件
	:N                 # 编辑前一个文件
	:rew               # 回到首文件
	200G               # 跳转到第200行，也可以使用:200来完成此功能
	$					#将光标移至当前行的行尾
	0					#将光标移至当前行的行首
	g：                 #将光标移至到第一行
	G:                  #将光标移动至最后一行
	H:					#将光标移至屏幕的顶行
	M:					#将光标移至屏幕的中间行
	L:					#将光标移至屏幕的末行
	:set autoindent    # 设置自动缩进，对编辑shell脚本有帮助
	:set binary        # 改为unix格式，可以使用该方法将window文本格式改成unix脚本格式。也可以使用dos2unix
	:X                  # 文档加密,使得其他用户需要输入口令才可编辑、查看。
	ctrl+ U            # 向前翻页
	ctrl+ D            # 向后翻页
	g/^$/d             #删除文本中的空白行
	:20,30 s/^/#/g     #第20到30行用 # 注释掉
	:20,30 s/^#//g     #取消注释
	:1,$ s/^/#/g      #第1行到结尾用 # 注释掉
	:1,$ d/^#/g       #删除以#号注释的行
	cw:       		#修改单个单词
	c2b:      		#修改向后2个单词
	c$:				#修改当前位置到行尾
	c0：			#修改当前位置到行首
	cc:				#修改整行
	: set  ic：   		#查询时忽略大小写
	: set  noic		#查询时不忽略大小写
	: set  list     #显示不可见字符
	: set  nolist   #取消显示不可见字符
	:! command  	#在vi编辑器里面执行命令
	vi -R filename （view filename）  #以只读的方式来读取内容
	剪切一行：dd
    剪切当前行光标所在的位置到行尾：d$
    剪切当前行光标所在的位置到行首：d^
    剪切切三行：3dd,即从当前行+下两行被剪切了。
	
2.剪切1-10行到20行
2.归档解压缩
	tar tvzf gz.tar.gz          # 查看gz下面的文件列表，使用-v选项可以显示文件列表的属性信息
	tar xvf 1.tar -C 目录        # 解包tar
	tar -cvf 1.tar *             # 打包tar
	tar tvf 1.tar                # 查看tar
	tar -rvf 1.tar 文件名        # 给tar追加文件
	tar --exclude=/home/dmtsai -zcvf myfile.tar.gz /home/* /etc      # 打包/home, /etc ，但排除 /home/dmtsai
	
3.sed流编辑
	sed G       #在每一行后面增加一空行
	sed 10q                                     # 显示文件中的前10行 (模拟"head")
	sed -n '$='                                 # 计算行数(模拟 "wc -l")
	sed -n '5,/^no/p'                           # 打印从第5行到以no开头行之间的所有行
	sed -i '/aaa/,$d'                           # 删除匹配行到文本末尾，-i选项表示是对操作的文本直接操作，会改变文本内容。
	sed -i "s/=/:/g" passwd                     # 直接对文本替换，如果不加g的话只对每一行的第一个=号进行替换
	sed -i "/^pearls/s/$/j/"                    # 找到pearls开头在行尾加j，$符号，可以作为文本末尾，也可以作为行尾。
	sed -n '/1/,/3/p'                           # 打印包含在1和3之间的行，不能缺省-n选项，否则会出现将原文本的内容与截取的行同时打印
	                                            # (-n)选项和p标志一起使用表示只打印那些发生替换的行。
	sed -n '1p' 文件                            # 取出指定行
	sed '5i\aaa' file                           # 在第5行插入行
	sed '5a\aaa' file                           # 在第5行之后抽入行
	sed -e '/a/i\b'                             # 在匹配行前插入一行，-e选项可以用来执行多个指令来完成一系列操作，此处可以省略
	sed -e '/a/a\b'                             # 在匹配行后插入一行
	sed 's/a/&\nb/g'                            # 在匹配行后插入一行，&表示代表查找的串内容，\n表示的是换行符
	sed 's/^192.168.0.1/&localhost/' example    #&符号表示替换换字符串中被找到的部份。所有以192.168.0.1开头的行都会被替换成它自已加 localhost，变成192.168.0.1localhost。
	sed -n '/regexp/!p'                         # 只显示不匹配正则表达式的行
	sed '/regexp/d'                             # 只显示不匹配正则表达式的行
	sed '/baz/s/foo/bar/g'                      # 只在行中出现字串"baz"的情况下将"foo"替换成"bar" 
	sed '/baz/!s/foo/bar/g'                     # 将只在行中未出现字串"baz"的情况下替换"foo"成"bar"
	sed -e 's/a/#&/g'                           # 在a前面加#号
	sed 's/foo/bar/4'                           # 只替换每一行中的第四个出现的字串，如sed 's/:/=/' passwd
	sed -e '1,5d' -e 's/test/check/' example    #(-e)选项允许在同一行里执行多条命令。如例子所示，第一条命令删除1至5行，第二条命令用check替换test。命令的执 行顺序对结果有影响。如果两个命令都是替换命令，那么第一个替换命令将影响第二个替换命令的结果。
	sed 'n;d'                                     # 删除所有偶数行,n选项表示读取下一行
	sed 'G;G'                                     # 在每一行后面增加两空行
	sed '/^$/d;G'                                 # 在输出的文本中每一行后面将有且只有一空行
	sed 'n;n;n;n;G;'                              # 在每5行后增加一空白行
	sed -n '3,${p;n;n;n;n;n;n;}'                  # 从第3行开始，每7行显示一次
	ls -l|sed -n '/^.rwx.*/p'                     # 查找属主权限为7的文件
	sed '/test/r file' example                    #file里的内容被读进来，显示在与test匹配的行后面，如果匹配多行，则file的内容将显示在所有匹配行的下面。
	sed -n '/test/w file' example                 #在example中所有包含test的行都被写入file里。

4.grep命令
	
    grep ‘energywise’ *           #在当前目录搜索带'energywise'行的文件
		如：grep -l 'dt_个险_险种_增量.log' *.sh 在当前目录下查找以.sh结尾的包含“dt_个险_险种_增量.log”的文件，并显示出文件名字
	grep -r ‘energywise’ *        #在当前目录及其子目录下搜索'energywise'行的文件
	grep -l -r ‘energywise’ *     #在当前目录及其子目录下搜索'energywise'行的文件，但是不显示匹配的行，只显示匹配的文件
	grep -l -r '续期收费*' /root/shell  在/root/shell及其子文件夹中查找包含“续期收费”的文件，并将路径打印出来
5.find 命令
	find查找{

		# linux文件无创建时间
		# Access 使用时间  
		# Modify 内容修改时间  
		# Change 状态改变时间(权限、属主)
		# 时间默认以24小时为单位,当前时间到向前24小时为0天,向前48-72小时为2天
		# -and 且 匹配两个条件 参数可以确定时间范围 -mtime +2 -and -mtime -4
		# -or 或 匹配任意一个条件

	find /etc -name http         # 按文件名查找
	find . -type f               # 查找某一类型文件，可以用来查询当前目录下所有的目录，如： find . -type d
	find / -perm                 # 按照文件权限查找,查询当前目录下权限为644的文件或目录  如： find . -perm 644 | xargs ls -ld 
	find / -user                 # 按照文件属主查找
	find / -group                # 按照文件所属的组来查找文件
	find / -atime -n             # 文件使用时间在N天以内,可以使用stat filename 来查看文件的详细的时间选项，之内的是-号，之前的是+号
	find / -atime +n             # 文件使用时间在N天以前
	find / -mtime -n             # 文件内容改变时间在N天以内
	find / -mtime +n             # 文件内容改变时间在N天以前
	find / -ctime +n             # 文件状态改变时间在N天前
	find / -ctime -n             # 文件状态改变时间在N天内
	find 路径 -name *name1* -or -name *name2*               # 查找任意一个关键字
	for i in `seq 100`;do touch foo$i;done 将for循环写在一行
	find /usr -not(-user root -o -user bin -o -user student) #查找/usr目录下不属于root,bin,或student的文件
	find /usr -not -user root -a -not -user bin -a -not -user student  #查找/usr目录下不属于root,bin,或student的文件
	find /etc -mtime -7 -a -not -user root -a -not -user student # 查找/etc目录下最近一周内内容修改过切不属于root及student用户的文件
	find / -not -type d -a -nouser -exec rm -f {}  #删出类型不是目录，而且没有属主的文件
	find / -not -type d -a -nouser | xargs -i rm -f {}   #删出类型不是目录，而且没有属主的文件
6.修改主机名：
	vi /etc/hosts
	vi /etc/sysconfig/network
7.查看当前系统支持的语言编码及修改语言编码的配220.181.111.188置文件：
	locale
	vi /etc/sysconfig/i18n 
8.执行DNS域名解析服务器
	vi /etc/resolv.conf
	内容如下：
		nameserver 192.168.100.6
		nameserver  8.8.8.8
		nameserver  8.8.6.6
	注意：当我们安装完Linux操作系统以后是不能够使用ping www.baidu.com来测试是否连通外网，可能只是由于没有指定域名服务器。
	ping 220.181.111.188 是可以ping通的，220.181.111.188 是百度的服务器的IP
9.配置sendmail的时候可通过编辑配置文件来群发邮件
	vi /etc/aliases，并在结尾行加入 用户的组名：	用户名1,用户名2..
	在创建用于接收邮件的用户名时，可以将-s选项指定为/sbin/nologin
		如：groupadd mailtest
		useradd -g mailtest -s /sbin/nologin zhanglei1
		useradd -g mailtest -s /sbin/nologin zhanglei2
10.显示网络的接口信息：
	ip addr show（类似于ifconfig）
	为网络接口添加（删除）一个ip:
		ip addr add（删除） 192.168.100.11/24 dev eth0
	禁止和激活网卡接口：
		ip link set eth1  down（up）
	查看路由表的方法：
		ip route show
	
11.扫描多个端口号：
	nc -v -z -n -w 4 192.168.100.6 1-100
	扫描端口号从1到100有哪个端口是开启的（succeeded）
	-z 选项：一旦建立连接后马上断开，而不发送和接收任何数据。 
	-v 选项：打印详细输出信息。 
	-n 选项：直接使用IP 地址，而不使用域名服务器来查询其域名。
	-w 选项：设置连接的超时时间，单位为秒。 
	-u 选项：使用UDP 建立连接。
	上面命令无此（-u）设置，则表示使用TCP 建立连接。
	
	使用nc -v -l 12345 < book_out.txt 在发送端启用12345 端口来发送文件内容
	使用nc -v -n 12345 > book_in.txt  在接收端通过12345 端口来接收文件
		
12.使用yum安装了哪些程序包：
	cat /var/log/yum.log
	
13.Linux 查看mx记录：
	nslookup -query=mx 163.com
	Windows 查看mx记录
		nslookup -qt=mx 163.com
14.mount
	-o options 主要用来描述设备或档案的挂接方式。 
	loop：用来把一个文件当成硬盘分区挂接上系统 
	mount -o loop -t iso9660 /home/sunky/mydisk.iso /mnt/vcdrom  挂载光盘的镜像文件
15.rpm：
使用rpm已经安装的软件查询
	rpm -qf  filename    #查询一个已经安装的文件属于哪个软件包
	rpm -ql  软件名    #查询安装的软件包安装到何处
	rpm -qi  软件名	 #查询一个已经安装的软件包的信息
	rpm -qc  软件名  #查询一个已经安装的软件包的配置文件
	rpm -qd   软件名  #查询一个已经安装软件的文档安装位置
	rpm -qR   软件名  #查看一下已经安装软件所依赖的软件包及文件
未使用rpm安装的软件包查询，加入参数p
	如 rpm -qpl  filename.rpm 查看filename安装包安装到何处
16.有时不能通过管道来传送参数时，需要使用xargs命令来解决，xargs在执行命令时，如果需要对文件进行操作，需要使用-i选项，{}也表示要操作的文件
17.dig:
	dig +trace www.baidu.com  #从根域开始追踪一个域名的解析过程
18.curl -O filepath （wget filepath） 下载文件
19.traceroute 和tracepath 命令功能类似，不需要root权限，traceroute 能追踪出道指定目的地址的网络路径，并给出路径上的每一跳，可以通过traceroute查处网络在哪里断了或是慢了。
如：traceroute www.baidu.com
    tracepath www.baidu.com
20.mtr命令把ping命令和tracepath命令合成一个，mtr会持续发包，并显示每一跳ping所用的时间，也会显示过程中的任何问题。
如：mtr www.baidu.com
21.host命令用来做DNS查询，命令参数是域名，命令输出关联的IP,如果命令的参数是IP，命令则输出关联的域名：
如：host www.baidu.com 
	host 220.181.112.244   
22.users  显示当前登录系统的用户
23.who  登录在本机系统的用户
   -H（--heading）： 显示各栏位的标题信息
24.set   显示环境变量和普通变量
25.env   显示环境变量
26.export 把普通变量变成环境变量
27.unset  删除一个环境变量
28.diff
  -b： 不检查空格字符的不同
  -B： 不检查空白行
  -i：不检查大小写
  -q：仅显示差异而不显示详细信息
29.cat -b 与-n选项相似，区别是-b选项对空白行不编号
30.chattr 
   -i：不得任意修改文件或目录
   -a：让文件或目录仅供附加用途，常用于日志操作：
   chattr -a  install.log
31.lsattr filename（dirname） 来查看文件的属性 
32. chgrp -v bin  log2012  修改文件的群组属性
    chgrp --referenece=log2012.log  log2013.log  根据指定文件改变文件的群组属性
33.ifup（ifdown） eth0 启动或关闭网络接口
34.route -nee 显示路由详细（ee）信息
   route add [-net|-host] [网络或主机] netmask [mask] [gw|dev]
   route del [-net|-host] [网络或主机] netmask [mask] [gw|dev]
   route del -net 169.254.0.0 netmask 255.255.0.0 dev eth0 删除路由
   route add -net 192.168.100.0 netmask 255.255.255.0  dev eth0  增加路由（增加的路由必须能够与你的网络互通）
   route add default gw 192.168.100.4 增加默认路由 192.168.100.4要与你的LAN网络互通才行
35.ip [-s] link show 查看接口参数 类似于ifconfig
   ip -s link show eth0
   ip link set [device] [动作与参数]
   ip link set eth0 up (down) 启动或关闭网络接口
   ip link set eth0 mtu 1000 更改mtu的值
   ip link set eth0 name vbird 修改网卡代号（前提时网卡要先关闭）
   ip link set eth0 address MAC 网卡支持MAC修改的话，可以修改
   
   ip address show 显示所有网络接口与IP参数
   ip address add 192.168.100.13/24 broadcast +  dev eth0 label eth0：vbird （broadcast + 可以写成192.168.100.255）
   
   ip route show 显示路由信息
   ip route [add|del] [IP或网络] [via gateway] [dev 装置]
   ip route add 192.168.5.0/24 dev eth0 增加与本机直接可联通的网络
   ip route add 192.168.10.0/24 via 192.168.5.100 dev eth0
   ip route add default via 192.168.1.254 dev eth0
   ip route del 192.168.10.0/24
   ip route del 192.168.5.0/24

36.linux操作系统下双网卡绑定有七种模式:
   0. round robin(常用)
   1.active-backup(常用)
   2.load balancing (xor)
   3.fault-tolerance (broadcast)
   4.lacp
   5.transmit load balancing
   6.adaptive load balancing
   
   vim /etc/modprobe.conf      #编辑bond0该配置文件
   cat /proc/net/bonding/bond0  #查看bond0的信息
37.在Linux下生成随机密码之一：
   cat /dev/urandom|tr -dc "a-zA-Z0-9-_\$\?\*\%\$\@\(\)\_\+"|fold -w 13|head 

38. for((i=0; i<5; i++))
    do
		echo "hello"
	done
39.less file
   g:光标移动到第一行
   G:光标移动到最后一行   
   v：使用vi编辑器进行编辑，先点击v，在点击i进行插入编辑
   h：显示less的帮助文档
   ma：使用a标记文本的当前位置
   一个单引号a: 导航到标记a处
40.traceroute :
	-n:不对主机名称解析，单纯使用IP
	-U：使用UDP协议侦测 port：33434 预设的侦测方式
	-I：使用ICMP的方式侦测
	-T：使用TCP协议来侦测
	-p： 可以使用自定义的端口号
41.netstat -r（route -n）
42.patch
单个文件
	diff –uN from-file to-file >to-file.patch
	patch –p0 < to-file.patch
	patch –RE –p0 < to-file.patch

多个文件:
	diff –uNr from-docu to-docu >to-docu.patch
	patch –p1 < to-docu.patch
	patch –R –p1 <to-docu.patch
43.cat /etc/redhat-release 查看操作系统版本
	cat /etc/issue 查看操作系统版本
44./etc/login.defs  #映射密码文件配置
	chage -l username  查看用户的口令的详细信息（包括创建时间，口令失效日期等等）
	usermod -c "zhanglei'scount"  zhanglei  为用户添加注释  cat /etc/passwd
	usermod -L  zhanglei    #锁定zhanglei用户
	usermod -U  zhanglei	#解锁zhanglei用户
	usermod -u 888 zhanglei   #修改用户的UID值
45.chattr 文件隐藏属性
	chatrr +-=  增加、减少、设定
	chattr -a 只能追加不能删除，非root用户不能设定该属性
	chattr -i 使文件不能被删除、重命名、设定链接、写入、新增数据
	lsattr 用来读取文件或者目录的特殊权限
	lsattr -a 联通隐藏文件一同列出
	lsattr -R 连同子目录一同类出
	lsattr -d 只显示目录本身
46.特殊权限 suid
该权限只针对二进制可执行文件，使得文件在执行阶段具有文件所有者的权限，如passwd
	chmod u+s  /usr/bin/passwd
	chmod u-s  /usr/bin/passwd
   特殊权限 sgid
让普通用户临时拥有所属组的权限
	chmod g+s 目录
	chmod g-s 目录
当一目录不想让其他用户删除时，使用sticky_bit(粘贴位)
	chmod o+t  目录
47.查看磁盘的UUID及分区类型： blkid
48.swapon -a     重新挂载swap分区
   swapoff -a    卸载swap分区  通过free -h 查看swap分区total是否有值
   将新划分区格式化交换分区：  mkswap /swap-file   （dd if=/dev/zero of=/swap-file  bs=1M count=1024）
   查看swap分区状态： mkswap -L swap-disk  /dev/sda6
49.Linux内核通过/proc虚拟文件系统向用户导出内核信息，用户也可以通过/proc文件系统或通过sysctl命令动态配置内核。比如，如果我们想启动NAT，除了加载模块、配置防火墙外，还需要启动内核转发功能。我们有三种方法：

	1) 直接写/proc文件系统
		# echo 1 > /proc/sys/net/ipv4/ip_forward

	2) 利用sysctl命令
		# sysctl -w net.ipv4.ip_forward=1
		sysctl -a可以查看内核所有导出的变量

	3) 编辑/etc/sysctl.conf
	添加如下一行，这样系统每次启动后，该变量的值就是1
		net.ipv4.ip_forward = 1
50.修改语言编码设置
	vi /etc/sysconfig/i18n
	#LANG="en_US.UTF-8"
	LANG="zh_CN.gb2312"
	SYSFONT="latarcyrheb-sun16"
	source /etc/sysconfig/i18n 无需重启，立即生效


