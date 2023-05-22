# application.yml配置文件

```
classpath的根路径是 resources文件
```

![image-20230521150809021](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521150809021.png)

```
# 配置数据库的连接字符串
spring:
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/mycnblog?characterEncoding=utf8
    username: root
    password: 123123
    driver-class-name: com.mysql.cj.jdbc.Driver
# 设置 Mybatis 的 xml 保存路径
mybatis:
  mapper-locations: classpath:mapper/*Mapper.xml
  configuration: # 配置打印 mybatis 执行的 SQL
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
# 配置打印 MyBatis 执行的 SQL
logging:
  level:
    com:
      example:
        demo: debug
```

# ***Mapper配置文件

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="*Mappper.xml路径（根路径是com)">
</mapper>
```

错误：（会爆红）

![image-20230521150919807](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521150919807.png)

namespace 的路径是java文件下Mapper的路径

正确：

![image-20230521151024182](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521151024182.png)

用 . 来连接文件而不是 / ,最后一个文件不需要 .java 后缀