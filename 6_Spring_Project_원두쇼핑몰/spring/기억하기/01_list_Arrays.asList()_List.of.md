## Arrays.asList(arr) / List.of(array)

- 자바에서 Array를 List으로 변환하기 위해서는 Arrays.asList(array)를 사용
- Java 9 버전 부터는 List.of(array)라는 새로운 팩토리 메소드를 도입

### 차이점

- Arrays.asList()로 반환된 list는 변경이 가능, null 허용
- List.of()에서 반환된 메서드는 변경이 불가능
- List.of()는 반환 객체가 생성될 때, 내부적으로 파라미터들에 대한 null체크를 하고 null을 허용하지 않음
- List.of()로 반환된 객체의 contains의 경우 파라미터로 null이 들어오면 NPE(Null pointer exception)이 발생

```
--------- 변경
List<Integer> list = Arrays.asList(1, 2, null);
list.set(1, 10); // OK

List<Integer> list = List.of(1, 2, 3);
list.set(1, 10); // Fails with UnsupportedOperationException


--------- null
List<Integer> list = Arrays.asList(1, 2, null); // OK
List<Integer> list = List.of(1, 2, null); // Fails with NullPointerException

List<Integer> list = Arrays.asList(1, 2, 3);
list.contains(null); // Returns false

List<Integer> list = List.of(1, 2, 3);
list.contains(null); // Fails with NullPointerException
```

### 메모리 사용

- Arrays.asList()는 List.of()보다 힙에 더 많은 개체를 생성하기 때문에 더 많은 오버헤드 공간을 차지
- 따라서, 단지 값 요소가 필요한 경우라면 List.of()가 적합

- 변환

  - 예를 들어, Array를 ArrayList 또는 HashSet 등으로 변환하기 위해서는, 참조나 변경 가능 여부는 상관없고 요소만 알면 됩니다. 이 때는 List.of()가 적합

  ```
  List<String> list = new ArrayList<>(List.of(array));
  Set<String> set = new HashSet<>(List.of(array));
  ```
