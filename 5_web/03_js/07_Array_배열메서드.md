## Array(배열) 메서드

<table border="1" cellspacing="0">
<tr> <th> 주기능 </th> <th> 메서드 </th> <th> 사용 </th> <th> 설명 </th> </tr>
<tr> <td> 크기 </td> <td> length </td><td> 배열명.length() </td> <td> 배열 크기 </td> </tr>
<tr> <td rowspan ="2">정렬</td><td> sort </td> <td> 배열명.sort() </td> <td> 배열 원소 오름차순 </td> </tr>
<tr>                         <td> reverse </td> <td> 배열명.reverse() </td> <td> 배열 원소 내림차순 </td> </tr>
<tr> <td rowspan ="2"> 추가 </td> <td> push </td> <td> 배열명.push(원소) </td> <td> 배열 맨 뒤에 원소 추가 </td> </tr>
<tr>                        <td> unshift </td> <td> 배열명.unshift(원소) </td> <td> 배열 맨 앞에 원소 추가 </td> </tr>
<tr> <td rowspan ="2"> 삭제 </td> <td> shift </td><td> 배열명.shift(원소) </td> <td> 배열 맨 앞에 원소 삭제 </td> </tr>
<tr>                         <td> pop </td> <td> 배열명.pop(원소) </td> <td> 배열 맨 뒤에 원소 삭제 </td> </tr>
<tr> <td rowspan ="2"> 추가/연결 </td><td> concat </td> <td> 배열명.concat([원소1,원소2,..원소n]) </td> <td> 배열 맨 뒤에 여러원소 추가(연결하기) </td> </tr>
<tr>                         <td> combine </td> <td> 배열 a.combine(배열 b) </td> <td> 배열 a 와 배열 b를 연결 </td> </tr>
<tr> <td> 삭제/자르기 </td> <td> splice </td><td> 배열명.splice(인덱스 몇번부터, 몇개, 이후추가원소1, 추가원소2.. ) </td> <td> 인덱스 몇번부터 몇개 지우고 추가원소, 추가원소<br> 지운 원소 위치에 추가 원소위치 <br> 원본 배열 변경된다. <br>(추가원소는 없으면 생략가능)  </td> </tr>
<tr> <td> 자르기   <td> slice </td><td> 배열명.slice(인덱스 몇번부터, 인덱스 몇번까지) </td> <td> 인덱스 몇번부터 몇번-1까지 보여준다. <br> 원본배열 변경되지 않는다.</td> </tr>

<tr> <td rowspan ="3"> 찾기 </td><td> indexOf </td> <td> 배열명.indexOf('찾을원소') </td> <td> 찾을 원소는 몇번째 인덱스에 위치해있는지 </td> </tr>
<tr>                         <td> includes </td> <td> .includes('찾을원소') </td> <td> 찾을 원소가 배열에 있는지<br>반환 : boolean - true,false </td> </tr>
<tr>                         <td> lastIndexOf </td> <td> .lastIndexOf('찾을원소') </td> <td> 찾을 원소가 배열 가장 끝에 있는지 <br>반환 : 0 - 끝에 있다 / -1 - 끝에 없다 </td> </tr>
</table>

\*\* unshift, shift 는 push, pop 보다 느리다.

- [배열메서드 추가 참고링크 : 드림코딩 수업내용](https://github.com/hyeah0/Javascript/blob/master/Javascript_dreamcoding/js8_array.js)

### 예시

#### - splice

```
const fr = ['사과', '오렌지', '망고','포도','귤'];
document.write(fr +"<br>");  // 사과,오렌지,망고,포도,귤

fr.splice(2,1,"망고대신 메론","낑깡 추가")
document.write(fr + "<br>"); // 사과,오렌지,망고대신 메론,낑깡 추가,포도,귤
```

#### - splice/ slice 차이

```
// splice : 인덱스 --번 부터 n개
// slice  : 인덱스 -- 번부터 인덱스 --번 -1 까지
// slice : splice는 어레이 자체를 수정하는데 slice 는 어레이를 수정하지 않는다.

const array1 = ["사과", "오렌지", "키위", "망고", "수박"];
const result1 = array1.splice(2, 3);

const array2 = ["사과", "오렌지", "키위", "망고", "수박"];
const result2 = array2.slice(2, 3);

//splice
document.write(result1 + '<br>');   // 키위,망고,수박
document.write(array1 + '<br>');    // 사과,오렌지

// slice
document.write(result2 + '<br>');   // 키위
document.write(array2 + '<br>');    // 사과,오렌지,키위,망고,수박

```
