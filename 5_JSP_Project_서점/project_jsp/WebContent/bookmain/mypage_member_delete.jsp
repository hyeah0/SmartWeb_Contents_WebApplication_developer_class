<%@page import="com.book.model.MemberDTO"%>
<%@page import="com.book.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int mem_num = (Integer)session.getAttribute("userNum");
	MemberDAO memDao = MemberDAO.getInstance();
	MemberDTO memberList = memDao.getMember(mem_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>종로서적 회원 탈퇴</title>
    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="source/img/logo_title.jpeg">
    <script src="https://kit.fontawesome.com/4338ad17fa.js" crossorigin="anonymous"></script> 
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/frame.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageLayout.css">   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypageCss/mypageDelete.css">
</head>
<body>
	
	<jsp:include page="/include/main_top.jsp"/>

	<!-- content : nav, content -->
	<jsp:include page="/include/mypage/mypage_detail_nav.jsp"/>
		
		<section id="section-cont">
            <div class="mypage-cont">
            
            	<!-- 콘텐츠 타입 -->
                <div class="mypage-cont_toptext">
                    <h3>회원탈퇴</h3>
                </div>
                <div class="mypage-cont_nav_effect"></div>
                
                 <!-- 콘텐츠 내용 -->
                 <div class="mypage_contents member-info-div">
					  <div class="mypage-cont_toptext">
                           <h3><b><%=memberList.getMem_name() %></b> 님의 보유 이용 정보</h3>
                      </div>
                      <div class="mypage-cont_deleteArea">
                          <div class="mypage-cont_mem_mile">
                              <table class="coupon_mileage_each">
                                  <tr>
                                      <th>쿠폰</th>
                                      <td>-</td>
                                  </tr>
                                  <tr>
                                      <th>마일리지</th>
                                      <td>
                                      	<c:set var="mem_mileage" value="<%=memberList.getMem_mileage() %>"/>
                                      	<fmt:formatNumber value="${mem_mileage }"/> p
                                      </td>
                                  </tr>
                              </table>
                          </div>
                          <div class="mypage-cont_delete_guide">
                              <h3>회원 탈퇴 시 유의사항</h3>
                              <p> - 회원 탈퇴 시 모든 정보와 <b style="color:red">쿠폰, 마일리지</b>가 자동으로 삭제 처리 됩니다.</p>
                              <div class="mypage-cont_check">
                                  <div>
                                      <input type="checkbox" id="deleteAgree" class="deleteCheck">
                                      <lable for="deleteAgree"> 회원탈퇴 안내 사항을 확인했으며 탈퇴에 동의합니다.</lable>
                                  </div>
                                  <div>
                                      <input type="checkbox" id="deleteBeneAgree" class="deleteCheck">
                                      <lable for="deleteBeneAgree">모든 혜택 자동소멸에 동의합니다.</lable>
                                  </div>
                              </div>
                          </div>
                          <div class="mypage-cont_deleteBtn">
                              <button class="btn" onclick="location.href='<%=request.getContextPath() %>/main.do'">취소</button>
                              <button class="btn deleteOk" onclick="location.href='<%=request.getContextPath() %>/mypage_member_delete_ok.do'">회원 탈퇴</button>
                          </div> 
                      </div>
                  </div>
        	</div>
		</section>
		<!-- section-cont 끝 -->	    	
   	<jsp:include page="/include/mypage/mypage_bottom.jsp"/>
    <jsp:include page="/include/main_bottom.jsp"/>
    
    <script type="text/javascript" src="js/mypageJs/deleteMemberJs.js"></script>
    
</body>
</html>