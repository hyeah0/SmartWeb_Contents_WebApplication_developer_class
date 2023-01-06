package com.fastcampus.ch2;

import java.io.FileNotFoundException;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class ExceptionController {

	/*
	 * @ExceptionHandler
	 * 컨트롤러 내부에서 예외 발생시 하단 메서드가 실행된다.
	 * */
	
	// 예외 전체
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex, Model model) {
		
		System.out.println("catcher in exceptionController");
		
		// jsp 페이지 상단에 isErrorPage = "false" 일 경우 또는 생략되었을 경우
		//model.addAttribute("ex", ex);
		return "error";
	}
	
	/*
	// 예외가 한개일 경우
	@ExceptionHandler(NullPointerException.class)
	public String nullCatcher(Exception ex, Model model) {
		model.addAttribute("ex", ex);
		return "error";
	}*/
	
	/*
	// 예외가 여러개일경우 배열사용 { 예외1, 예외2 }
	@ExceptionHandler({NullPointerException.class, FileNotFoundException.class})
	public String arrCatcher(Exception ex, Model model) {
		model.addAttribute("ex", ex);
		return "error";
	}*/
	
	// ----------------------------------------------------------------------------------------
	@RequestMapping("/ex")
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)	// 상태번호 200 >> 500으로 변경
	public String main() throws Exception{
		
//		throw new Exception("예외 발생");
//		//500 에러 : java.lang.Exception: 예외 발생 
	
//		try {
//			throw new Exception("예외 발생");
//			// 404 에러 : java.lang.Exception: 예외 발생
//		
//		} catch (Exception e) {
//			
//			return "error";
//			// 200 : 에러처리를 성공적으로 완료했기 때문에 200 반환
//			// 200 반환값을 500으로 변환필요(@responseSatus)
//		}
		
		// == try catich 문 과 동일 
		throw new Exception("예외발생했습니다.");
	}
	
	// 예외가 nullpoint 일경우
	@RequestMapping("/ex2")
	public String main2() throws Exception{
		throw new NullPointerException("예외발생했습니다.");
	}
	
	// 예외가 여러개일 경우 사용
	@RequestMapping("/ex3")
	public String main3() throws Exception{
		throw new FileNotFoundException("예외발생했습니다.");
	}
}
