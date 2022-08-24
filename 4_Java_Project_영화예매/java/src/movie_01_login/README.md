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
1. 아이디 
   - 중복검사, 글자수 검사(null, 20자이상)
2. 비밀번호
   - 비밀번호 확인에 작성한 비밀번호와 비밀번호에 작성한 비밀번호가 동일한지, 글자수 검사(null, 20자이상)
3. 이름
   - 글자수 검사(null, 20자이상)
4. 핸드폰번호 
   - 각 입력창마다 3자리 , 4자리 입력되는지 확인
5. 카드번호
   - 각 입력창마다 4자리 입력되는지 확인
6. 카드비밀번호
   - 글자수 검사(4자리인지)

<br>
<div>
<p> - 아이디 사용 불가시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-1.%20id(20up).png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-1.%20id(null).png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-2.%20id(same).png" width="30%" height="30%"/>
</div>
<div>
<p> - 아이디 사용 가능 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-3.%20id(ok).png" width="30%" height="30%"/>
</div>
<div>
<p> - 아이디 확인 안했을 경우 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-1-4.%20id(check).png" width="30%" height="30%"/>
</div>
</div>

<div>
<p> - 비밀번호 사용불가시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-2%20pwd(20up).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-3.%20pwd(null).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-2-1.%20pwd(dif).png" width="30%" height="30%"/>

</div>

<div>
<p> - 이름 작성시 빈값 이나, 20자 초과일때 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-3-1.%20name(20up).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-3-2.%20name(null).png" width="30%" height="30%"/>

</div>

<div>
<p> - 핸드폰 번호 잘못 입력시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone1(not3).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone2(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-4-1.%20phone3(not4).png" width="30%" height="30%"/>
</div>

<div>
<p> - 카드번호 잘못 입력시 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum1(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum2(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum3(not4).png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/2-5-1.%20cardnum4(not4).png" width="30%" height="30%"/>
</div>

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

<div>
<p> - 비밀번호 </p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-0.%20find%20pwd.png" width="30%" height="30%"/>

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-1-1.%20find%20pwd.png" width="30%" height="30%"/>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/4_Java_Project_%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4/java/src/movie_01_login/00.screenshot/4-1-2.%20find%20pwd.png" width="30%" height="30%"/>
</div>
