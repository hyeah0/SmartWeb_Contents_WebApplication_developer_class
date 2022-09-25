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
- cross axis => 교차축 메인이 되는축에 90도 지나는 선

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
        <td> flex-flow: flex-direction flex-wrap
        <br> flex-flex: row/column/row-reverse/column-reverse wrap/nowrap
        </td>
        <td> flex-direction, flex-wrap 이 합쳐진것
        <br> reverse는 요소들 거꾸로 
        <br> a->b->c >> c->b->a
        </td>
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
        <td> align-items: flex-start/ flex-end/
        <br> stretch/ center/
        <br> baseline </td>
        <td> 교차축 기준 기본값, 가운데, 위쪽, 아래쪽, 폰트 기준 
        <br> 하단 예시 참고
        </td>
    </tr>
    <tr>
        <td> align-content  </td>
        <td> align-content: flex-start/ flex-end/
        <br> center/ space-between/
        <br> space-around/ stretch 
        </td>
        <td> 메인축의 90도 지나는 선 기준 요소들의 간격
        <br> 한줄 이상일때 적용
        </td>
    </tr>
</table>

## justify-content 사용 예시

- [코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/html/flexbox.html)
- 이미지
- 주 축 라인 : row (가로)
  - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_flex.png" width="70%">

## align-items 사용 예시

- [코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/html/flexbox_align.html)
- 이미지
- 주 축 라인 : row (가로)
  - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_flex_align.png" width="70%">

## align-items과 align-content의 차이

- flex-direction : row
- flex-wrap을 한 상태일때 한줄 이상일때 가정
- 아이템들이 2줄로 있었을때 가정 시

  - align-items은 1줄에서의 센터, 다음줄에서의 center를 맞춘다.
  - align-content는 두줄로 나누어 져있다 해도 요소들을 묶어 center에 맞춘다.

- [코드](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/html/flexbox_align_item_content_diff.html)
- 이미지
- 주 축 라인 : row (가로)
  - <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/02_css/img/css_flex_align_diff.png" width="70%">
