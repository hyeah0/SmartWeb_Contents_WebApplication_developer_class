# Character class \_ isDigit()

- 1. isDigit() - 숫자일경우 true

  - 반환형 : boolean
  - 문자열에 숫자가 포함되어있는지 확인 할때 사용
  - charAt() 메서드와 함께 사용 또는 toCharArray();

  ## 예시

```
public class isDigit {

	public static void main(String[] args) {

		// charAt()
		String str = "Channel number 5";

		System.out.println("---------------isDigit charAt()---------------");
		for(int i=0; i<str.length(); i++) {
			if(Character.isDigit(str.charAt(i))) {
				System.out.println("[ " + str + " ] 에는 숫자가 포함되어있습니다.\n");
			}
		}

		System.out.println("---------------isDigit toCharArray()---------------");

		//문자열을 한글자씩 자른 형태로 char 배열에 데이터를 담는다
		char[] charArr = str.toCharArray();
		System.out.println(Arrays.toString(charArr));

		for(int i=0; i<charArr.length; i++) {
			if(Character.isDigit(charArr[i])) {
				System.out.println("[ " + charArr[i] + " ] 에는 숫자가 포함되어있습니다.\n");
			}
		}

	}

}
```

- 결과

        ---------------isDigit charAt()---------------
        [ Channel number 5 ] 에는 숫자가 포함되어있습니다.

        ---------------isDigit toCharArray---------------
        [C, h, a, n, n, e, l,  , n, u, m, b, e, r,  , 5]
        [ 5 ] 에는 숫자가 포함되어있습니다.
