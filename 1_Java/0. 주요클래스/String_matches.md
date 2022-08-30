# String class \_ matches()

- 정규식을 이용한 문자열 검색


## 자주쓰이는 패턴
1) 숫자만 : ^[0-9]*$2) 
2) 영문자만 : ^[a-zA-Z]*$3) 
3) 한글만 : ^[가-힣]*$4) 
4) 영어 & 숫자만 : ^[a-zA-Z0-9]*$5) 
5) E-Mail : ^[a-zA-Z0-9]+@[a-zA-Z0-9]+$6) 
6) 휴대폰 : ^01(?:0|1|[6-9]) - (?:\d{3}|\d{4}) - \d{4}$7) 
7) 일반전화 : ^\d{2,3} - \d{3,4} - \d{4}$8) 
8) 주민등록번호 : \d{6} \- [1-4]\d{6}9) 
9) IP 주소 : ([0-9]{1,3}) \. ([0-9]{1,3}) \. ([0-9]{1,3}) \. ([0-9]{1,3})

[참고홈페이지](https://highcode.tistory.com/6)

## 정규식

  | 정규식         | 사용                                                                                                        |
  | -------------- | ----------------------------------------------------------------------------------------------------------- |
  | .              | 문자 1개 의미                                                                                               |
  | $              | 문자열의 끝 지점 </br> apple$ 일경우 문장 끝에 apple 있는지 확인                                            |
  | []             | [] 안에있는 문자열과 일치하는 문자 1개를 찾는다<br> - 와 함께 사용하여 범위지정 가능                        |
  | \*             | \* 별앞에 문자가 0회 이상 반복</br>a\* : a가 1번이라도 있을때 </br> .\* 문자가 하나라도 있을때              |
  | .\*검색어.\*   | - 검색어가 있으면 true</br> - .\* = sql 에서 % (양 옆에 어떤 문자열이 오든 상관없이 검색어 가 있는 지 확인) |
  | [Tt]rue        | True/true 문자열 패턴 찾기                                                                                  |
  | .\*[0-9].\*    | 숫자가 있는지 확인                                                                                          |
  | .\*[A-Za-z].\* | 문자가 있는지                                                                                               |
  | a.\*e          | a로시작해서 e로 끝나는 지                                                                                   |

## Metacharacters

| Regular   | Expression                                             | Description |
| --------- | ------------------------------------------------------ | ----------- |
| .         | 어떤 문자 1개를 의미                                   |
| ^regex    | ^ 다음 regex로 line을 시작하는지                       |
| regex$    | $ 앞의 regex가 line의 마지막으로 끝나는지              |
| [abc]     | a, b, c 중의 문자 1개                                  |
| [abc][vz] | a, b, c 중에 문자 1개와 v, z 중에 문자 1개의 조합      |
| [^abc]    | a, b, c를 제외한 문자 1개                              |
| [a-d1-7]  | ad, 17 사이의 문자 1개                                 |
| X         | Z                                                      | X 또는 Z    |
| \d        | 0~9 사이의 숫자, [0-9]와 동일                          |
| \D        | 숫자가 아닌 어떤 문자, [^0-9]와 동일                   |
| \s        | whitespace 1개, [\t\n\x0b\r\f]와 동일                  |
| \S        | whitespace를 제외한 문자                               |
| \w        | Alphanumeric(alphabet, 숫자) 문자, [a-zA-Z_0-9]와 동일 |
| \W        | Alphanumeric을 제외한 문자(whitespace 등)              |
| \S+       | whitespace를 제외한 여러 문자                          |
| \b        | 단어의 경계(공백)를 찾습니다                           |

## Quantifiers

Quantifiers는 요소들을 얼마나 반복시킬지 정의합니다.

| Regular | Expression Description         |
| ------- | ------------------------------ |
| \*      | 0회 이상 반복                  |
| +       | 1회 이상 반복                  |
| ?       | 0 또는 1회만                   |
| {X}     | X회 이상 반복                  |
| {X,Y}   | X~Y 사이의 수만큼 반복         |
| \*?     | 가장 적게 일치하는 패턴을 찾음 |

## 예시

```
public class Contain_indexOf_matches_indigit {
	public static void main(String[] args) {
	    /*
		 * matches 정규식에 따른 결과
		 */
		String matchTestString = "True";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches("[Tt]rue")); 	// true

		matchTestString = "true";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches("[Tt]rue"));		// true

		matchTestString = "yes";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches("[Tt]rue"));		// true

		matchTestString = "apple";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches("[Aa]pple"));	// true

		matchTestString = "hello world";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches("h.*d"));		// true
		System.out.println("Is it true ? : " + matchTestString.matches("h.........d"));	// true

		matchTestString = "hello world";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches(".*[A-Z].*"));		// false
		System.out.println("Is it true ? : " + matchTestString.matches(".*[a-z].*"));		// true
		System.out.println("Is it true ? : " + matchTestString.matches(".*[A-Za-z].*"));	// true
		System.out.println("Is it true ? : " + matchTestString.matches(".*[0-9].*"));		// false

		matchTestString = "abc 456";
		System.out.println("\n" + matchTestString);
		System.out.println("Is it true ? : " + matchTestString.matches(".*[0-9].*"));	// true



		String result;
	    result = "The cat sat on the mat.";
	    System.out.println("\n" + result);
	    result = result.replaceAll("[Tt]he", "*");
	    System.out.println(result);						// * cat sat on * mat.

	    result = "The cat sat on the mat.";
	    System.out.println("\n" + result);
	    result = result.replaceAll("^[Tt]he", "*");
	    System.out.println(result);						// * cat sat on the mat.

	}
}
```
