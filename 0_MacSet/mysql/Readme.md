## docker 란?

- Docker는 애플리케이션을 신속하게 구축, 테스트 및 배포할 수 있는 소프트웨어 플랫폼
- Docker는 소프트웨어를 컨테이너라는 표준화된 유닛으로 패키징하며, 이 컨테이너에는 라이브러리, 시스템 도구, 코드, 런타임 등 소프트웨어를 실행하는 데 필요한 모든 것이 포함되어 있다.
- Docker를 사용하는 이유는 환경에 구애받지 않고 애플리케이션을 신속하게 배포 및 확장할 수 있으며 코드가 문제없이 실행되기 위해 사용한다.

## 도커세팅(mysql)

<h3>1. 도커 설치</h3>

- [도커설치페이지](https://www.docker.com/products/docker-desktop/)
- 자신의 os에 맞는 것으로 설치

<h3>2. 설치 후 설치가 제대로 되었는지 확인</h3>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/01_dockerVersion.png" width="80%" height="80%"/>

- Terminal 또는 iterm에 `docker -v`

<h3>3. MySQL 도커 이미지 다운로드</h3>
<h4>1. [이미지 다운로드 페이지](https://hub.docker.com/_/mysql)</h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/02_mysqlImageDwd1.png" width="80%" height="80%"/>

<h4>2. 다운로드 </h4>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/02_mysqlImageDwd2.png" width="60%" height="60%"/>

- `docker pull mysql:{version}`

<h3>4. MySQL 도커 컨테이너 생성 및 실행</h3>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/03_containerRun.png" width="60%" height="60%"/>

```
docker run --name mysql-{containerName}-container -e MYSQL_ROOT_PASSWORD={password} -d -p 3306:3306 mysql: {version}
```

<h3>5. 현재 실행중인 도커 컨테이너 목록 출력</h3>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/04_dockerExec.png" width="60%" height="60%"/>

- `docker ps -a`
- 컨테이너 이름 확인

<h3>6. MySQL 도커 컨테이너 접속 & MySQL 접속</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/05_mysqlExec.png" width="60%" height="60%"/>

1. `docker exec -it {도커컨테이너이름} bash`

2. `mysql -u root -p`
   - Enter password : 도커생성 및 실행시 작성했던 비밀번호 입력
