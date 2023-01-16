## annotation does not exist error

<h3>- 에러</h3>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/1_error.png" width="80%">

<h3>- 에러 사유</h3> 
    - 톰캣에서 "servlet-api.jar", "jsp-api.jar" 파일이 추가되지 않아서 발생

<h3>- 해결 방법</h3>

- Module 세팅 : servlet-api.jar

  1. 에러가 나는 프로젝트 클릭 >>> Open Module Settings 클릭

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/2_error_handling_01.png" width="80%">
    
    <br>

  2. [ + ] 버튼 클릭 >>> 1 JARs or Directores... 클릭

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/2_error_handling_02_setModule_01.png" width="80%">
   
   <br>
    
  3. tomcat 다운 받아져 있는 파일 클릭 >>> lib 파일 클릭 >>> <br>servlet-api.jar 클릭 후 open 버튼 클릭

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/2_error_handling_02_setModule_02.png" width="80%">
   
   <br>


- Library 세팅 : jsp-api.jar

  1. [ + ] 버튼 클릭 >>> 2 Library... 클릭 >>> Java 클릭

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/2_error_handling_03_setLibrary_01.png" width="80%">

   <br>
    
  2. tomcat 다운 받아져 있는 파일 클릭 >>> lib 파일 클릭 >>>
     <br>jsp-api.jar 클릭 후 open 버튼 클릭

    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/image/IntelliJ/error/annotation_dose_not/2_error_handling_03_setLibrary_02.png" width="80%">
