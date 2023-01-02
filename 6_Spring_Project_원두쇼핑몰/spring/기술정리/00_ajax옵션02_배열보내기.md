## jQuery.ajax() traditional / request.getParameterValues

### ajax 배열 넘기기/ 배열받기

- traditional: true >>> ajax 옵션
- request.getParameterValues >>> controller 배열 받기

### 사용 예시

1. view 단 : 자바스크립트 옵션 설정
2. 서버(controller)단 : 뷰에서 넘어온 데이터를 배열로 받아오기

[order.js](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/webapp/resources/js/cartAndOrderJs/order.js)
[kakaoapi.js](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/webapp/resources/js/cartAndOrderJs/kakaoapi.js)
[CoffeeOrderController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/java/com/spring/coffee/CoffeeOrderController.java)

#### 1. 자바스크립트

```
order.js
// 장바구니 번호 배열
function rowCartNum(){
    let rowCartNumArr = [];

    for(let i=0; i<$(".row_cart_num").length; i++){
        rowCartNumArr.push(Number($($(".row_cart_num")[i]).val()))
    }

    return rowCartNumArr;
}
----------------------------------------------------------------------------------------------

kakaoapi.js
let rowCartArr = rowCartNum()	// 장바구니 번호
let rowPriceArr = rowPrice()	// 주문가격

$.ajax({
    url:'/coffee/order_session.do',
    traditional: true,	// ajax 배열 넘기기 옵션
    data : {requestType: requestType,
            rowCartArr: rowCartArr, rowPriceArr: rowPriceArr,
            totalUsePoint : totalUsePoint, savePoint : savePoint },
    async : false,
    dataType: 'data',
    success : function(data){
        console.log('order_session.do에 데이터 전송 완료(장바구니)')
    },
    error: function(error){
        console.log('order_session.do에 데이터 전송 실패(장바구니)')
    }
})
```

#### 2. request.getParameterValues

```
자바스크립트에서 보내준 rowCartArr 배열 controller에서 받기
String[] cartArr = request.getParameterValues("rowCartArr");

```
