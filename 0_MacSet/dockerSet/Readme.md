## 도커세팅(mysql)

1. 도커 설치

   - [도커설치페이지](https://www.docker.com/products/docker-desktop/)
   - 자신의 os에 맞는 것으로 설치

2. 설치 후 설치가 제대로 되었는지 확인
   <img src="" width="60%" height="60%"/>

   - Terminal 또는 iterm에 `docker -v`

3. MySQL 도커 이미지 다운로드
   <img src="" width="60%" height="60%"/>

   - [이미지 다운로드 페이지](https://hub.docker.com/_/mysql)
   - `docker pull mysql:{version}`

4. MySQL 도커 컨테이너 생성 및 실행
   <img src="" width="60%" height="60%"/>
   `docker run --name mysql-{containerName}-container -e MYSQL_ROOT_PASSWORD={password} -d -p 3306:3306 mysql: {version}`

5. 현재 실행중인 도커 컨테이너 목록 출력
   <img src="" width="60%" height="60%"/>

   - `docker ps -a`
   - 컨테이너 이름 확인

6. MySQL 도커 컨테이너 접속 & MySQL 접속
   <img src="" width="60%" height="60%"/>

   1. `docker exec -it {도커컨테이너이름} bash`

   2. `my -u root -p`
