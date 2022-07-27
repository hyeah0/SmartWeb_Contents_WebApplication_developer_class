# StringTokenizer class 

        - java.lang.Object
            - java.util.StringTokenizer

## - StringTokenizer 클래스란?
- 특수 문자를 기준문자(delimiter)를 기준으로 문자열을 잘라주는 클래스(파싱)
- 기준문자로 분리된 문자열은 문자열을 token(토큰)이라고 한다.
- 웹에서 전화번호를 하이픈(-) 기준으로 앞자리,중간자리,뒷자리 형식으로 구분해서 번호를 추출할 때 사용한다
	 
     예) 주민등록번호, 핸드폰번호

- 형식) 

        1. 특정기호가 포함된 규칙적인 변수값
        2. StringTokenizer 참조변수명 = new StringTokenizer(1.변수명, "특정기호");

        String str = "id=hong&pwd=1234&name=홍길동&age=20&addr=서울시 중랑구";
		StringTokenizer st = new StringTokenizer(str,"&");
        

- StringTokenizer 클래스 자바 api: [StringTokenizer](https://docs.oracle.com/javase/8/docs/api/)

## - StringTokenizer 메서드
- 형식 

        1. 특정기호가 포함된 규칙적인 변수값
        2. StringTokenizer 참조변수명 = new StringTokenizer(1.변수명, "특정기호");
        3. 참조변수명.메서드명();
        
        String str = "id=hong&pwd=1234&name=홍길동&age=20&addr=서울시 중랑구";
		StringTokenizer st = new StringTokenizer(str,"&");
        System.out.println("토큰수 >>> " + st.countTokens());

1. countTokens() 
    - 기존문자로 분리된 토큰의 갯수를 정수값으로 반환

2. hasMoreTokens() 
    -  반환할 다음 토큰이 있는지 확인하는 메서드 있으면 true, 없으면 false 

3. nextToken() 
    - 존재하는 토큰을 반환해주는 메서드

### - StringTokenizer 메서드 예시
- 코드

        public class Ex05 {

	public static void main(String[] args) {
	
		String str = "id=hong&pwd=1234&name=홍길동&age=20&addr=서울시 중랑구";
		StringTokenizer st = new StringTokenizer(str,"&"); // 토큰수 반환
		System.out.println(st);
	
		//countTokens() : 기존문자로 분리된 토큰의 갯수를 정수값으로 반환
		System.out.println("토큰수 >>> " + st.countTokens());
		
		// st.hasMoreTokens  
		// 반환할 다음 토큰이 있는지 확인하는 메서드
		// 있으면 true, 없으면 false
        
		// nextToken() : 존재하는 토큰을 반환해주는 메서드
		
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
	}

}
        
- 결과

        java.util.StringTokenizer@73a28541
        토큰수 >>> 5
        id=hong
        pwd=1234
        name=홍길동
        age=20
        addr=서울시 중랑구
        

