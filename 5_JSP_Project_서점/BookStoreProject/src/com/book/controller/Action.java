package com.book.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Action {

	// 반환 타입은 ActionForward 클래스이다.
	// 멤버 변수 >>> isRedirect, path
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws  IOException;
}
