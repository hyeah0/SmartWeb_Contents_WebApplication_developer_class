## FrontController 패턴 2

- 실행 당시에 클래스 객체 생성한다.

## 필요파일

<table border="1" cellspacing="0">
<tr>
    <th> com.reply.action_Action.java </th>
    <td> 인터페이스 
        <br>반환 타입 : ActionForward
    </td>
<tr>
    <th> com.reply.action_ActionForward.java </th>
    <td> 액션 인터페이스에서 리턴타입(반환형)으로 사용될 클래스 
        <br> <b> 클래스 구성요소 </b>
        <br> isRedirect / path 변수
        <br> isRedirect >> boolean타입 
        <br> true : *.do 페이지 / false : *.jsp
        <br> path >> String 타입 / 파일경로 지정
    </td>
<tr>
    <th> com.reply.controller_FrontController.java </th>
    <td> 실행당시에 클래스 생성 
        <br> <a href="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/pr11_________FrontController2________/FrontController.md">참고</a>
    </td>
<tr>
    <th> com.reply.controller_mapping.properies </th>
    <td> key = value 로 이루어져있다.
        <br> key = *.do
        <br> value = 메서드명|패키지명.클래스명 또는
        <br> value = jsp파일 위치 >> view/bbs_write.jsp
    </td>
</table>

## 각 파일별 예시

### - com.reply.action_Action.java

```
public interface Action {

	// 반환 타입은 ActionForward 클래스
	// 멤버 변수 >>> isRedirect, path
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws  IOException;
}
```

### - com.reply.action_ActionForward.java

```
public class ActionForward {

	private boolean isRedirect;
	private String path;


	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

}
```

### - com.reply.controller_mapping.properies

1. 생성
<div>
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/11_frontcontroller2/createFile01.png" width ="30%">
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/11_frontcontroller2/createFile02.png" width ="30%">
    <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/11_frontcontroller2/createFile03.png" width ="30%">
</div>

- controller 패키지에 파일 생성

2. 한글 인코딩 필요
<div>
     <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/11_frontcontroller2/changeEnc02.png" width ="40%">
     <img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/5_web/05_jsp_databaseConnect/img/11_frontcontroller2/changeEnc03.png" width ="40%">
</div>

- mapping.properies 파일 오른쪽 클릭
- Properties 클릭
- Resource Note >> Other UTF-8 로 변경

```
# key = value
# *.do = 메서드명|패키지명.클래스명

# BBS 게시판 전체 데이터 가져오기
bbs_list.do = execute|com.reply.action.BbsListAction

# BBS 게시판 view page(글쓰기 폼페이지) 다음 데이터에 입력
bbs_write.do = view/bbs_write.jsp
bbs_write_ok.do = execute|com.reply.action.BbsWriteOkAction
```
