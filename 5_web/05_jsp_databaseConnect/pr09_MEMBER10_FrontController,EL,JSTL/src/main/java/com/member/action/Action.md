```
package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	//excute 실행하다
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
```
