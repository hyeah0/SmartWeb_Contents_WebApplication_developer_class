## 코드 예시

1. 한글 인코딩
2. uri 확인(분리)
3. Action 인터페이스, ActionForward 클래스 선언
4. java.util.Properties 클래스 생성
5. Class <?> 동적객체 생성

```
public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		/* -- 한글 인코딩 ---------------------------------------------------------------------- */
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");

		/* -- uri 확인 ----------------------------------------------------------------------- */
			String uri = request.getRequestURI();	 			// request.getRequestURI() : /프로젝트/ 파일명(*.do) 문자열 반환
			String path = request.getContextPath();  			// request.getContextPath() : 현재 프로젝트명 반환
			String command = uri.substring(path.length() + 1);	// uri 에서 파일명만 반환
			String queryString = request.getQueryString();      // request.getQueryString() : 쿼리문

			System.out.println("********************************************************");
			System.out.println("uri >>> " + uri);
			System.out.println("path >>> " + path);
			System.out.println("command >>> " + command);
			System.out.println("queryString >>> " + queryString );
			System.out.println("********************************************************");

		/* -- action 선언 ----------------------------------------------------------------------- */
			Action action = null;				// ActionForward 객체를 return 으로 받는 인터페이스
			ActionForward forward = null;		// isRedirect, path 멤버변수로 있는 객체

        /* -- java.util.Properties 클래스 ------------------------------------------------------- */
			Properties pro = new Properties();

			FileInputStream fis = new FileInputStream("mapping.properties 위치");
			pro.load(fis);
			String value = pro.getProperty(command);    // mapping.properties 파일에서 key(command)에 해당하는 value값을 가져오기

			System.out.println("value >>> " + value);	// value >>> execute|com.reply.action.BbsListAction

			// value 로 가져온 값 0~6 까지의 텍스트가 execute 이면, | 문자열 기준으로 분리
			if(value.substring(0,7).equals("execute")) {

				//StringTokenizer(문자열, "기호") : 문자열을 기호 기준으로 잘라낸다.
				StringTokenizer st = new StringTokenizer(value, "|");
				String url_1 = st.nextToken();			// execute
				String url_2 = st.nextToken();			// 패키지명.클래스명

				System.out.println("url_1 >>> " + url_1);
				System.out.println("url_2 >>> " + url_2);


		/* -- 동적 객체 생성 : newInstance() ------------------------------------------------------ */
				try{

					// Class 객체에 class이름이 url_2인 클래스를 로드한다.
					Class<?> url = Class.forName(url_2);        // Class.forName(패키지명.클래스명) _ 특정클래스를 로드

					// 첫번째 방법 (deptracated - 더이상 사용되지 않는 방법)
					// action = (Action) url.newInstance();

					// 두번째 방법 기본생성자를 가져와 객체 생성
					// 클래스명.getConstructor() : 클래스명의 파라미터가 없는 기본 생성자를 가져오는 메서드
					Constructor<?> constructor = url.getConstructor();
					action = (Action) constructor.newInstance(); // newInstance() _ 객체 생성 >> url_2 의 객체가 생성

					// ActionForward forward = null; >>> null 값에 url_2 클래스의 실행값이 저장(url_2 클래스는 Action 인터페이스를 상속)
					forward = action.execute(request, response);

					System.out.println("FrontController forward >>> " + forward);

				}catch(Exception e) {
					e.printStackTrace();
				}

			}else { // value 로 가져온 값 0~6 까지의 텍스트가 execute 가 아닌경우 view 페이지로 이동

				// ActionForward forward = null; null 값에 새로운 ActionForward 클래스 할당
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath(value);

				System.out.println("sql 데이터를 가져오지 않습니다. 바로 페이지로 이동");
				System.out.println("FrontController forward >>> " + forward);
			}

		if(forward != null) {
			if(forward.isRedirect()) {	// forward.isRedirect() : true인 경우 *.do page
				response.sendRedirect(forward.getPath());

			}else { // forward.isRedirect() : false 인 경우 *.jsp page
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}

	}
}
```

## java.util.Properties 클래스

- Properties 클래스는 HashTable의 하위 클래스 이다. (자료구조에 있는 클래스 Map 계열 컬렉션 프레임 워크 중 하나)
- 보통 환경변수 및 속성 값을 Properties 파일에 저장하여 쉽게 접근할 수 있다.
- Properties 파일은 일련의 키(key), 값 (value) 한쌍으로 이루어져 있다.(key,value 한쌍으로 데이터 저장)

- 1. 보통은 파일에 저장하여 사용, 파일 이름은 \_.properties 이름으로 끝나게 한다.
- 2. FileInputStream 클래스에 Properties 파일 경로를 넣는다. (Properties 파일을 인자로 넣어서 그 스트림으로부터 파일을 가져올 때 사용을 많이 한다.)
- 3. Properties 클래스의 load() 메서드로 인자로 들어온 Properties 파일을 읽어 들인다.
- 4. mapping.properties 파일에서 key(command)에 해당하는 value값을 가져오기

## 동적객체 생성 Class <?>

- Class<?> 객체를 이용하면 new 연산자 사용없이 동적으로 객체 생성이 가능하다.
- 코드 작성 시에 클래스의 이름을 결정할 수 없고, 런타임(실행) 시에 클래스의 이름이 결정되는 경우에 유용하게 사용된다.

- newInstance() 메서드는 기본생성자를 호출해서 객체를 생성하기 때문에 반드시 클래스에 기본생성자가 존재해야한다.
  <br> ( newInstance() 메서드는 더이상 사용되지 않는 방법이다, 따라서 <b>Constructor&lt;&gt; 클래스 getConstructor() 메서드 사용</>)

  - 단, 예외가 발생할 수 있는데,

    1. 해당 클래스가 추상클래스이거나 인터페이스일 경우에 발생
    2. 클래스의 생성자가 접근제한자로 인해 접근할 수 없는 경우에 발생
       <br>따라서 예외 처리 해주어야 한다.

- 반환타입은 Object 타입으로 맞게 형변환을 해주면 되지만, <br>
  클래스의 타입을 모르는 상태이므로 형변환을 해줄 수 없다. <br>
  이러한 문제를 해결하기 위해 인터페이스를 사용한다.

- Class.forName(class 이름)은 파라미터로 받는 class 이름에 해당하는 클래스를 로딩한 후에,<br>
  그 클래스에 해당하는 인스턴스를 리턴해 준다.<br>
  newInstance() 메서드는 로딩한 클래스의 객체를 생성하는 메서드이고, 이렇게 생성된 객체를 동적 객체 생성이라 한다.

### 인스턴스란 ?

- 일반적으로 실행 중인 임의의 프로세스, 클래스의 현재 생성된 오브젝트

- 붕어빵 틀 = class
- 붕어빵 = object
- 각각의 붕어빵들 = instance
- 붕어빵을 굽다 = 인스턴스화 하다.
  [참고 자료](https://victor8481.tistory.com/280)
