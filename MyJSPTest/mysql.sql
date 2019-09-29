create database JSPTest;#创建数据库

use JSPTest;#选择数据库
#show databases;查看有哪些数据库
#drop database <数据库名>;删除数据库
#show tables;查看当前数据库有哪些表

#创建表
create table user (
userid int not null auto_increment,
username varchar(255),
psword varchar(255),
phone varchar(255),
address varchar(255),
registtime datetime,
grade int,
primary key(userid)
);

#增加数据
insert into user values (null, "admin","admin123","888888","贵州",now(),1);
insert into user values (null, "aaa","aaa","888888","贵州",now(),0);
insert into user values (null, "bbb","bbb","888888","贵州",now(),0);
insert into user values (null, "ccc","ccc","888888","贵州",now(),0);
insert into user values (null, "ddd","ddd","888888","贵州",now(),0);
insert into user values (null, "eee","eee","888888","贵州",now(),0);
insert into user values (null, "fff","fff","888888","贵州",now(),0);
insert into user values (null, "ggg","ggg","888888","贵州",now(),0);
insert into user values (null, "hhh","hhh","888888","贵州",now(),0);
insert into user values (null, "iii","iii","888888","贵州",now(),0);

