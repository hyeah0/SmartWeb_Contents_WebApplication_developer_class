package ListMap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class listInMap {

	public static void main(String[] args) {
		// list 안에 map
		
		/*
		 * 1. list 생성 
		 * 2. map 생성 및 정보 저장
		 * 3. list에 map 추가
		 * 
		 * 출력
		 * 1. list 전체 출력
		 * 
		 */
		
		// 1. list 준비
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		// 2. map 준비
		Map<String, Object> studentMap = new HashMap<String, Object>();
		
		studentMap.put("name", "김아무개");
		studentMap.put("age", "20");
		studentMap.put("major", "경영학과");
		studentMap.put("email", "aaa@naver.com");
		studentMap.put("phone", "010-1234-5678");
		
		// 3. list에 map 추가
		list.add(studentMap);
		System.out.println(list.get(0));
		// 결과 : {major=경영학과, phone=010-1234-5678, name=김아무개, age=20, email=aaa@naver.com}
		
		// list.clear 후 작성값 list에 넣기
		// 1. list clear 
		list.clear();
		System.out.println("list 삭제후 list size :" + list.size());
		
		// 번외 Scanner 를 사용하여 값 받아오기
		Scanner sc = new Scanner(System.in);
		Object[][] arr = new Object[3][5];
		arr[0][0] = "name";
		arr[0][1] = "age";
		arr[0][2] = "major";
		arr[0][3] = "email";
		arr[0][4] = "phone";
		
		for(int i=1; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				System.out.print(arr[0][j] +"를 입력하세요 >> ");
				studentMap.put((String) arr[0][j], sc.next());
			}
			list.add(studentMap);
		}
		
		System.out.println("입력받은 map list :" + list.size());
		
		// list 출력
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		// list 안 map 키 value 값 
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).get("name"));
		}
		
	}

}
