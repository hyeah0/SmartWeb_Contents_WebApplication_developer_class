## 코드

- [kakaoapi.js](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/webapp/resources/js/cartAndOrderJs/kakaoapi.js)
- [CoffeeOrderController](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/6_Spring_Project_%EC%9B%90%EB%91%90%EC%87%BC%ED%95%91%EB%AA%B0/spring/Final_Coffee_CuppACoffee/src/main/java/com/spring/coffee/CoffeeOrderController.java)

```
kakaoapi.js
$.ajax({
            url:'/coffee/kakaopay.do',
            data : {itemName: itemName, quantity : quantity, totalAmout: totalAmout },
            async : false,
            dataType: 'json',
            success : function(data){
                let box = data.next_redirect_pc_url;
                window.open(box);
                window.close();

            },
            error: function(error){
                alert('kakaopay.do 에러남');
            }
        })
```

```
// 카카오 결제
@RequestMapping("kakaopay.do")
@ResponseBody
public String kakaopay(HttpServletRequest request) {

    String itemName = request.getParameter("itemName");
    int quantity = Integer.valueOf(request.getParameter("quantity"));
    int totalAmout = Integer.valueOf(request.getParameter("totalAmout"));

    System.out.println("-- 결제 순서 2 -------------------------------------------------------------------");
    System.out.println("--kakaopay----------------------------------------------------------------------");
    System.out.println("구매 아이템 : " + itemName);
    System.out.println("구매 수량 : " + quantity);
    System.out.println("구매 합계 : " + totalAmout);
    System.out.println("--------------------------------------------------------------------------------");

    String fin = kakao(itemName, quantity, totalAmout);

    return fin;
}
```

```
// 카카오
	public String kakao(String itemName, int quantity, int totalAmout) {

		System.out.println("-- 결제 순서 3 -------------------------------------------------------------------");
		System.out.println("-- kakao -----------------------------------------------------------------------");
		String fin = null;
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // 주소
			HttpURLConnection con = (HttpURLConnection) url.openConnection(); // 서버연결

			// 메서드 방식
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK ae43b251191006bb3cd574d0340abccf");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// dooutput : 요청자가 서버에게 줘야할 값이 있을때 true
			con.setDoOutput(true);

			// parameter 정의
			String param = "cid=TC0ONETIME"
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=" + itemName
					+ "&quantity=" + quantity
					+ "&total_amount=" + totalAmout
					+ "&tax_free_amount=0" // 비과세
					+ "&approval_url=http://localhost:8282/coffee/approvalpay.do"
					+ "&cancel_url=http://localhost:8282/coffee/cancelpay.do"
					+ "&fail_url=http://localhost:8282/coffee/failpay.do";

			OutputStream put = con.getOutputStream(); 			  // 서버에게 전달
			DataOutputStream dataPut = new DataOutputStream(put); // 서버에게 데이터를 전달
			//dataPut.writeBytes(param);						  // 파라미터를 바이터 형식으로 전환
			dataPut.write(param.getBytes("UTF-8")); 			  // 상품명 한글일때 깨져나오는 에러 수정

			// dataPut.flush(); 가지고 있는거를 연결자에게 주고 비운다.
			// dataPut.close(); 자동으로 연결자에게 데이터를 주고 끝냄(flush와 close가 합쳐여있다.)
			dataPut.close();

			int result = con.getResponseCode(); // 결과보기
			InputStream input; // 결과 받는애

			if (result == 200) { // 정상 통신 완료!
				input = con.getInputStream();
				System.out.println("정상통신 완료!");
			} else { // 정상 통신 실패
				input = con.getErrorStream();
				System.out.println("정상통신 실패!");
			}

			// 결과를 받아온걸 읽어서 바이트 형식을 문자열로 변환
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader change = new BufferedReader(reader);

			fin = change.readLine();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fin;
	}
```
