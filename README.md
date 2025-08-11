# Linux

创建LVM

1. 创建PV（PV, Physical Volume）

[root@centos7 ~]# pvcreate /dev/sdc 
  Physical volume "/dev/sdc" successfully created.
[root@centos7 ~]# pvdisplay /dev/sdc 
  "/dev/sdc" is a new physical volume of "10.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/sdc
  VG Name               
  PV Size               10.00 GiB
  Allocatable           NO
  PE Size               0   
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               AJZ0rU-nwEq-nuZr-41P3-J3QM-uXBd-KftpYe


2.创建卷组 （VG, Volume Group）
#创建vg命令
[root@centos7 ~]# vgcreate mysqlvg1 /dev/sdb{1..3}
  Volume group "mysqlvg1" successfully created

#查看vg信息
[root@centos7 ~]# vgscan 
  Reading volume groups from cache.
  Found volume group "mysqlvg1" using metadata type lvm2
  Found volume group "centos" using metadata type lvm2


3.创建逻辑卷（LV, Logical Volume）
[root@centos7 ~]# lvcreate -L 5G -n mysqlvg1-lv mysqlvg1 (lvcreate -l 100%VG -n mysqlvg1-lv mysqlvg1 )
  Logical volume "mysqlvg1-lv" created.
[root@centos7 ~]# lvscan 
  ACTIVE            '/dev/mysqlvg1/mysqlvg1-lv' [5.00 GiB] inherit
  ACTIVE            '/dev/centos/root' [50.00 GiB] inherit
  ACTIVE            '/dev/centos/data' [25.00 GiB] inherit
  ACTIVE            '/dev/centos/swap' [23.99 GiB] inherit

[root@centos7 ~]# lvdisplay /dev/mysqlvg1/mysqlvg1-lv
  --- Logical volume ---
  LV Path                /dev/mysqlvg1/mysqlvg1-lv
  LV Name                mysqlvg1-lv
  VG Name                mysqlvg1
  LV UUID                h7aL9y-uHBN-TXDN-5e6e-ut0j-lF43-LAX1ed
  LV Write Access        read/write
  LV Creation host, time centos7, 2025-01-19 16:35:05 +0800
  LV Status              available
  # open                 0
  LV Size                5.00 GiB
  Current LE             1280
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:3

4. 格式化系统
[root@centos7 ~]# mkfs.ext4 /dev/mysqlvg1/mysqlvg1-lv 


5. root@mes:/dev# lvscan 
  ACTIVE            '/dev/nfs-data/nfs-data-lv' [<1000.00 GiB] inherit
  ACTIVE            '/dev/ubuntu-vg/ubuntu-lv' [100.00 GiB] inherit
  ACTIVE            '/dev/ubuntu-vg/lv-0' [<398.00 GiB] inherit

  root@mes:/dev# lvdisplay /dev/nfs-data/nfs-data-lv 
  --- Logical volume ---
  LV Path                /dev/nfs-data/nfs-data-lv
  LV Name                nfs-data-lv
  VG Name                nfs-data
  LV UUID                aGqGmV-bGCr-GKnz-idrQ-lNNu-sahI-pJ2oHZ
  LV Write Access        read/write
  LV Creation host, time mes, 2025-04-03 13:53:14 +0800
  LV Status              available
  # open                 0
  LV Size                <1000.00 GiB
  Current LE             255999
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:2

  root@mes:/dev# blkid /dev/nfs-data/nfs-data-lv
  /dev/nfs-data/nfs-data-lv: UUID="6616af99-3479-4054-91fc-4cafefa12c15" BLOCK_SIZE="512" TYPE="xfs"
--------------------------------------------------------------------------------------
LVM 扩容

1. 创建PV
pvcreate /dev/sdc

2. 扩容VG
vgextend data /dev/sdc 

3. 扩容LV
lvextend -l 100%VG /dev/data/data-lv(lvextend -L 60G /dev/data/data-lv)
lvextend -l +100%free /dev/mapper/VolGroup00-LV01

4. 扩展文件系统大小
resize2fs /dev/data/data-lv(ext4系统)
xfs_growfs /dev/centos/root(xfs系统)




