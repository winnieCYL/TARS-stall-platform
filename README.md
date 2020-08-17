# TARS-stall-platform

TARS开源项目，地摊交易平台
Create by: 朴实无华YCC

## 简介

这是一个类似于二手交易平台的网站，主要是为了响应这段时间号召的“地摊经济”所启发出来的想法。网站的主要提高给摊主和用户进行使用，摊主可以通过网站发布自己的摊位信息，商品信息等对外进行宣传。而用户则可以通过该平台进行商品浏览并与摊主联系，方便前往线下进行购买

## 开发环境及框架介绍

* IDE：Intellij IDEA
* 数据库：MySQL
* 项目框架：SpringBoot+Hibernate

## 本地部署流程

### 数据准备

在本地的MySQL数据库中新建一个database，命名为db_second_hand_bbs，运行mysql文件夹下的sql文件，导入初始数据：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/导入数据库.png)

### 项目运行

* 1. 添加启动配置项目

  ![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/配置启动项.png)

* 2. 修改application.properties中的本地配置，包括mysql和初始图片路径（一般是到img/upload_img)

* 3. 启动MySQL服务，端口号为3306

* 4. 启动服务：Run Application

* 5. 登陆localhost:8080/index

  ![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/地摊首页.png)

## 功能介绍

#### 登陆与注册功能

新用户可以点击注册进行信息录入：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/注册.png)

然后进行登陆：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/登陆界面.jpg)

登陆后即可使用所有功能：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/登陆后界面.jpg)

### 搜索功能

在左上角“搜索感兴趣的小东西”可以搜索相关商品：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/搜索结果.PNG)

### 地图浏览功能

点击右上角“进入地图“，可以进入地图查看附近的地摊：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/附近地摊.jpg)

#### 发布商品与管理

点击右上角”发布商品“，可以发布新的地摊商品：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/商品发布.png)

然后点击左上角用户名，点击”我的商品“，可进入商品管理界面：

![search](https://github.com/winnieCYL/TARS-stall-platform/blob/master/photo/商品管理.png)

