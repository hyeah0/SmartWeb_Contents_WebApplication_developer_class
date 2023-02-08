## 형변환 에러 BigDecimal >>> integer

```
java.lang.ClassCastException:
class java.math.BigDecimal cannot be cast to class java.lang.Integer
(java.math.BigDecimal and java.lang.Integer are in module java.base of loader 'bootstrap')
com.spring.coffee.CoffeeOrderController.summaryDelivery(CoffeeOrderController.j
```

## 에러 사유

- Map 데이터를 가져올 때 Map 담긴 값의 데이터 타입을 Integer로 진행시에 발생

- 하단과 같이 형변환 할 경우 에러
  - ▶ BigDecimal >> Integer
  - ▶ Long >> Integer

## 에러 해결방법

1. String.valueOf 를 사용하여 String으로 먼저 변환
2. Integer.parseInt를 사용하여 Integer로 변환

### 에러 예시

```
List<Map<String, Integer>> deliveryList에서 list i번째의 key가 "type_num"인 데이터를 가져올때

int type_num = Integer.parseInt(String.valueOf(deliveryList.get(i).get("TYPE_NUM")));
int row_cnt = Integer.parseInt(String.valueOf(deliveryList.get(i).get("ROWCNT")));
```

### 에러 해결하여 사용한 코드

[CoffeeOrderController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/FinalProject/src/main/java/com/spring/coffee/CoffeeOrderController.java)

```
// 관리자
// 배송 현황 갯수
public Map<String, Integer> summaryDeliveryAdmin(HttpSession session) {

    System.out.println("--summaryDeliveryAdmin----------------------------------------------------------");

    int deliveryBefore = 0; // 배송대기
    int deliveryIng = 0; // 배송중
    int deliveryOk = 0; // 배송완료
    int cancelOrder = 0; // 주문취소

    int type_num = 0;
    int row_cnt = 0;

    if (session.getAttribute("summaryDeliMapAdmin") != null) {
        session.removeAttribute("summaryDeliMapAdmin");
    }

    List<Map<String, Integer>> deliveryList = orderDao.getDeliveryTypeCntA();

    for (int i = 0; i < deliveryList.size(); i++) {

        System.out.println(deliveryList.get(i));
        type_num = Integer.parseInt(String.valueOf(deliveryList.get(i).get("TYPE_NUM")));
        row_cnt = Integer.parseInt(String.valueOf(deliveryList.get(i).get("ROWCNT")));

        switch (type_num) {
            case 0:
                deliveryBefore = row_cnt;
                break;
            case 1:
                deliveryIng = row_cnt;
                break;
            case 2:
                deliveryOk = row_cnt;
                break;
            case 3:
                cancelOrder = row_cnt;
                break;
        }

    }

    Map<String, Integer> summaryDeliMapAdmin = new HashMap<String, Integer>();

    summaryDeliMapAdmin.put("deliveryBefore", deliveryBefore);
    summaryDeliMapAdmin.put("deliveryIng", deliveryIng);
    summaryDeliMapAdmin.put("deliveryOk", deliveryOk);
    summaryDeliMapAdmin.put("cancelOrder", cancelOrder);

    session.setAttribute("summaryDeliMapAdmin", summaryDeliMapAdmin);

    System.out.println("--------------------------------------------------------------------------------");
    return summaryDeliMapAdmin;
}
```
