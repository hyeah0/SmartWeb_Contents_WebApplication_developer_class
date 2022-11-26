## 파일업로드

### 1. 라이브러리 설정

- Apache Commons FileUpload
- Apache Commons IO
- [라이브러리](https://mvnrepository.com/)에서 검색 >> 코드 복사 >> pom.xml에 붙여넣기

<div>
<h3> - 라이브러리(Apache Commons FileUpload)</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%201.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%202.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%203.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리(Apache Commons IO)</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%204.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%205.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%206.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리 Servelt-context.xml 파일에 등록</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%208-1.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리 root-context.xml 파일에 등록</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%208-2.png" width="70%">
<code>
<bean id="multipartResolver"
class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
<property name="maxInMemorvSize" value="10485760"
<property name=" defaultEncodina" value="UTF-8"
</bean>
</code>
</div>
<br>
<div>
<h3> - 업로드한 파일이 들어갈 파일 생성</h3>
<p>위치 : src >> main >> webapp >> resources</p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%209.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%210.png" width="70%">
</div>
<br>
<div>
<h3> - 생성한 파일의 위치 확인</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%211.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File%212.png" width="70%">
</div>
<br>
<div>
<h3> - 경로 지정</h3>
<a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/06_FileUpload/code/13_FileUpload/src/main/java/com/spring/upload/Upload.md">참고 코드</a>
</div>
