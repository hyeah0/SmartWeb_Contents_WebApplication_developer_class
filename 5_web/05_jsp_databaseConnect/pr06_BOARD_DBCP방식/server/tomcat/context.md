[환경설정 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/%5BDataBaseConnect%5D_03_DBCP.md)

```
<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--><!-- The contents of this file will be loaded for each web application --><Context>

    <!-- Default set of monitored resources. If one of these changes, the    -->
    <!-- web application will be reloaded.                                   -->
    <WatchedResource>WEB-INF/web.xml</WatchedResource>
    <WatchedResource>WEB-INF/tomcat-web.xml</WatchedResource>
    <WatchedResource>${catalina.base}/conf/web.xml</WatchedResource>

    <!-- Uncomment this to disable session persistence across Tomcat restarts -->
    <!--
    <Manager pathname="" />
    -->
    <!-- 커넥션 풀 오라클 설정 -->
    <Resource
      name = "jdbc/myoracle"
      auth = "container"
      type = "javax.sql.DataSource"
      url = "jdbc:oracle:thin:@[전자지갑이름]_high?TNS_ADMIN=[전자지갑경로]"
      driverCLassName = "jdbc.oracle.driver.OracleDriver"
      username = "[유저명]"
      password = "[비밀번호]"
      maxActive = "20"
      maxIdle = "10"
    />

    <!-- 커넥션 풀 mysql 환경 설정 -->
  	<Resource
        name = "jdbc/mysql"
        auth = "Container"
        type = "javax.sql.DataSource"
        url = "jdbc:mysql://localhost:3306/[데이터베이스이름]?serverTimezone=Asia/Seoul"
        driverCLassName = "com.mysql.cj.jdbc.Driver"
        username = "[유저명]"
        password = "[비밀번호]"
        maxActive = "20"
        maxIdle = "10"
    />

</Context>
```
