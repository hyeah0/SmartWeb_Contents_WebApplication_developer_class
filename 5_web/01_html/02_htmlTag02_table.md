## table tag

- 표를 만들어주는 태그
- 기본값 : 표에 테두리가 없다.
- tr, th, td .. 태그와 함께사용된다.

  | 관련 태그        | 설명                                                                    |
  | ---------------- | ----------------------------------------------------------------------- |
  | &lt;tr&gt;       | table row 테이블 행을 만들어주는 태그                                   |
  | &lt;th&gt;       | table head 테이블 표데이터의 제목을 만들어주는 태그, 가운데정렬, bold체 |
  | &lt;td&gt;       | table data 테이블의 데이터값 태그                                       |
  | &lt;caption&gt;  | 테이블 설명                                                             |
  | &lt;colgroup&gt; | 열 그룹( 스타일 지정시 )                                                |
  | &lt;col&gt;      | colgroup안에 있는 열                                                    |
  | &lt;thead&gt;    | 표 데이터의 제목                                                        |
  | &lt;tbody&gt;    | 표의 데이터값                                                           |
  | &lt;tfoot&gt;    | 표의 요약(가장 하단)                                                    |

### 속성

    | 속성                               | 설명                                                                                                                            |
    | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
    | border (table)                     | 테두리선(외곽선) 지정 (border="1")                                                                                              |
    | cellpadding (table)                | 셀(td) 내부의 내용과 외곽선과의 여백을 지정                                                                                     |
    | cellspacing (table)                | 셀(td)과 table 자체의 외곽선과의 여백을 지정                                                                                    |
    | width (table)                      | 표의 너비(픽셀, %)                                                                                                              |
    | height (table)                     | 표의 높이(픽셀, %)                                                                                                              |
    | rules (table)                      | 셀(td) 사이의 외곽선 표시 형태를 지정 ( none / rows / cols / all )                                                              |
    | frame (table)                      | 외곽선 표시 형태를 지정 ( void(없음) / above(위) / below(아래) / hsides(상, 하) / vsides(좌, 우) / lhs(좌) / rhs(우) / border ) |
    | align (table, caption, tr, th, td) | table의 정렬 상태 ( left / center / right )                                                                                     |
    | background (table, tr, th, td)     | 배경 이미지 지정                                                                                                                |
    | bgcolor (table, td)                | 배경색 지정                                                                                                                     |
    | rowspan (th, td)                   | 행병합                                                                                                                          |
    | colspan (th, td)                   | 열병합                                                                                                                          |
    | valign (tr, td)                    | 내부 요소들에 대한 수직 정렬 상태 지정 ( top / middle / bottom )                                                                |

### 예시

#### 1. 가장 자주 사용 (table, tr, th, td)

    <table border="1" cellspacing="0" width="80%">
        <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
        </tr>
        <tr>
            <td colspan="4">1행 1열</td>
            <!--<td>1행 2열</td>
                <td>1행 3열</td>
                <td>1행 4열</td> -->
        </tr>
        <tr>
            <td rowspan="2">2행 1열</td>
            <td>2행 2열</td>
            <td rowspan="2">2행 3열</td>
            <td>2행 4열</td>
        </tr>
        <tr>
            <!-- <td>3행 1열</td> -->
            <td>3행 2열</td>
            <!-- <td>3행 3열</td> -->
            <td>3행 4열</td>
        </tr>
        <tr>
            <td>4행 1열</td>
            <td colspan="2">4행 2열</td>
            <!-- <td>4행 3열</td> -->
            <td>4행 4열</td>
        </tr>
    </table>

```
<table border="1" cellspacing="0" width="80%">
    <tr>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
    </tr>
    <tr>
        <td colspan="4">1행 1열</td>
        <!--<td>1행 2열</td>
            <td>1행 3열</td>
            <td>1행 4열</td> -->
    </tr>
    <tr>
        <td rowspan="2">2행 1열</td>
        <td>2행 2열</td>
        <td rowspan="2">2행 3열</td>
        <td>2행 4열</td>
    </tr>
    <tr>
        <!-- <td>3행 1열</td> -->
        <td>3행 2열</td>
        <!-- <td>3행 3열</td> -->
        <td>3행 4열</td>
    </tr>
    <tr>
        <td>4행 1열</td>
        <td colspan="2">4행 2열</td>
        <!-- <td>4행 3열</td> -->
        <td>4행 4열</td>
    </tr>
</table>
```

#### 2. 두번째 예시

<table border="1" cellpadding="20%" cellspacing="0" width="80%" align=center>
 		<caption>캡션 : 테이블 테스트</caption>
 		<colgroup>
 			<col span="1" style="background-color:pink" >
 		</colgroup>
 		<thead>
	        <tr>
	            <th>1</th>
	            <th>2</th>
	            <th>3</th>
	            <th>4</th>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td colspan="4" align="center">1행 1열</td>
	            <!--<td>1행 2열</td>
	                <td>1행 3열</td>
	                <td>1행 4열</td> -->
	        </tr>
	        <tr>
	            <td rowspan="2">2행 1열</td>
	            <td>2행 2열</td>
	            <td rowspan="2">2행 3열</td>
	            <td>2행 4열</td>
	        </tr>
	        <tr>
	            <!-- <td>3행 1열</td> -->
	            <td>3행 2열</td>
	            <!-- <td>3행 3열</td> -->
	            <td>3행 4열</td>
	        </tr>
	        <tr>
	            <td>4행 1열</td>
	            <td colspan="2">4행 2열</td>
	            <!-- <td>4행 3열</td> -->
	            <td>4행 4열</td>
	        </tr>
        </tbody>
        <tfoot>
        	<tr>
	            <th>요약</th>
	            <td>2</td>
	            <td>3</td>
	            <td>4</td>
	        </tr>
        </tfoot>
    </table>
