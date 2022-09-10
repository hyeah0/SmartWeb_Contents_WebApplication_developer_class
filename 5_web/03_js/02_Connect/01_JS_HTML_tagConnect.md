## JavaScript 에서 HTML 태그 연결

- 자바스크립트 <b>document.</b> 이용
<table border="1" cellspacing="0">
    <tr>
    <th>메서드</th> <th>사용</th> <th>설명</th>
    </tr>
    <tr>
        <td>getElementById</td>  
        <td>document.getElementById("아이디명");</td>  
        <td>- html의 id="아이디명" 인것을 가져온다. <br>&nbsp;&nbsp;아이디명 앞에 따로 #을 작성하지 않아도 된다.
        </td>
    </tr>
    <tr>
        <td>getElementsByTagName</td>  
        <td>document.getElementsByTagName("태그명 h1")</td>  
        <td>-html 특정 태그를 가지고 오고 싶을때
        </td>
    </tr>
    <tr>
        <td>querySelector</td>
        <td>document.querySelector("#아이디명 또는 .클래스명")</td>
        <td>-id를 가져올때는 "#id명"
        <br>&nbsp;&nbsp;class를 가져올때는 ".class명"
        <br>-.클래스명 태그명 : 부모요소 아래 하위 요소를 가져올때 
        <br>&nbsp;&nbsp;자식이 많을 경우 첫번째 자식만 확인 가능하다.
        </td>
    </tr>
    <tr>
        <td>querySelectorAll</td>
        <td>document.querySelectorAll("#아이디명 또는 .클래스명")</td>
        <td>- 가로안에 있는 [아이디], [클래스] 또는 
        <br>&nbsp;&nbsp;[#아이디명 하위태그], [.클래스명 하위태그] 인 것 
        <br>&nbsp;&nbsp;모두 가지고 오고 싶을때
        <br> - 여러개 가져올때 배열형태로 가져오고 
        <br>&nbsp;&nbsp;인덱스를 통해 특정 태그만 확인할 수 있다.
        <br>- 예시) 
        <br>&nbsp;&nbsp;const test = querySelectorAll(".text li")
        <br>&nbsp;&nbsp;text클래스의 li를 모두 가져올 수 있다.
        <br>&nbsp;&nbsp;test[2] ==> .text 두번째 li
        </td>
    </tr>
</table>
