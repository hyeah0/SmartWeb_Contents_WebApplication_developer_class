# String class \_ contain(), indexOf(), matches()

| 메서드                     | 반환형  | 사용                                                                                              |
| -------------------------- | ------- | ------------------------------------------------------------------------------------------------- |
| contain("검색어")          | boolean | - 문자열 안에 검색어가 포함되어있는지                                                             |
| indexOf("검색어")          | int     | - 문자열에서 검색어의 위치를 반환 </br> - 원하는 문자가 있을 경우 문자의 위치 반환 , 없을 경우 -1 |
| indexOf(char ch))          | int     | - 해당 문자를 가지는 위치 반환                                                                    |
| indexOf(String str, int i) | int     | - str문자를 i번째 부터 확인                                                                       |
| indexOf(char ch, int i)    | int     | - ch를 i번째 부터 확인                                                                            |
| matches(".\*검색어.\*")    | boolean | - 정규식을 이용한 문자열 검색</br> - 한글,숫자등과 같이 해당형태의 값이 포함되어있는지            |

[matches 상세]()

## 예제

```
public class Contain_indexOf_matches_indigit {
	public static void main(String[] args) {
		String str = "Only I can determine my own mood. And today, perhaps, I will choose happiness.";

		// contains
		System.out.println(str.contains("mood"));		// true
        System.out.println(str.contains(" "));		    // true

		// indexOf
		System.out.println(str.indexOf("mood"));		// 28 문자열 검색
		System.out.println(str.indexOf('m'));			// 16 단어 검색
		System.out.println(str.indexOf("mood",30)); 	// -1 문자열을 30번째 index부터 검색
		System.out.println(str.indexOf('m',2));			// 16 단어를 2번째 index부터 검색

		// matches(".*검색어.*")
		System.out.println(str.matches(".*mood.*"));	// true

	}
}
```
