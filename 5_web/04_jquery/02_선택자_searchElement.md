## JQuery 선택자

```
    $(( )=>{
        $("선택태그").동작함수("속성","값");
    })
```

1.  직접선택
2.  관계선택 메서드
3.  탐색선택 메서드
- [자바에서 html 태그 선택](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/03_js/00_DOM/01_01_searchElement(tag).md)

## 1. 직접선택

<table border="1" cellspacing="0">
    <tr><th> 선택자 </th><th> 사용 </th><th> 설명 </th></tr>
    <tr><td> 전체 선택자   </td>    <td> $("\*")                     </td> <td> 모든요소 선택하는 선택자 </td></tr>
    <tr><td> 아이디 선택자  </td>    <td> $("#아이디명")                 </td> <td> 아이디 속성에 지정된 이름을 가진 요소를 선택하는 선택자</td></tr>
    <tr><td> 클래스 선택자 </td>     <td> $(".클래스명")                 </td> <td> 클래스 속성에 지정된 이름을 가진 요소를 선택하는 선택자</td></tr>
    <tr><td> 요소(태그) 선택자  </td> <td> $("요소(태그)명")              </td>  <td>태그를 선택하는 선택자 </td></tr>
    <tr><td> 그룹 선택자  </td>   <td> $("선택1, 선택2, 선택3...선택n") </td>   <td>선택한 요소들을 한꺼번에 가진 선택자   </td></tr>
</table>

## 2. 관계선택 메서드

- 부모, 자식, 형제

<table border="1" cellspacing="0">
    <tr><th colspan="2"> 메서드 </th><th> 사용 </th><th> 설명 </th></tr>
    <tr><td>부모태그  </td>   <td>parent() </td><td> $("태그").parent() </td><td> 태그의 부모요소를 선택 </td></tr>
    <tr><td>자식태그 </td>    <td>children() </td><td> $("태그").children() </td><td> 태그의 자식요소를 선택 </td></tr>
    <tr><td>직계자식태그 </td>  <td> > </td><td> $("태그 > 자식요소") </td><td> 태그의 직계자식 선택 </td></tr>
    <tr><td> 하위태그자</td>  <td> 부모 자식 </td><td> $("부모 자식") </td><td> 부모태그 아래에 동일한 자식태그 모두 </td></tr>
    <tr><td> 형제태그</td>    <td>siblings() </td><td> $("태그").siblings() </td><td> 태그 제외한 형제들 모두</tr>
    <tr><td>형제 이전 태그 </td>  <td>prev() </td><td> $("태그").prev() </td><td> 태그 이전 형제<br>태그 제외</td></tr> 
    <tr><td>형제 이전 복수 태그 </td><td>prevAll() </td><td> $("태그").prevAll() </td><td> 태그 이전 형제 모두 <br>태그 제외</td></tr>
    <tr><td> 형제 이후 태그 </td><td>next() </td><td> $("태그").next()</td><td> 태그 이후 형제 <br>태그 제외</td></tr>
    <tr><td> 형제 이후 복수 태그</td><td>nextAll() </td><td> $("태그").nextAll() </td><td> 태그 이후 형제 <br><b>태그도 변경된다. </td></tr>
</table>

## 3. 탐색선택자

- 탐색선택자를 이용하면 직접 선택자를 이용해 선택한 요소 중 <br>
  원하는 요소를 한번더 탐색해서 정확히 선택할 수 있는 장점이 있다.

### - 탐색선택자의 종류

- 위치 탐색 선택자 : 선택한 요소 중 위치 기준으로 선택
- 속성 탐색 선택자 : 요소의 지정된 속성의 기준으로 선택
- 콘텐츠 탐색 선택자 : 콘텐츠 포함 여부에 따라 선택
- 필터링 선택자 : 선택한 요소를 한번더 필터링 해서 선택

### - 위치 탐색 선택

<table border="1" cellspacing="0">
    <tr><th colspan="2"> 메서드 </th><th> 사용 </th><th> 설명 </th></tr>
    <tr><td> 처음   </td> <td> first()   </td> <td> $("태그선택:first") <br> $("태그선택").first()   </td> <td> 선택한 요소의 가장 첫번째 요소   </td></tr>
    <tr><td> 마지막   </td> <td> last()   </td> <td> $("태그선택:last") <br> $("태그선택").last()   </td> <td> 선택한 요소의 가장 마지막 요소   </td></tr>
    <tr><td> 홀수   </td> <td> even()   </td> <td>  $("태그선택:even") <br> $("태그선택").even()  </td> <td> 선택한 요소의 홀수번째들 선택 <br>0부터 인덱스 시작으로 짝수함수를 쓴다.   </td></tr>
    <tr><td> 짝수   </td> <td> odd()    </td> <td>  $("태그선택:odd") <br> $("태그선택").odd()  </td> <td> 선택한 요소의 짝수번째들 선택 <br>0부터 인덱스 시작으로 홀수함수를 쓴다.     </td></tr>
    <tr><td> 특정위치   </td> <td> :nth-child(몇번째)   </td> <td> $("태그선택:nth-child(숫자)")   </td> <td> 선택한 요소 중 숫자번째 요소 선택   </td></tr>
    <tr><td> 특정배수   </td> <td> :nth-child(몇배수n)    </td> <td> $("태그선택:nth-child(3n)")   </td> <td> 선택한 요소 중 배수만 선택 <br> 사용예시) 3배수만 선택    </td></tr>
    <tr><td> 특정배수에서 남는값   </td> <td>:nth-child(몇배수n + 남는값)     </td> <td>  $("태그선택:nth-child(3n+1)")   </td> <td> 선택한 요소 중 __으로 나눴을때 나머지값이 __ 값만 선택 <br>사용예시) 3으로 나눴을때 나머지 값이 1인거만 선택    </td></tr>
    <tr><td> 지정한 인덱스  </td> <td> :eq(index)    </td> <td>  $("ul li:eq(3)")   </td> <td>사용예시) 3번째 인덱스인 li(0,1,2,3)    </td></tr>
     <tr><td> 지정한 인덱스보다 작은것 </td> <td> :lt(index)    </td> <td>  $("ul li:lt(3)")   </td> <td>사용예시) 3번째 인덱스보다 작은것 a < 3 li(0,1,2)    </td></tr>
     <tr><td> 지정한 인덱스보다 큰것  </td> <td> :gt(index)    </td> <td>  $("ul li:gt(3)")   </td> <td>사용예시) 3번째 인덱스보다 큰것 li(4,5,6...)    </td></tr>
</table>
