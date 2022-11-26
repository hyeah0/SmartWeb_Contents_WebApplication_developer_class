## 파일업로드

### 1. 라이브러리 설정

- Apache Commons FileUpload
- Apache Commons IO
- [라이브러리](https://mvnrepository.com/)에서 검색 >> 코드 복사 >> pom.xml에 붙여넣기

<div>
<h3> - 라이브러리(Apache Commons FileUpload)</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File01.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File02.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File03.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리(Apache Commons IO)</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File04.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File05.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File06.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리 Servelt-context.xml 파일에 등록</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File07.png" width="70%">
</div>
<br>
<div>
<h3> - 라이브러리 root-context.xml 파일에 등록</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File08.png" width="70%">
<br>
<code>
&lt;bean id="multipartResolver"<br>
class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;<br>
&lt;property name="maxInMemorvSize" value="10485760"<br>
&lt;property name=" defaultEncodina" value="UTF-8"
&lt;/bean&gt;<br>
</code>
</div>
<br>
<div>
<h3> - 업로드한 파일이 들어갈 파일 생성</h3>
<p>위치 : src >> main >> webapp >> resources</p>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File09.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File10.png" width="70%">
</div>
<br>
<div>
<h3> - 생성한 파일의 위치 확인</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File11.png" width="70%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/spring_fileupload/File12.png" width="70%">
</div>
<br>
<div>
<h3> - 경로 지정</h3>
<a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/06_Spring/06_FileUpload/code/13_FileUpload/src/main/java/com/spring/upload/Upload.md">참고 코드</a>
</div>
