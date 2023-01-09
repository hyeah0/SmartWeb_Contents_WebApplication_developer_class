## 예외

1. try-catch
2. @ExceptionHandler(Exception.class) : 컨트롤러 안에서 사용
3. @ControllerAdvice, @ControllerAdvice("com.---.---") : 모든 패키지에 적용 또는 특정 패키지에서 적용
4. @ResponseStatus(HttpStatus.---) : web.xml에 응답상태 코드별로 뷰지정

### 1. try-catch

```
@RequestMapping("/ex")
public String main() throws Exception{

    throw new Exception("예외 발생");
    //500 에러 : java.lang.Exception: 예외 발생

    try {
        throw new Exception("예외 발생");
        // 404 에러 : java.lang.Exception: 예외 발생

    } catch (Exception e) {

        return "error";
        // 200 : 에러처리를 성공적으로 완료했기 때문에 200 반환
    }
}
```

### 2. @ExceptionHandler(Exception.class) : 컨트롤러 안에서 사용

```
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

// 예외가 한개일 경우
@ExceptionHandler(NullPointerException.class)
public String nullCatcher(Exception ex, Model model) {
    model.addAttribute("ex", ex);
    return "error";
}

// 예외가 여러개일경우 배열사용 { 예외1, 예외2 }
@ExceptionHandler({NullPointerException.class, FileNotFoundException.class})
public String arrCatcher(Exception ex, Model model) {
    model.addAttribute("ex", ex);
    return "error";
}

// 예외가 nullpoint 일경우
@RequestMapping("/ex2")
public String main2() throws Exception{
    throw new NullPointerException("예외발생했습니다.");
}
```

### 3. @ControllerAdvice, @ControllerAdvice("com.---.---") : 모든 패키지에 적용 또는 특정 패키지에서 적용

```
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

```

### 4. @ResponseStatus(HttpStatus.---) : web.xml에 응답상태 코드별로 뷰지정

<table>
    <tr>
        <td>HttpStatus.INTERNAL_SERVER_ERROR</td>
        <td>상태번호를 200 에서 500으로 변경</td>
    </tr>
    <tr>
        <td>HttpStatus.BAD_REQUEST</td>
        <td>상태번호를 500 에서 400으로 변경</td>
    </tr>
</table>

```
@RequestMapping("/ex")
@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)	// 상태번호 200 >> 500으로 변경
public String main() throws Exception{

    try {
        throw new Exception("예외 발생");

    } catch (Exception e) {

        return "error";
        // 200 : 에러처리를 성공적으로 완료했기 때문에 200 반환
        // 200 반환값을 500으로 변환필요(@responseSatus)
    }
}
```

- 사용자 정의 예외 (HttpStatus.BAD_REQUEST : 500 >> 400 )

```
--------------------------- controller ------------------------------------
@ResponseStatus(HttpStatus.BAD_REQUEST)	// 상태번호 500 >> 400으로 변경
class MyException extends RuntimeException{

	// 인자 생성자
	public MyException(String msg) {
		super(msg);
	}

	// 기본 생성자
	MyException(){this(""); }
}

@Controller
public class ExceptionController2 {

	@RequestMapping("/ex4")
	public String main4() throws Exception{
		throw new MyException("예외발생했습니다.");
	}
}

----------------------------- web.xml -------------------------------------
<!-- error page -->
<error-page>
    <error-code>400</error-code>
    <location>/error400.jsp</location>
</error-page>
<error-page>
    <error-code>500</error-code>
    <location>/error500.jsp</location>
</error-page>

```
