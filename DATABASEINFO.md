# 创建数据库和相应的表
EDIT@20160929
> 创建数据库

UPDATE@20161003
> 将所有表都增添id为主键，并且自动递增。
> 将time都更改为时间戳类型，

UPDATE@20161011
> 修改命令，使得数据库支持中文的录入

UPDATE@20161020

> 增加文章笔记表

（关于数据库创建方式存在不同意见请修改本文件）


### 数据库名称和表的名称及其内容
```
DB_NAME: DBGHZ

用户表： 用户id(PK 自增)，用户名，邮箱，密码，加入时间（时间戳类型 为了时间轴）

文章表： 文章id（PK 自增）， 用户id ，文章名，文章地址，阅读状态，父id（构建树，孩子id，评论
// 孩子id为字符串类型，每个id以特殊字符隔开，如：1#2#5#8#

日志表： 主id(PK auto_increment), 用户id，文章id ，操作时间（时间戳类型）， 动作内容

分享表： 主id(PK auto_increment)， 用户id，文章id，分享时间(时间戳)，分享感受，赞次数，反对次数

笔记表： 主id(PK auto_increment)， 用户id，文章id，笔记时间(时间戳)，笔记名， 笔记
```
### 创建命令
```
CREATE DATABASE IF NOT EXISTS DBGHZ DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE DBGHZ;

CREATE TABLE User
(
  userid     INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username   VARCHAR(255),
  mail       VARCHAR(255),
  password   VARCHAR(255),
  joinintime TIMESTAMP
);
CREATE TABLE Article
(
  articleid     INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid        INT(11),
  articlename   VARCHAR(255),
  url           VARCHAR(255),
  status        VARCHAR(20),
  parentid      INT(11),
  childid       VARCHAR(500),
  comment       VARCHAR(2000),
  FOREIGN KEY (userid) REFERENCES User(userid)
);
CREATE TABLE Log
(
  id            INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid        INT(11),
  articleid     INT(11),
  time          TIMESTAMP,
  action        VARCHAR(20),
  FOREIGN KEY (userid) REFERENCES User(userid),
  FOREIGN KEY (articleid) REFERENCES Article(articleid)
);
CREATE TABLE Share
(
  id            INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid        INT(11),
  articleid     INT(11),
  time          TIMESTAMP,
  good          INT(11),
  bad           INT(11),
  FOREIGN KEY (userid) REFERENCES User(userid),
  FOREIGN KEY (articleid) REFERENCES Article(articleid)
);
CREATE TABLE Note
(
  id            INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid        INT(11),
  articleid     INT(11),
  time          TIMESTAMP,
  notename   VARCHAR(255),
  note          VARCHAR(2000),
  FOREIGN KEY (userid) REFERENCES User(userid),
  FOREIGN KEY (articleid) REFERENCES Article(articleid)
);
CREATE TABLE Tree
(
  id INT(11) NOT NULL AUTO_INCREMENT primary key,
  nodename varchar(255),
  pid INT(11),
  userid        INT(11),
  FOREIGN KEY (userid) REFERENCES User(userid)
);

# 请增加执行
USE DBGHZ;
# 头像url
ALTER TABLE User ADD avatar VARCHAR(255);
# 文章感受
ALTER TABLE Share ADD feeling VARCHAR(1000);
# 文章笔记长度扩充
alter table Note modify column note varchar(10000);
# 判断文章类型url/pdf
ALTER TABLE Article ADD type VARCHAR(25);
```

### 检查创建结果

```
show tables;
show columns from User;
show columns from Article;
show columns from Log;
show columns from Share;
show columns from Note;
```
