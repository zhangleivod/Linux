Linux
************************************************************************************************************
1.Vim�༭��
	vim -O2 file1 file2    # ��ֱ����		
	vim -on file1 file2    # ˮƽ����
	vim + file			#���ļ����ҹ���λ�����ļ�ĩβ
	vim +n file			#���ļ����ҹ���λ���ڵ�n�У��޸��ļ�ʱ������
	vim -r filename		#���ϴ�vi�༭ʱ����������filename��������Ҫɾ�����صı����ļ�
	vim +/pattern filename  #���ļ�����������ڵ�һ����patterƥ��Ĵ������һ������ʾƥ����ַ���
	Ctrl+W [����]      # ��������
	:n                 # �༭��һ���ļ�
	:2n                # �༭�¶����ļ�
	:N                 # �༭ǰһ���ļ�
	:rew               # �ص����ļ�
	200G               # ��ת����200�У�Ҳ����ʹ��:200����ɴ˹���
	$					#�����������ǰ�е���β
	0					#�����������ǰ�е�����
	g��                 #�������������һ��
	G:                  #������ƶ������һ��
	H:					#�����������Ļ�Ķ���
	M:					#�����������Ļ���м���
	L:					#�����������Ļ��ĩ��
	:set autoindent    # �����Զ��������Ա༭shell�ű��а���
	:set binary        # ��Ϊunix��ʽ������ʹ�ø÷�����window�ı���ʽ�ĳ�unix�ű���ʽ��Ҳ����ʹ��dos2unix
	:X                  # �ĵ�����,ʹ�������û���Ҫ�������ſɱ༭���鿴��
	ctrl+ U            # ��ǰ��ҳ
	ctrl+ D            # ���ҳ
	g/^$/d             #ɾ���ı��еĿհ���
	:20,30 s/^/#/g     #��20��30���� # ע�͵�
	:20,30 s/^#//g     #ȡ��ע��
	:1,$ s/^/#/g      #��1�е���β�� # ע�͵�
	:1,$ d/^#/g       #ɾ����#��ע�͵���
	cw:       		#�޸ĵ�������
	c2b:      		#�޸����2������
	c$:				#�޸ĵ�ǰλ�õ���β
	c0��			#�޸ĵ�ǰλ�õ�����
	cc:				#�޸�����
	: set  ic��   		#��ѯʱ���Դ�Сд
	: set  noic		#��ѯʱ�����Դ�Сд
	: set  list     #��ʾ���ɼ��ַ�
	: set  nolist   #ȡ����ʾ���ɼ��ַ�
	:! command  	#��vi�༭������ִ������
	vi -R filename ��view filename��  #��ֻ���ķ�ʽ����ȡ����
	����һ�У�dd
    ���е�ǰ�й�����ڵ�λ�õ���β��d$
    ���е�ǰ�й�����ڵ�λ�õ����ף�d^
    ���������У�3dd,���ӵ�ǰ��+�����б������ˡ�
	
2.����1-10�е�20��
2.�鵵��ѹ��
	tar tvzf gz.tar.gz          # �鿴gz������ļ��б�ʹ��-vѡ�������ʾ�ļ��б��������Ϣ
	tar xvf 1.tar -C Ŀ¼        # ���tar
	tar -cvf 1.tar *             # ���tar
	tar tvf 1.tar                # �鿴tar
	tar -rvf 1.tar �ļ���        # ��tar׷���ļ�
	tar --exclude=/home/dmtsai -zcvf myfile.tar.gz /home/* /etc      # ���/home, /etc �����ų� /home/dmtsai
	
3.sed���༭
	sed G       #��ÿһ�к�������һ����
	sed 10q                                     # ��ʾ�ļ��е�ǰ10�� (ģ��"head")
	sed -n '$='                                 # ��������(ģ�� "wc -l")
	sed -n '5,/^no/p'                           # ��ӡ�ӵ�5�е���no��ͷ��֮���������
	sed -i '/aaa/,$d'                           # ɾ��ƥ���е��ı�ĩβ��-iѡ���ʾ�ǶԲ������ı�ֱ�Ӳ�������ı��ı����ݡ�
	sed -i "s/=/:/g" passwd                     # ֱ�Ӷ��ı��滻���������g�Ļ�ֻ��ÿһ�еĵ�һ��=�Ž����滻
	sed -i "/^pearls/s/$/j/"                    # �ҵ�pearls��ͷ����β��j��$���ţ�������Ϊ�ı�ĩβ��Ҳ������Ϊ��β��
	sed -n '/1/,/3/p'                           # ��ӡ������1��3֮����У�����ȱʡ-nѡ��������ֽ�ԭ�ı����������ȡ����ͬʱ��ӡ
	                                            # (-n)ѡ���p��־һ��ʹ�ñ�ʾֻ��ӡ��Щ�����滻���С�
	sed -n '1p' �ļ�                            # ȡ��ָ����
	sed '5i\aaa' file                           # �ڵ�5�в�����
	sed '5a\aaa' file                           # �ڵ�5��֮�������
	sed -e '/a/i\b'                             # ��ƥ����ǰ����һ�У�-eѡ���������ִ�ж��ָ�������һϵ�в������˴�����ʡ��
	sed -e '/a/a\b'                             # ��ƥ���к����һ��
	sed 's/a/&\nb/g'                            # ��ƥ���к����һ�У�&��ʾ������ҵĴ����ݣ�\n��ʾ���ǻ��з�
	sed 's/^192.168.0.1/&localhost/' example    #&���ű�ʾ�滻���ַ����б��ҵ��Ĳ��ݡ�������192.168.0.1��ͷ���ж��ᱻ�滻�������Ѽ� localhost�����192.168.0.1localhost��
	sed -n '/regexp/!p'                         # ֻ��ʾ��ƥ��������ʽ����
	sed '/regexp/d'                             # ֻ��ʾ��ƥ��������ʽ����
	sed '/baz/s/foo/bar/g'                      # ֻ�����г����ִ�"baz"������½�"foo"�滻��"bar" 
	sed '/baz/!s/foo/bar/g'                     # ��ֻ������δ�����ִ�"baz"��������滻"foo"��"bar"
	sed -e 's/a/#&/g'                           # ��aǰ���#��
	sed 's/foo/bar/4'                           # ֻ�滻ÿһ���еĵ��ĸ����ֵ��ִ�����sed 's/:/=/' passwd
	sed -e '1,5d' -e 's/test/check/' example    #(-e)ѡ��������ͬһ����ִ�ж��������������ʾ����һ������ɾ��1��5�У��ڶ���������check�滻test�������ִ ��˳��Խ����Ӱ�졣�������������滻�����ô��һ���滻���Ӱ��ڶ����滻����Ľ����
	sed 'n;d'                                     # ɾ������ż����,nѡ���ʾ��ȡ��һ��
	sed 'G;G'                                     # ��ÿһ�к�������������
	sed '/^$/d;G'                                 # ��������ı���ÿһ�к��潫����ֻ��һ����
	sed 'n;n;n;n;G;'                              # ��ÿ5�к�����һ�հ���
	sed -n '3,${p;n;n;n;n;n;n;}'                  # �ӵ�3�п�ʼ��ÿ7����ʾһ��
	ls -l|sed -n '/^.rwx.*/p'                     # ��������Ȩ��Ϊ7���ļ�
	sed '/test/r file' example                    #file������ݱ�����������ʾ����testƥ����к��棬���ƥ����У���file�����ݽ���ʾ������ƥ���е����档
	sed -n '/test/w file' example                 #��example�����а���test���ж���д��file�

4.grep����
	
    grep ��energywise�� *           #�ڵ�ǰĿ¼������'energywise'�е��ļ�
		�磺grep -l 'dt_����_����_����.log' *.sh �ڵ�ǰĿ¼�²�����.sh��β�İ�����dt_����_����_����.log�����ļ�������ʾ���ļ�����
	grep -r ��energywise�� *        #�ڵ�ǰĿ¼������Ŀ¼������'energywise'�е��ļ�
	grep -l -r ��energywise�� *     #�ڵ�ǰĿ¼������Ŀ¼������'energywise'�е��ļ������ǲ���ʾƥ����У�ֻ��ʾƥ����ļ�
	grep -l -r '�����շ�*' /root/shell  ��/root/shell�������ļ����в��Ұ����������շѡ����ļ�������·����ӡ����
5.find ����
	find����{

		# linux�ļ��޴���ʱ��
		# Access ʹ��ʱ��  
		# Modify �����޸�ʱ��  
		# Change ״̬�ı�ʱ��(Ȩ�ޡ�����)
		# ʱ��Ĭ����24СʱΪ��λ,��ǰʱ�䵽��ǰ24СʱΪ0��,��ǰ48-72СʱΪ2��
		# -and �� ƥ���������� ��������ȷ��ʱ�䷶Χ -mtime +2 -and -mtime -4
		# -or �� ƥ������һ������

	find /etc -name http         # ���ļ�������
	find . -type f               # ����ĳһ�����ļ�������������ѯ��ǰĿ¼�����е�Ŀ¼���磺 find . -type d
	find / -perm                 # �����ļ�Ȩ�޲���,��ѯ��ǰĿ¼��Ȩ��Ϊ644���ļ���Ŀ¼  �磺 find . -perm 644 | xargs ls -ld 
	find / -user                 # �����ļ���������
	find / -group                # �����ļ����������������ļ�
	find / -atime -n             # �ļ�ʹ��ʱ����N������,����ʹ��stat filename ���鿴�ļ�����ϸ��ʱ��ѡ�֮�ڵ���-�ţ�֮ǰ����+��
	find / -atime +n             # �ļ�ʹ��ʱ����N����ǰ
	find / -mtime -n             # �ļ����ݸı�ʱ����N������
	find / -mtime +n             # �ļ����ݸı�ʱ����N����ǰ
	find / -ctime +n             # �ļ�״̬�ı�ʱ����N��ǰ
	find / -ctime -n             # �ļ�״̬�ı�ʱ����N����
	find ·�� -name *name1* -or -name *name2*               # ��������һ���ؼ���
	for i in `seq 100`;do touch foo$i;done ��forѭ��д��һ��
	find /usr -not(-user root -o -user bin -o -user student) #����/usrĿ¼�²�����root,bin,��student���ļ�
	find /usr -not -user root -a -not -user bin -a -not -user student  #����/usrĿ¼�²�����root,bin,��student���ļ�
	find /etc -mtime -7 -a -not -user root -a -not -user student # ����/etcĿ¼�����һ���������޸Ĺ��в�����root��student�û����ļ�
	find / -not -type d -a -nouser -exec rm -f {}  #ɾ�����Ͳ���Ŀ¼������û���������ļ�
	find / -not -type d -a -nouser | xargs -i rm -f {}   #ɾ�����Ͳ���Ŀ¼������û���������ļ�
6.�޸���������
	vi /etc/hosts
	vi /etc/sysconfig/network
7.�鿴��ǰϵͳ֧�ֵ����Ա��뼰�޸����Ա������220.181.111.188���ļ���
	locale
	vi /etc/sysconfig/i18n 
8.ִ��DNS��������������
	vi /etc/resolv.conf
	�������£�
		nameserver 192.168.100.6
		nameserver  8.8.8.8
		nameserver  8.8.6.6
	ע�⣺�����ǰ�װ��Linux����ϵͳ�Ժ��ǲ��ܹ�ʹ��ping www.baidu.com�������Ƿ���ͨ����������ֻ������û��ָ��������������
	ping 220.181.111.188 �ǿ���pingͨ�ģ�220.181.111.188 �ǰٶȵķ�������IP
9.����sendmail��ʱ���ͨ���༭�����ļ���Ⱥ���ʼ�
	vi /etc/aliases�����ڽ�β�м��� �û���������	�û���1,�û���2..
	�ڴ������ڽ����ʼ����û���ʱ�����Խ�-sѡ��ָ��Ϊ/sbin/nologin
		�磺groupadd mailtest
		useradd -g mailtest -s /sbin/nologin zhanglei1
		useradd -g mailtest -s /sbin/nologin zhanglei2
10.��ʾ����Ľӿ���Ϣ��
	ip addr show��������ifconfig��
	Ϊ����ӿ���ӣ�ɾ����һ��ip:
		ip addr add��ɾ���� 192.168.100.11/24 dev eth0
	��ֹ�ͼ��������ӿڣ�
		ip link set eth1  down��up��
	�鿴·�ɱ�ķ�����
		ip route show
	
11.ɨ�����˿ںţ�
	nc -v -z -n -w 4 192.168.100.6 1-100
	ɨ��˿ںŴ�1��100���ĸ��˿��ǿ����ģ�succeeded��
	-z ѡ�һ���������Ӻ����϶Ͽ����������ͺͽ����κ����ݡ� 
	-v ѡ���ӡ��ϸ�����Ϣ�� 
	-n ѡ�ֱ��ʹ��IP ��ַ������ʹ����������������ѯ��������
	-w ѡ��������ӵĳ�ʱʱ�䣬��λΪ�롣 
	-u ѡ�ʹ��UDP �������ӡ�
	���������޴ˣ�-u�����ã����ʾʹ��TCP �������ӡ�
	
	ʹ��nc -v -l 12345 < book_out.txt �ڷ��Ͷ�����12345 �˿��������ļ�����
	ʹ��nc -v -n 12345 > book_in.txt  �ڽ��ն�ͨ��12345 �˿��������ļ�
		
12.ʹ��yum��װ����Щ�������
	cat /var/log/yum.log
	
13.Linux �鿴mx��¼��
	nslookup -query=mx 163.com
	Windows �鿴mx��¼
		nslookup -qt=mx 163.com
14.mount
	-o options ��Ҫ���������豸�򵵰��Ĺҽӷ�ʽ�� 
	loop��������һ���ļ�����Ӳ�̷����ҽ���ϵͳ 
	mount -o loop -t iso9660 /home/sunky/mydisk.iso /mnt/vcdrom  ���ع��̵ľ����ļ�
15.rpm��
ʹ��rpm�Ѿ���װ�������ѯ
	rpm -qf  filename    #��ѯһ���Ѿ���װ���ļ������ĸ������
	rpm -ql  �����    #��ѯ��װ���������װ���δ�
	rpm -qi  �����	 #��ѯһ���Ѿ���װ�����������Ϣ
	rpm -qc  �����  #��ѯһ���Ѿ���װ��������������ļ�
	rpm -qd   �����  #��ѯһ���Ѿ���װ������ĵ���װλ��
	rpm -qR   �����  #�鿴һ���Ѿ���װ�������������������ļ�
δʹ��rpm��װ���������ѯ���������p
	�� rpm -qpl  filename.rpm �鿴filename��װ����װ���δ�
16.��ʱ����ͨ���ܵ������Ͳ���ʱ����Ҫʹ��xargs�����������xargs��ִ������ʱ�������Ҫ���ļ����в�������Ҫʹ��-iѡ�{}Ҳ��ʾҪ�������ļ�
17.dig:
	dig +trace www.baidu.com  #�Ӹ���ʼ׷��һ�������Ľ�������
18.curl -O filepath ��wget filepath�� �����ļ�
19.traceroute ��tracepath ��������ƣ�����ҪrootȨ�ޣ�traceroute ��׷�ٳ���ָ��Ŀ�ĵ�ַ������·����������·���ϵ�ÿһ��������ͨ��traceroute�鴦������������˻������ˡ�
�磺traceroute www.baidu.com
    tracepath www.baidu.com
20.mtr�����ping�����tracepath����ϳ�һ����mtr���������������ʾÿһ��ping���õ�ʱ�䣬Ҳ����ʾ�����е��κ����⡣
�磺mtr www.baidu.com
21.host����������DNS��ѯ������������������������������IP,�������Ĳ�����IP�����������������������
�磺host www.baidu.com 
	host 220.181.112.244   
22.users  ��ʾ��ǰ��¼ϵͳ���û�
23.who  ��¼�ڱ���ϵͳ���û�
   -H��--heading���� ��ʾ����λ�ı�����Ϣ
24.set   ��ʾ������������ͨ����
25.env   ��ʾ��������
26.export ����ͨ������ɻ�������
27.unset  ɾ��һ����������
28.diff
  -b�� �����ո��ַ��Ĳ�ͬ
  -B�� �����հ���
  -i��������Сд
  -q������ʾ���������ʾ��ϸ��Ϣ
29.cat -b ��-nѡ�����ƣ�������-bѡ��Կհ��в����
30.chattr 
   -i�����������޸��ļ���Ŀ¼
   -a�����ļ���Ŀ¼����������;����������־������
   chattr -a  install.log
31.lsattr filename��dirname�� ���鿴�ļ������� 
32. chgrp -v bin  log2012  �޸��ļ���Ⱥ������
    chgrp --referenece=log2012.log  log2013.log  ����ָ���ļ��ı��ļ���Ⱥ������
33.ifup��ifdown�� eth0 ������ر�����ӿ�
34.route -nee ��ʾ·����ϸ��ee����Ϣ
   route add [-net|-host] [���������] netmask [mask] [gw|dev]
   route del [-net|-host] [���������] netmask [mask] [gw|dev]
   route del -net 169.254.0.0 netmask 255.255.0.0 dev eth0 ɾ��·��
   route add -net 192.168.100.0 netmask 255.255.255.0  dev eth0  ����·�ɣ����ӵ�·�ɱ����ܹ���������绥ͨ��
   route add default gw 192.168.100.4 ����Ĭ��·�� 192.168.100.4Ҫ�����LAN���绥ͨ����
35.ip [-s] link show �鿴�ӿڲ��� ������ifconfig
   ip -s link show eth0
   ip link set [device] [���������]
   ip link set eth0 up (down) ������ر�����ӿ�
   ip link set eth0 mtu 1000 ����mtu��ֵ
   ip link set eth0 name vbird �޸��������ţ�ǰ��ʱ����Ҫ�ȹرգ�
   ip link set eth0 address MAC ����֧��MAC�޸ĵĻ��������޸�
   
   ip address show ��ʾ��������ӿ���IP����
   ip address add 192.168.100.13/24 broadcast +  dev eth0 label eth0��vbird ��broadcast + ����д��192.168.100.255��
   
   ip route show ��ʾ·����Ϣ
   ip route [add|del] [IP������] [via gateway] [dev װ��]
   ip route add 192.168.5.0/24 dev eth0 �����뱾��ֱ�ӿ���ͨ������
   ip route add 192.168.10.0/24 via 192.168.5.100 dev eth0
   ip route add default via 192.168.1.254 dev eth0
   ip route del 192.168.10.0/24
   ip route del 192.168.5.0/24

36.linux����ϵͳ��˫������������ģʽ:
   0. round robin(����)
   1.active-backup(����)
   2.load balancing (xor)
   3.fault-tolerance (broadcast)
   4.lacp
   5.transmit load balancing
   6.adaptive load balancing
   
   vim /etc/modprobe.conf      #�༭bond0�������ļ�
   cat /proc/net/bonding/bond0  #�鿴bond0����Ϣ
37.��Linux�������������֮һ��
   cat /dev/urandom|tr -dc "a-zA-Z0-9-_\$\?\*\%\$\@\(\)\_\+"|fold -w 13|head 

38. for((i=0; i<5; i++))
    do
		echo "hello"
	done
39.less file
   g:����ƶ�����һ��
   G:����ƶ������һ��   
   v��ʹ��vi�༭�����б༭���ȵ��v���ڵ��i���в���༭
   h����ʾless�İ����ĵ�
   ma��ʹ��a����ı��ĵ�ǰλ��
   һ��������a: ���������a��
40.traceroute :
	-n:�����������ƽ���������ʹ��IP
	-U��ʹ��UDPЭ����� port��33434 Ԥ�����ⷽʽ
	-I��ʹ��ICMP�ķ�ʽ���
	-T��ʹ��TCPЭ�������
	-p�� ����ʹ���Զ���Ķ˿ں�
41.netstat -r��route -n��
42.patch
�����ļ�
	diff �CuN from-file to-file >to-file.patch
	patch �Cp0 < to-file.patch
	patch �CRE �Cp0 < to-file.patch

����ļ�:
	diff �CuNr from-docu to-docu >to-docu.patch
	patch �Cp1 < to-docu.patch
	patch �CR �Cp1 <to-docu.patch
43.cat /etc/redhat-release �鿴����ϵͳ�汾
	cat /etc/issue �鿴����ϵͳ�汾
44./etc/login.defs  #ӳ�������ļ�����
	chage -l username  �鿴�û��Ŀ������ϸ��Ϣ����������ʱ�䣬����ʧЧ���ڵȵȣ�
	usermod -c "zhanglei'scount"  zhanglei  Ϊ�û����ע��  cat /etc/passwd
	usermod -L  zhanglei    #����zhanglei�û�
	usermod -U  zhanglei	#����zhanglei�û�
	usermod -u 888 zhanglei   #�޸��û���UIDֵ
45.chattr �ļ���������
	chatrr +-=  ���ӡ����١��趨
	chattr -a ֻ��׷�Ӳ���ɾ������root�û������趨������
	chattr -i ʹ�ļ����ܱ�ɾ�������������趨���ӡ�д�롢��������
	lsattr ������ȡ�ļ�����Ŀ¼������Ȩ��
	lsattr -a ��ͨ�����ļ�һͬ�г�
	lsattr -R ��ͬ��Ŀ¼һͬ���
	lsattr -d ֻ��ʾĿ¼����
46.����Ȩ�� suid
��Ȩ��ֻ��Զ����ƿ�ִ���ļ���ʹ���ļ���ִ�н׶ξ����ļ������ߵ�Ȩ�ޣ���passwd
	chmod u+s  /usr/bin/passwd
	chmod u-s  /usr/bin/passwd
   ����Ȩ�� sgid
����ͨ�û���ʱӵ���������Ȩ��
	chmod g+s Ŀ¼
	chmod g-s Ŀ¼
��һĿ¼�����������û�ɾ��ʱ��ʹ��sticky_bit(ճ��λ)
	chmod o+t  Ŀ¼
47.�鿴���̵�UUID���������ͣ� blkid
48.swapon -a     ���¹���swap����
   swapoff -a    ж��swap����  ͨ��free -h �鿴swap����total�Ƿ���ֵ
   ���»�������ʽ������������  mkswap /swap-file   ��dd if=/dev/zero of=/swap-file  bs=1M count=1024��
   �鿴swap����״̬�� mkswap -L swap-disk  /dev/sda6
49.Linux�ں�ͨ��/proc�����ļ�ϵͳ���û������ں���Ϣ���û�Ҳ����ͨ��/proc�ļ�ϵͳ��ͨ��sysctl���̬�����ںˡ����磬�������������NAT�����˼���ģ�顢���÷���ǽ�⣬����Ҫ�����ں�ת�����ܡ����������ַ�����

	1) ֱ��д/proc�ļ�ϵͳ
		# echo 1 > /proc/sys/net/ipv4/ip_forward

	2) ����sysctl����
		# sysctl -w net.ipv4.ip_forward=1
		sysctl -a���Բ鿴�ں����е����ı���

	3) �༭/etc/sysctl.conf
	�������һ�У�����ϵͳÿ�������󣬸ñ�����ֵ����1
		net.ipv4.ip_forward = 1
50.�޸����Ա�������
	vi /etc/sysconfig/i18n
	#LANG="en_US.UTF-8"
	LANG="zh_CN.gb2312"
	SYSFONT="latarcyrheb-sun16"
	source /etc/sysconfig/i18n ����������������Ч


