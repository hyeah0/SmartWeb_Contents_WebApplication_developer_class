<section class = "objectAndArray">
    <h2>Class / Object / Array</h2>
    <dl>
        <dt>
          <a href="https://replit.com/@hyeah0/Class">Class</a>
        </dt>
        <dd>틀만 정의 해놓음 template</dd>
        <dt>
          <a href="https://replit.com/@hyeah0/Object">Object</a>  
        </dt>
        <dd>서로 연관된 특징과 행동들을 묶어 놓는것</dd>
        <dt>
          <a href="https://replit.com/@hyeah0/Array">Array(자료구조)</a>
        </dt>
        <dd>비슷한 object를 담는 것</dd>
    </dl>
</section>

### - Class

```
class cla{
      constructor(key1, key2){
          this.key1 = key1;
          this.key2 = key2;
      }

      메서드명(){
          console.log(`${this.name} hi`);
      }
}
```

### - Object

- 객체는 length 사용이 불가하다

  ```
  let obj = {
    key: 'name',  >> key와 value로 이루어져있는 속성
    key2: 'name2'
  }

  obj.key == 'name'
  ==
  obj['key'] == 'name'
  ```

### - Array

- 배열은 순서가 있는 값으로, 그 순서는 인덱스로 구성이 되어있다. (번호는 0부터 매긴다)

  ```
  let arr = [1, 'text', ['배열1','배열2','배열3'], { 객체key: 객체value} ]
  arr[0] == 1
  arr[1] == 'text'

  arr.length  == 4
  ```
