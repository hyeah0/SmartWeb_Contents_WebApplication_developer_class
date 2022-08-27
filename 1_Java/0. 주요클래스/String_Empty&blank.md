# String class \_ isEmpty() and isBlank()

- java.lang.String 클래스에는 isEmpty() 메소드와 isBlank() 메소드
  (JAVA 11 이후 버전 기준)

1. isEmpty() - null 일경우만 true

   - JAVA 6 이후에 추가된 메소드
   - 문자열의 길이가 0인 경우에, true를 리턴한다.

2. isBlank() - null 이거나 공백으로만 이루어져있을 경우
   - JAVA 11 이후에 추가된 메소드
   - 문자열이 비어 있거나, 빈 공백으로만 이루어져 있으면, true를 리턴한다.

## 예시

```
public class Empty_Blank {

	public static void main(String[] args) {

		// null이 아닌경우 false
		System.out.println("Hello".isEmpty() + ","
		                 + "Hello".isBlank()); 				// false, false

		// 문자열에 공백이 포함되어있을 경우 : false
        System.out.println("  Hello  ".isEmpty() + ","
                         + "  Hello  ".isBlank());   		// false, false

        // null인 경우 : true
        System.out.println("".isEmpty() + ","
                         + "".isBlank()); 					// true, true

        // 공백인 경우 : isEmpty = false , isBlank() = true
        System.out.println("  ".isEmpty() + ","
                         + "  ".isBlank()); 				// false, true
	}

}
```

## 문자열에서 공백이 포함되어있는지 확인 하고 싶을때

- contain & indexOf & matches 메서드 참고
  [contain & indexOf & matches]()
