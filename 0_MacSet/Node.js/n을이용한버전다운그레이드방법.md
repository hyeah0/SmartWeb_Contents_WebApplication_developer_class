## n 패키지를 이용하여 node 버전 수정하기

## n?

- Node.js version 관리
- Node.js 가 이미 설치되어있다면 npm을 통해 쉽게 n을 다운 받을 수 있다.

## 버전 수정 순서

### 1. n 다운

0. iTerm에서 진행
1. 현재 다운받아져있는 node.js 버전 확인
   <br> `node -v`
2. n 설치 전 npm cash 삭제
   <br> `sudo npm cache clean -f`
3. global로 n패키지 설치
   <br> `sudo npm install -g n`
4. 설치 완료 후 n version 확인
   <br>`n --version` >>> v9.0.1

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Node.js/img/version_downgrade/01_n_download.png" width="80%">

### 2. node 버전 수정

```
sudo n latest    // 최신 버전 설치
sudo n stable    // 안정화 버전 설치
sudo n lts       // LTS 버전 설치
sudo n 16.12.0   // 특정 버전 설치
```

### 3. 다운 받아진 버전 확인

```
sudo n ls
```

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Node.js/img/version_downgrade/02_n_nodeversion.png" width="80%">

### 4. 원하는 버전으로 설정하기

```
sudo n
```

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Node.js/img/version_downgrade/03_n_nodeversion_change.png" width="80%">

- ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️

  - installed된 주소와 active의 주소가 다르면 node 버전이 변경 되지 않는다.
  - symbolic link를 변경
    - `ln -sf installed경로 active경로`
  - 경로 작성시 `v버전 to`, `v버전 at` 텍스트는 제외

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Node.js/img/version_downgrade/04_installed_active.png" width="80%">

### - 버전 삭제

#### - 특정 버전 삭제

```
sudo n rm 00.00.00
```

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/Node.js/img/version_downgrade/05_deleteversion.png" width="80%">

#### - 현재 버전을 제외하고 모두 삭제

```
n prune / n uninstall
```
