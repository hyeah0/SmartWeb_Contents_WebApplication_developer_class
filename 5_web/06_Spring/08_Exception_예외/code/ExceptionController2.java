package com.fastcampus.ch2;

import java.io.FileNotFoundException;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

// 사용자 정의 예외
@ResponseStatus(HttpStatus.BAD_REQUEST)	// 상태번호 500 >> 400으로 변경
class MyException extends RuntimeException{
	
	// 인자 생성자 
	public MyException(String msg) {
		super(msg);
	}
	
	// 기본 생성자
	MyException(){this(""); }
}

// --------------------------------------------------------------------------------------------------------

@Controller
public class ExceptionController2 {

	@RequestMapping("/ex4")
	public String main4() throws Exception{
		throw new MyException("예외발생했습니다.");
	}
}
