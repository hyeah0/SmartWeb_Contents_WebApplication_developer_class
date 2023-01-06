package com.fastcampus.ch2;

import java.io.FileNotFoundException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice							// 모든 패키지에 적용
@ControllerAdvice("com.fastcampus.ch2")		// 특정 패키지에만 적용
public class ExceptionGlobal {
	
	// 예외 전체
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex, Model model) {
		
		System.out.println("catcher in exceptionGlobal");
		
		model.addAttribute("ex", ex);
		return "error";
	}
	
	// 예외가 여러개일경우 배열사용 { 예외1, 예외2 }
	@ExceptionHandler({NullPointerException.class, FileNotFoundException.class})
	public String arrCatcher(Exception ex, Model model) {
		
		System.out.println("arrCatcher in exceptionGlobal");
		model.addAttribute("ex", ex);
		return "error";
	}
}
