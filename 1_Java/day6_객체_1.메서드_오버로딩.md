## day6_객체(class&method)_오버로딩
### 메서드 다중정의(method overloading)
- 동일한 클래스에서 동일한 이름의 메서드가 여러개 정의되는 자바 문법
- 일관된 이름을 정의할 수 있어서 개발자(사용자)에게 코드의 직관성 제공

[메서드 다중정의 규칙]
1. 메서드 이름이 동일해야함
2. 반드시 매개변수의 갯수가 같은 경우에는 매개변수의 자료형이 달라야함
	  또는 매개변수의 갯수가 달라야함
3. 리턴타입(반환형)은 무관함

#### 예시 

1. 매개변수 이름 동일, 자료형만 상이

	    sum(int k, int e)
	    sum(int k, double e)
  
2. 매개변수 이름 동일, 자료형의 갯수 상이

	    sum(int kor, int eng)
	    sum(int kor, int eng, int mat)
	    sum(int kor, int eng, int mat, int java)
