```
// 주문내역 리스트 주문월(중복제외)
public List<String> setArr(List<CoffeeOrderDTO> orderList) {

    // 1. 주문내역 목록의 크기만큼 배열생성
    String[] orderMonArr = new String[orderList.size()];

    // 2. 배열에 주문 월을 등록
    for (int i = 0; i < orderList.size(); i++) {
        orderMonArr[i] = orderList.get(i).getOrder_month();
    }

    // 3. 배열을 set에 저장
    HashSet<String> hashSet = new HashSet<String>(Arrays.asList(orderMonArr));

    // 4. 저장한 set을 list에 저장
    List<String> orderMonths = new ArrayList<String>(hashSet);

    // 5. 리스트 데이터 내림차순
    Collections.sort(orderMonths, Collections.reverseOrder());

    return orderMonths;
}
```

## Arrays.asList(orderMonArr)

- asList()를 사용해서 List 객체를 만들 때 새로운 배열 객체를 만드는 것이 아니라,
  원본 배열의 주소값을 가져온다.
