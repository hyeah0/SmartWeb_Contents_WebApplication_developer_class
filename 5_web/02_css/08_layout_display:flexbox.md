## display: flex;

```
.flexbox{
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center; 또는
                align-content: center;
                flex-wrap : nowrap;
            }
```

- 부모요소에 기재한다.
- flex-dirction 속성으로 메인이 되는 축을 지정한다.
- main axis => 메인이 되는 축
- cross axis => 메인이 되는축에 90도 지나는 선

<table border="1" cellspacing="0">
    <tr>
        <th> 속성 </th>
        <th> 사용 </th>
        <th> 설명 </th>
    </tr>
    <tr>
        <td> display </td>
        <td> display:flex </td>
        <td> 부모요소 하위 자식요소에 flex(신축성있는 선) 지정</td>
    </tr>
    <tr>
        <td> flex-direction </td>
        <td> flex-direction : row/ column; </td>
        <td> 자식요소 정렬 방향 지정 : 가로(왼쪽에서 오른쪽) 정렬 또는 세로정렬(위에서 아래) </td>
    </tr>
      <tr>
        <td> flex-wrap </td>
        <td> flex-wrap : nowrap/wrap </td>
        <td> nowrap -> 한줄정렬(자식의 크기를 줄여서라도 한줄정렬)
        <br> wrap -> 칸이 모자르면 하단이나 옆쪽에 정렬 
        </td>
    </tr>
      <tr>
        <td> flex-flow </td>
        <td>  </td>
        <td>  </td>
    </tr>
    <tr>
        <td> justify-content </td>
        <td> justify-content: center/ flex-end/ 
        <br> space-between/ space-around; 
        </td>
        <td> 메인축 기준으로 가운데 정렬/ 오른쪽정렬
        <br> 요소의 간격을 동일하게(첫번째, 마지막 태그는 가장 끝으로)
        <br> 요소의 간격 동일하게(단, 처음과 끝의 간격이 있다.)
        </td>
    </tr>
    <tr>
        <td> align-items </td>
        <td> align-items: stretch/ center/ 
        <br> flex-start/ flex-end/
        <br> baseline </td>
        <td>  </td>
    </tr>
    <tr>
        <td> align-content  </td>
        <td>  </td>
        <td>  </td>
    </tr>
</table>

## justify-content 사용 예시

- [코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/html/flexbox.html)
- 이미지
  - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_flex.png" width="70%">
