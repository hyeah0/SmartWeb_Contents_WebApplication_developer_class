package ListMap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
	}

}
