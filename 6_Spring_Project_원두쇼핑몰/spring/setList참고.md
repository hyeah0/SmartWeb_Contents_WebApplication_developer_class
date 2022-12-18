````
// 주문내역 리스트 주문월(중복제외)
	public String[] setArr(List<CoffeeOrderDTO> orderList) {

		System.out.println("--setArr(중복 월 제거)-------------------------------------------------------------");
        // 1. order_month 를 String 자료형 배열에 넣기
		String[] orderMonArr = new String[orderList.size()];

		for(int i=0; i<orderList.size(); i++) {
			orderMonArr[i] = orderList.get(i).getOrder_month();
		}

        // 2. 중복값을 제외하는 hashSet에 order_month를 넣기(단, 정렬 안됨)
		HashSet<String> hashSet = new HashSet<String>(Arrays.asList(orderMonArr));

		System.out.println("---");
		// 3. hashset을 정렬하기 위해 list에 넣음
        // 오름차순
        List<String> list = new ArrayList<String>(hashSet);
		Collections.sort(list);
		for(String a: list) {
			System.out.println(a);
		}

		System.out.println("---");
        // 내림차순
		Collections.sort(list, Collections.reverseOrder());
		for(String a: list) {
			System.out.println(a);
		}
		System.out.println("---");

		String[] resultArr = hashSet.toArray(new String[0]);

		System.out.println(resultArr.length);
		System.out.println(Arrays.toString(resultArr));
		System.out.println("--------------------------------------------------------------------------------");

		return resultArr;
	}
	// --------------------------------------------------------------------------------------------------
```

````
