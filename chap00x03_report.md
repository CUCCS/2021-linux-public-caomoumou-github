# **第三次实验**

## _实验目的_

1. 阅读systemd入门教程
2. 自查清单 

## _实验内容_

1. 视频chap1x01

[![asciicast](https://asciinema.org/a/W6W3emvM75IghC5DOx5V4DJLh.svg)](https://asciinema.org/a/W6W3emvM75IghC5DOx5V4DJLh)

```batch
$ sudo timedatectl set-time YYYY-MM-DD
$ sudo timedatectl set-time HH:MM:SS
```
    1. 这两个命令不能运行，后来根据返回的语句查看，系统时间同步是开启的，关闭时间同步可以运行了。
    2. 随机改变一个日期后，在asciinema查看我的视频，出现了一个超级长的视频，实际上录视频时间没有很长，所以应该是改变日期导致录制时间有误

2. 视频chap1x02

[![asciicast](https://asciinema.org/a/Gx1gROjZsjGzlDyhhgY2mcozb.svg)](https://asciinema.org/a/Gx1gROjZsjGzlDyhhgY2mcozb)

3. 视频chap1x03

[![asciicast](https://asciinema.org/a/REJAFVfNelG7jrKqwnlc5cdu4.svg)](https://asciinema.org/a/REJAFVfNelG7jrKqwnlc5cdu4)

4. 视频chap1x04

[![asciicast](https://asciinema.org/a/xT7hmIiUD51HyQUhGF7jG26rz.svg)](https://asciinema.org/a/xT7hmIiUD51HyQUhGF7jG26rz)

5. 视频chap1x05

[![asciicast](https://asciinema.org/a/12BTfxBOtSTxdkQSDNc0T8SYN.svg)](https://asciinema.org/a/12BTfxBOtSTxdkQSDNc0T8SYN)

6. 视频chap1x06

[![asciicast](https://asciinema.org/a/h8V0ued2Pl0qHaim3CzcTzsYA.svg)](https://asciinema.org/a/h8V0ued2Pl0qHaim3CzcTzsYA)

7. 视频chap1x07

[![asciicast](https://asciinema.org/a/4PxOJQYzJvrSIOeb8xsDCqV1y.svg)](https://asciinema.org/a/4PxOJQYzJvrSIOeb8xsDCqV1y)

##### 实验步骤
1. 如何添加一个用户并使其具备sudo执行程序的权限？
```batch
sudo adduser **
sudo usermod -G sudo -a **
```

2. 如何将一个用户添加到一个用户组？
```batch
sudo usermod -a -G ** group_name
```

3. 如何查看当前系统的分区表和文件系统详细信息？
    1. 使用 lsblk 查看块设备 
    2. 使用 df 查看文件系统磁盘空间使用量

4. 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
```batch
lvresize --size -{{SIZE}} --resizefs {{volume_group}}/{{logical_volume}}
lvresize --size +{{SIZE}} --resizefs {{volume_group}}/{{logical_volume}}
```

5. 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
```batch
ExecStart=<path_service1> start
ExecStop=<path_service2> stop
```

6. 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？
```batch
Restart=always
```