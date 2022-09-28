## 도커세팅(mysql)

<h3>1. 도커 설치</h3>

- [도커설치페이지](https://www.docker.com/products/docker-desktop/)
- 자신의 os에 맞는 것으로 설치

<h3>2. 설치 후 설치가 제대로 되었는지 확인</h3>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/01_dockerVersion.png" width="80%" height="80%"/>

- Terminal 또는 iterm에 `docker -v`

<h3>3. MySQL 도커 이미지 다운로드</h3>
<h4>1. [이미지 다운로드 페이지](https://hub.docker.com/_/mysql)</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/02_mysqlImageDwd1.png" width="80%" height="80%"/>

<h4>2. 다운로드 </h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/02_mysqlImageDwd2.png" width="60%" height="60%"/>

- `docker pull mysql:{version}`

<h3>4. MySQL 도커 컨테이너 생성 및 실행</h3>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/03_containerRun.png" width="60%" height="60%"/>

```
docker run --name mysql-{containerName}-container -e MYSQL_ROOT_PASSWORD={password} -d -p 3306:3306 mysql: {version}
```

<h3>5. 현재 실행중인 도커 컨테이너 목록 출력</h3>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/04_dockerExec.png" width="60%" height="60%"/>

- `docker ps -a`
- 컨테이너 이름 확인

<h3>6. MySQL 도커 컨테이너 접속 & MySQL 접속</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/dockerSet/image/05_mysqlExec.png" width="60%" height="60%"/>

1. `docker exec -it {도커컨테이너이름} bash`

2. `my -u root -p`
