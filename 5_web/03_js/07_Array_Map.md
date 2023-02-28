# 배열.map

- 새로운 배열 반환

```
const arr = ['swim','tennis'];
console.log(arr.map())           // swim tennis

console.log(arr.map(hobby=>{
    return 'hello' + hobby
}))                              // hellow swim   hellow tennis
```
