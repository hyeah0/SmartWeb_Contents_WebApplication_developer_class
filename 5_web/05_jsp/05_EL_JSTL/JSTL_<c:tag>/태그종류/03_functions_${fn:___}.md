## functions (jstl fn)

### 사용방법

- jsp 상단에 선언 후 사용

```
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

- 사용 형식
${fn:함수()}
${fn:contains(str, str)}
${fn:split(str, '|')}
```

### 종류

<table>
<tr>
    <td>fn:contains(string, sbustring)</td>
    <td>string이 substring을 포함하면 return true 반환</td>
</tr>
<tr>
    <td>fn:containsIgnoreCase(string, sbustring)</td>
    <td>대소문자 관계없이 string이 substring을 포함하면 return true 반환</td>
</tr>
<tr>
    <td>fn:startsWith(string, prefix)</td>
    <td>string이 prefix로 시작하면 return True</td>
</tr>
<tr>
    <td>fn:endsWith(string, suffix)</td>
    <td>string이 suffix로 끝나면 return True</td>
</tr>
<tr>
    <td>fn:escapeXml(string)</td>
    <td>stting에 XML과 HTML에서 < >& ' " 문자들이 있으면, XML엔티티 코드로 바꿔준뒤 문자열 반환</td>
</tr>
<tr>
    <td>fn:indexOf(string, sbustring)</td>
    <td>string에서 substring이 처음으로 나타나는 인덱스 반환</td>
</tr>
<tr>
    <td>fn:split(string, separator)</td>
    <td>string내의 문자열 separetor에 따라 나누어서 배열로 구성해서 반환</td>
</tr>
<tr>
    <td>fn:join(array, separator)</td>
    <td>array요소들을 separator를 구분자로 하여 연결해서 반환</td>
</tr>
<tr>
    <td>fn:length(item)</td>
    <td>item이 배열이나 컬렉션이면 요소의 개수를 문자열이면 문자의 개수를 반환</td>
</tr>
<tr>
    <td>fn:replace(string, before, after)</td>
    <td>string내에 있는 before 문자열을 after 문자열로 모두 변경해서 반환</td>
</tr>
<tr>
    <td>fn:substring(string, begin, end)</td>
    <td>string에서 begin인덱스에서 시작해서 end인덱스에 끝나는 부분의 문자열 반환</td>
</tr>
<tr>
    <td>fn:substringAfter(string, sbustring)</td>
    <td>string에서 substring이 나타나는 이후의 문자열 반환</td>
</tr>
<tr>
    <td>fn:substringBefore(string, sbustring)</td>
    <td>string에서 substring이 나타나는 이전의 문자열 반환</td>
</tr>
<tr>
    <td>fn:toLowerCase(string)</td>
    <td>string을 모두 소문자로 변경 후 리턴</td>
</tr>
<tr>
    <td>fn:toUpperCase(string)</td>
    <td>string을 모두 대문자로 변경 후 리턴</td>
</tr>
<tr>
    <td>fn:trim(string)</td>
    <td>string앞뒤의 공백을 모두 제거한 후 반환</td>
</tr>
</table>
