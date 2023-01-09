## 주석

<table>
<tr>
    <th>주석</th>
    <th colspan="2">설명</th>
</tr>
<tr>
    <td>@RequestMapping("주석 value")</td>
    <td>요청 들어온 URI의 요청과 주석 value 값이 일치하면 해당 클래스나 메소드가 실행</td>
</tr>
<tr>
    <td>@GetMapping("주석 value")</td>
    <td>요청 들어온 URI의 요청을 Get 형태로 받아온다.</td>
</tr>
<tr>
    <td>@PostMapping("주석 value")</td>
    <td>요청 들어온 URI의 요청을 Post 형태로 받아온다.</td>
</tr>
<tr>
    <td>@RequestParam()</td>
    <td>요청 파라미터를 매개변수에 붙이는 주석
    <br>@RequestParam(name="year", required=false, defaultValue="2022" method = RequestMethod.POST) String year 
    <br>== 파라미터 이름이 year인 값을 String인 자료형인 year 변수에 저장 (파라미터 필수 입력은 아니다.)
    <br>== 기본값은 "2022"로 설정(파라미터명이 없거나, 파라미터 값이 설정되지 않고 넘어올때 default 설정값으로  지정)
    <br>== post 형식으로 받아온다.(body에 값을 받아옴) , get 형식 : url에서 데이터 작성
    <br>생략가능
    </td>
</tr>
<tr>
    <td>@ModelAttribute("적용대상")</td>
    <td>적용대상을 model의 속성으로 자동 추가해주는 주석
    <br>model.addAttribut("yoil",yoil) == @ModelAttribute("yoil")
    <br>생략가능
    </td>
</tr>
<tr>
    <th colspan="2"> 예외주석 </th>
</tr>
<tr>
    <td>@ExceptionHandler(예외.class)</td>
    <td>컨트롤러 내부에서 예외 발생시 해당 메서드가 실행</td>
    <td>
        <a src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/tree/main/5_web/06_Spring/08_Exception_%EC%98%88%EC%99%B8">예외참고</a>
    </td>
</tr>
<tr>
    <td>@ControllerAdvice</td>
    <td>에러발생시 해당 메서드 실행(적용범위 : 모든 패키지)</td>
</tr>
<tr>
    <td>@ControllerAdvice("com.fastcampus.ch2")</td>
    <td>특정 패키지 안에서 에러 발생시 해당 메서드 실행</td>
</tr>
<tr>
    <td>@ResponseStatus(HttpStatus.---)</td>
    <td>응답상태 번호 변경</td>
</tr>
</table>
