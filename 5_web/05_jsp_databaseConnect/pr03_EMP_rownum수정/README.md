## 새로 적용된 부분(pr02대비)

<b>- select option 태그 추가</b>

- [코드링크(jsp select) 71줄](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr03_EMP_rownum%EC%88%98%EC%A0%95/src/main/webapp/view/emp_modify.jsp)

<div>
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/03/insert.png" width="45%">
<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/03/update.png" width="45%">
</div>

<br><br>

<b>- 데이터 삭제시 더블체크 </b><br>

- [코드링크 75줄](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr03_EMP_rownum%EC%88%98%EC%A0%95/src/main/webapp/view/emp_list_detail.jsp)

  <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/03/delete.png" width="50%">

<br><br>

<b>- css 추가 >>> [css코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr03_EMP_rownum%EC%88%98%EC%A0%95/src/main/webapp/css/frame.css) </b>

- table border 설정

  - table 태그 cellspacing="0" 속성 대신 <br>
    css >>> border-collapse: collapse 로 대체

    ```
    table{
        margin: auto;
        border: 1px solid gray;
        border-collapse: collapse;
    }

    th, td{
        border: 1px solid gray;
        padding: 10px;
    }
    ```

- hr 크기, 색상 지정

  - hr 태그 color="red" 속성 대신 <br>
    css >>> <br>
    background : red;<br>
    height: 2px; <br>
    border: 0px; 로 대체

    ```
    hr{
        width: 80%;
        background: rgba(100, 100, 200, 0.7);
        height: 2px;
        border: 0px;
    }
    ```
