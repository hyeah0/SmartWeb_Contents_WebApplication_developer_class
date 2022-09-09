## Object(객체)

[객체 참고링크 : 드림코딩](https://github.com/hyeah0/Javascript/blob/master/Javascript_dreamcoding/js7_object.js)

- 객체는 key 와 value 의 집합체이다
  - `let object = { key : value }`;
- 객체와 배열 동시사용도 가능하다.
- value 값에 function(함수)도 가능하다.

### - 객체 생성, 추가 및 삭제, 출력

1. 객체 생성 , 초기화
2. 객체 생성 , 값 입력
3. 객체 key값 추가, 삭제
4. 객체 값 출력

#### - 1. 객체 생성 및 초기화

- `let 변수명 = {};`

#### - 2. 객체 생성 및 값입력

```
    let 변수명 = {
        key : value,
        key : value,
        ...,
        key : value
    }
```

#### - 3. 객체 key 추가 및 삭제

- 추가

  - `변수명.key = value;`

- 삭제
  - `delete 변수명.key = value;`

#### - 4. 객체 출력

- `변수명[key]`
- `변수명.key`
- `변수명[인덱스]`

### - 예시

#### - 객체와 배열 동시 사용

```
  let patientList = [{name:"Kim",age:10},{name:"Lee",age:13},{name:"Park",age:16}];
```

#### - 객체 값에 함수

```
let person = {
                name : "홍길동"
                , eat : function(food){
                                    document.write(this.name + "님이 " + food + "를 먹습니다.<br>")
                                }
                }
document.write("이 름 : " + person.name + "<br>");
person.eat("사과");

    ** -------- 결과 -------- **
이 름 : 홍길동
홍길동님이 사과를 먹습니다.
```

#### - 객체 생성 및 출력

```
// 객체 생성
let product ={
        name : "Galaxy S22"
        , type : "핸드폰"
        , company : "삼성"
}

// 객체의 속성을 화면에 출력
// 1. 변수명[key]
document.write("제품 이름  >>> " + product["name"] + "<br>");
document.write("제품 타입  >>> " + product["type"] + "<br>");
document.write("제품 제조사 >>> " + product["company"] + "<br>");

document.write("<hr>");

// 2. 변수명.key
document.write("제품 이름  >>> " + product.name + "<br>");
document.write("제품 타입  >>> " + product.type + "<br>");
document.write("제품 제조사 >>> " + product.company + "<br>");

document.write("<hr>");

// 3. for문 사용
for(let k in product){
    document.write(k + "의 값 >>> " + product[k] + "<br>");
}
```
