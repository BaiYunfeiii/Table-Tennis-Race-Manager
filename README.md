# 乒乓球比赛管理系统

1.	方便参赛选手报名，获取比赛进程、成绩等信息
2.	规范抽签、比赛场次安排、成绩记录流程，保证比赛公平性
3.	方便内部管理人员变动
4.	方便组委会负责人实时了解比赛进展状况


# 环境要求

1. JDK 1.8及以上
2. Tomcat 8.0 及以上
3. MySQL 5.6及以上
4. Maven 
4. Chrome浏览器较新的版本


# 编译方法

使用Maven包管理工具
```
mvn package
```


# 安装方法

1. 将/doc文件夹下的renren.sql导入数据库
2. 将/target文件夹下的race-assistant.war 解压到tomcat/webapps目录下
3. 修改/WEB-INF/classes/db.properties中的数据库连接信息
4. 启动Tomcat服务器


# 初始账号

1. 超级管理员：		用户名admin		密码admin
2. 郭跃（运动员）：	用户名guoyue	密码guoyue
3. 裁判员：			用户名judge01 	密码judge01
4. 策划员：			用户名plan01	密码plan01
