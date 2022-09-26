## substring & split

- 문자열 자르기

## substring

| 메서드    | 사용법                                                 | 설명                                                               |
| --------- | ------------------------------------------------------ | ------------------------------------------------------------------ |
| substring | string.substring(start)<br>string.substring(start,end) | 1) 시작위치부터 끝까지 반환<br>2)시작위치부터 지정한 끝 위치-1까지 |

|

### - substring 예제

```
String str = "ABCDEFG";
----------------------------------
문 자 | A | B | C | D | E | F | G |
----------------------------------
인덱스 | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
----------------------------------

str.substring(3); // DEFG

str.substring(3, 5); //DE
```

## split

- String값을 특수기호로 끊어서 배열에 저장

### - split 예제

```
String str = "A,B,C,D";
String[] arr = str.split(",");


for(int i=0;i<arr.length;i++) {
System.out.println("arr[" + i + "] + arr[i]);
}

//결과값
//arr[0] = A
//arr[1] = B
//arr[2] = C
//arr[3] = D
```
