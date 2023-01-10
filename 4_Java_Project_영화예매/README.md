# 페이지

## 1. 로그인

<div>
    <p> 회원일 경우 : 회원 이름 + 환영글 팝업 <br> 
       회원이 아닐경우 : 재시도 요청
   </p>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/1.%20signIn.png" width="30%" height="30%"/>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/1.%20signIn(ok).png" width="30%" height="30%"/>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/1.%20signIn(nop).png" width="30%" height="30%"/>
  
</div>

## 2. 회원가입

<div>
   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-0.%20signUp_20220824.png" width="30%" height="30%"/>

   <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-7-1.%20siginUp(ok).png" width="30%" height="30%"/>
</div>
  
### - 회원가입시 유효성 검사
- 공통 : 입력값에 공백값이 있을경우 회원가입 불가 </br>
ㄴ 사용메서드 : isEmpty() : null 확인시 , contains() : 공백값 확인시

1. 아이디 
   - 중복검사, 글자수 검사(null, 20자이상)
   
2. 비밀번호
   - 비밀번호 작성값과 비밀번호 확인 작성값이 같은지 확인, 글자수 검사(null, 20자이상)
   
3. 이름
   - 글자수 검사(null, 20자이상)
   
4. 핸드폰번호 
   - 각 입력창마다 3자리, 4자리 입력되는지 확인, 숫자만 입력 가능 </br>
   ㄴ 숫자 확인인지 확인시 사용 메서드 : isDigit();
   
5. 카드번호
   - 각 입력창마다 4자리씩 입력되는지 확인, 숫자만 입력가능
   
6. 카드비밀번호
   - 글자수 검사(4자리인지), 숫자만 입력가능 

</br>
<div>
<p> - 아이디 사용 불가시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-1.%20id(20up).png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-1.%20id(null).png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-2.%20id(same).png" width="30%" height="30%"/>
</br>
</div>
<div>
<p> - 아이디 사용 가능 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-3.%20id(ok).png" width="30%" height="30%"/>
</br>
</div>
<div>
<p> - 아이디 확인 안했을 경우 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-4.%20id(check).png" width="30%" height="30%"/>
</div>
</div>

</br>
</br>
<div>
<p> - 비밀번호 사용불가시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-2%20pwd(20up).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-3.%20pwd(null).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-1.%20pwd(dif).png" width="30%" height="30%"/>
</div>

</br>
</br>
<div>
<p> - 이름 작성시 빈값 이나, 20자 초과일때 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-3-1.%20name(20up).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-3-2.%20name(null).png" width="30%" height="30%"/>
</div>

</br>
</br>
<div>
<p> - 핸드폰 번호 잘못 입력시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone1(not3).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone2(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone3(not4).png" width="30%" height="30%"/>
</div>

</br>
</br>
<div>
<p> - 카드번호 잘못 입력시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum1(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum2(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum3(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum4(not4).png" width="30%" height="30%"/>
</div>

</br>
</br>
<div>
<p> - 카드비밀번호 잘못입력시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-6-1.%20cardPwd(4up).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-6-1.%20cardPwd(4down).png" width="30%" height="30%"/>
</div>

## 3. 아이디 찾기, 비밀번호 찾기

<div>
<p> - 아이디찾기 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/3-0.%20find%20id.png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/3-1-1.%20find%20id.png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/3-1-2.%20find%20id.png" width="30%" height="30%"/>
</div>

</br>
</br>
<div>
<p> - 비밀번호 찾기 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-0.%20find%20pwd.png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-1-1.%20find%20pwd.png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-1-2.%20find%20pwd.png" width="30%" height="30%"/>
</div>

### 코드 수정일
- 코드수정일 : 2022.08.18 
	- 클래스 명 : signUp
	- as-is : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 o, 팝업메세지 아이콘 유
	- to-be : 회원가입시 비밀번호, 카드비밀번호 이상있어도 회원가입 x, 팝업메세지 아이콘 무

	- 클래스명 : signIn
	- as-is : 로그인시 회원 정보 저장될 수 있는 클래스 파일 x
	- to-be : 로그인시 회원 정보 저장가능 (클래스명 : LoginMember_DTO / 정보 : id, memberName, cardNum, cardPwd)

- 코드수정일 : 2022.08.19
	- 클래스 명 : signUp
	- as-is : 핸드폰번호, 카드번호 입력시 한번에 입력
	- to-be : 핸드폰번호(3,4,4) , 카드번호(4,4,4,4) 입력시 나눠서 입력

- 코드수정일 : 2022.08.19
	- 클래스명 : signIn, signUp, find_id, find_pwd
	- as-is : 페이지별 중복부분(페이지크기, 포인트컬러, 텍스트) 수정시 하나씩 변경 필요
	- to_be : 페이지별 중복부분(페이지크기, 포인트컬러, 텍스트) 수정시 ProjectFrame 클래스만 변경 

- 코드수정일 : 2022.08.23
	- 클래스 명 : signUp
	- as-is : 회원가입 완료후 회원가입창 유지
	- to-be : 회원가입 완료후 로그인페이지로 이동

- 코드수정일 : 2022.08.27
	- 클래스 명 : signUp
	- as-is : 회원가입시 공백입력시 회원가입 가능, 핸드폰번호, 카드번호, 카드비밀번호 입력시 숫자가 아닌 문자 입력해도 이상 없음
	- to-be : 공백 입력 x , 핸드폰번호, 카드번호, 카드비밀번호에 숫자만 입력 가능
