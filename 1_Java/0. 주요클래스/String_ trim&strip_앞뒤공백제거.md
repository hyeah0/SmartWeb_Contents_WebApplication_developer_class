## trip & strip 
- 둘다 글자 앞뒤 공백제거
- java.lang.String 클래스의 strip() 메소드는 Java 11 이후 새로 추가된 메소드이다.

## 차이점

- trim()  : '\u0020' 이하의 공백들만 제거
- strip() :  유니코드의 공백들을 모두 제거
 
- 일반적으로 많이 사용하는 스페이스('\u0020'), 탭('\u0009) 등 외에도 
더 많은 종류의 공백 문자들이 있다.

## 예시코드
```
public class StringSpace {    
  public static void main(String[] args) {         
    // 앞뒤로 공백이 있는 문자열        
    String str = "\u2003hello world\u2003";  
    
    // 공백 제거         
    String trimStr = str.trim();        
    String stripStr = str.strip();         
    
    // 공백 제거 문자열 출력        
    System.out.println("원본 문자열 : '" + str + "'");        
    System.out.println("trim 문자열 : '" + trimStr + "'");        
    System.out.println("strip 문자열 : '" + stripStr + "'");     }}
    
/* --- 결과 --- */


```
