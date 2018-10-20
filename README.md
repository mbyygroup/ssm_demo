## ssm初始搭建demo
- 未实现任何业务功能，只是提供给新项目的骨架，免去搭建的烦恼
- 集成了mybatis-generator，运行前请更改pom文件对应jar为自己的版本，并在src/main
/resources/properties/jdbc.properties更改自己的数据库信息
- 本demo为idea项目，管理工具为maven，eclipse用户和grable用户请自行转化
- 本项目java版本为1.8，mysql版本为8.0.12，java版本不一致不太可能出现问题，如果是
老版mysql只需要更改pom里mysql版本和在第二条路径下文件驱动去掉.cj即可
- 为了保证项目骨架和目录结构的完整性，本demo在每个文件夹内部都有一个测试用文件，
请自行更改包内的文件内容，但项目结构请勿请勿更改。
- 如果项目需要使用nosql或者需要存储文档，图片之类的二进制文件，mapper请实现序列化
具体实现方式很多，可以先看看（https://github.com/eishay/jvm-serializers/wiki）
- 为了保证功能清晰，建议controller和service按照功能划分多个文件夹，因为idea自身设
计问题，可以每天写好代码后在进行包的划分
- 在编写本demo时遇到乱码的头疼问题，后来在jsp文件最上面加了<%@ page contentType="
text/html; charset=utf-8"%>问题得以解决，我是从springboot框架出身，springboot从来
没发生过乱码问题，才想到可能会是jsp文件的问题，如果是新人或者公司转型还是建议学习
springboot吧，那个是完全支持前后端分离和分布式的架构，配置也更加简单甚至不需要手
动配置tomcat
- 如你所见，日志是不成功的，我费了好大劲熬夜到快五点各种网页翻结果都找不到一个能用
的方案，真倒霉啊，等以后找到了再修复这个bug吧