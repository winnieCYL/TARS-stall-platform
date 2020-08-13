# TARS-stall-platform

TARS开源项目，地摊交易平台
Create by: 朴实无华YCC

## 简介

>### 初版
>from mj: 目前后端增加了shop的组件，因为和user合并，所以对商品的查询可以通过用户id实现\
能正常跑通，但是还没有任何区别，因为只是加了后端逻辑没一点调用

数据库方面主要的构思是  
user表:id, username, password(加密), shopname, lon, lat以及其他联系信息\
product表:id, title(名字), content(描述), price  
具体的话参照domain文件夹下的类设计即可，大部分和数据库有映射的；导入mysql的sql文件后查看各个表也能有很直接的帮助，基本上就是原user表加了3列——shopname, lon, lat\
【注:sql文件不是我写的，还没更新】  

ToDo: 数据库字段更新，前后端连接, web的debug\
这边的话shop下的更新页需要尽快出来和后端对接试试，考虑到效率问题我应该直接冲这几个html了，然后尝试链接\
我这边界面上基本上会按照他这个来，如果你们后续有页面更新的话到时再合并就可以

## 开发环境及框架介绍

* IDE：Intellij IDEA
* 数据库：MySQL
* 项目框架：SpringBoot+Hibernate

## 本地部署流程

### 数据准备

在本地的MySQL数据库中新建一个database，命名为db_second_hand_bbs，运行mysql文件夹下的sql文件，导入初始数据：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/导入数据库.png)

