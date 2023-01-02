package com.spring.coffee;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.CoffeeTestDAO;

@Controller
public class CoffeeTestController {
	
	@Inject
	private CoffeeTestDAO testDao;
	
	@RequestMapping("bean_test.do")
	public String beanTest(HttpSession session, HttpServletRequest request, Model model) {
		
		System.out.println("-- bean_test.do -----------------------------------------------------------------------");
		int turn = Integer.valueOf(request.getParameter("turn"));
		
		Map<String, Integer> testChooseMap;
		
		// 결과 값을 담은 세션이 없을 경우 새로운 세션에 담는다.
		// 기존 세션이 있을 경우 기존 세션에 값을 담는다.
		if(session.getAttribute("testChooseMap")==null) {
			testChooseMap = new HashMap<String, Integer>();
		
		} else {
			testChooseMap = (Map<String, Integer>) session.getAttribute("testChooseMap");
		}
		
		// 선택값 세션에 저장
		if(request.getParameter("type")!=null) {
			int typeNum = Integer.valueOf(request.getParameter("type"));
			
			switch(turn){
			 	case 2 : testChooseMap.put("testRsBrew", typeNum); 
			 			 break;
			 	case 3 : testChooseMap.put("testRsAdd", typeNum); 
			 	         break;
			 	case 4 : testChooseMap.put("testRsDecaff", typeNum); 
			 	         break;
			 	case 5 : testChooseMap.put("testRsAcid", typeNum); 
			 	         break;
			 	case 6 : testChooseMap.put("testRsTaste", typeNum); 
			 	         break;
			}
			session.setAttribute("testChooseMap", testChooseMap);
			
		};
		
		// 1: coffee brew 
		// 2: coffee add
		// 3: coffee decaff
		// 4: coffee taste acid
		// 5: coffee_taste
		// 6: coffee_grind
		// 테이블 가져오기
		List<Map<String, Object>> testList = new ArrayList();
		String[] typesArr = {"testRsBrew", "testRsAdd","testRsDecaff","testRsAcid","testRsTaste"};
		
		switch(turn){
			case 1 : testList = testDao.getBrewTest();
			         break;
		 	case 2 : testList = testDao.getAddTest(); 
		 		     break;
		 	case 3 : testList = testDao.getDecafTest(); 
		 			 break;
		 	case 4 : testList = testDao.getAcidTest(); 
		 			 break;
		 	case 5 : testList = testDao.getTasteTest(); 
		 			 break;
		 	case 6 : testList = testDao.getGrindTest(); 
		 			 break;
		}
		
		// 확인용
		//System.out.println("---- test " + turn + " 번째 ------------------------------------------------------------");
		//for (int i = 0; i < testList.size(); i++) {
		//	System.out.println(testList.get(i));
		//}
		
		// 세션값 확인
		System.out.println("-- 세션값확인 >> 테스트 " + turn + " 번째 선택 -------------------------------------------------");
		for (int i = 0; i < testChooseMap.size(); i++) {
			System.out.println(typesArr[i] + " : " + testChooseMap.get(typesArr[i]) );
		}
		
		
		model.addAttribute("testList", testList);
		model.addAttribute("turn", turn);
		
		System.out.println("---------------------------------------------------------------------------------------");
		return "./test/coffeeTestN";
	}
	
	@RequestMapping("bean_test_result.do")
	public void beanTestResult(HttpSession session, HttpServletResponse response) throws IOException {
		
		System.out.println("-- bean_test_result.do ----------------------------------------------------------------");
		String[] typesArr = {"testRsBrew", "testRsAdd","testRsDecaff","testRsAcid","testRsTaste"};
		
		// 타입넘 넘겨주기
		Map<String, Integer> testChooseMap = (Map<String, Integer>) session.getAttribute("testChooseMap");
		
		System.out.println("-- 세션값확인 ----------------------------------------------------------------------------");
		for (int i = 0; i < testChooseMap.size(); i++) {
			System.out.println(typesArr[i] + " : " + testChooseMap.get(typesArr[i]) );
		}
		
		// 테스트 결과값 확인
		List<Map<String, Object>> testMapList = testDao.getTestResultTypeNum(testChooseMap);
		
		// 테스트 결과값 넘겨주기 (결과값 : test_result_num)
		int test_result_num = Integer.parseInt(String.valueOf(testMapList.get(0).get("TEST_RESULT_NUM")));
		String test_name = (String) testMapList.get(0).get("TEST_NAME"); 
		String test_img = (String) testMapList.get(0).get("TEST_IMG"); 
		
		System.out.println("test_result_num : " + test_result_num);
		
		// 로그인 한 회원이라면 결과값 저장 하기
		if(session.getAttribute("member_num")!=null) {
			int member_num = (Integer) session.getAttribute("member_num");
			System.out.println("로그인한 멤버의 멤버넘 : " + member_num );
			
			Map<String, Integer> updateMap = new HashMap<String, Integer>();
			updateMap.put("member_num", member_num);
			updateMap.put("test_result_num", test_result_num );
			
			int result = testDao.updateTestResultTypeNum(updateMap);
			System.out.println("로그인한 회원의 테스트값 수정 결과 : " + result);
			
			// 세션 수정
			if( (Integer) session.getAttribute("test_num") != test_result_num) {
				session.setAttribute("test_num", test_result_num );
				session.setAttribute("test_img", test_img);
				session.setAttribute("test_name", test_name);
			}
		}
		
		System.out.println("---------------------------------------------------------------------------------------");
		
       
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='testResult.do?no="+test_result_num+"'");
		out.println("</script>");
		
		
	}
	
}
