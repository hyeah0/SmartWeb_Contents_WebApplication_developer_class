<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">

	.img_no{		
	margin-left:50px;
	border: 1px solid #FFF;
	border-radius: 100%;
	height: 100px;
	width: 100PX;
	 }
	 
	.header__content {
	    background-color: #D9CEC1;
	    -webkit-text-size-adjust: 100%;
	    font: 100% sans-serif;
	    --ikea-font: 'Noto IKEA', 'Noto Sans KR', 'Noto Sans', 'Roboto', 'Open Sans', system-ui, sans-serif !important;
	    font-family: var(--ikea-font);
	    font-size: .875rem;
	    line-height: 1.571;
	    visibility: visible;
	    text-align: left;
	    pointer-events: all;
	    color: rgb(var(--colour-text-and-icon-5, 255, 255, 255));
	    box-sizing: inherit;
	    outline: none;
	    margin: 0;
	    display: flex;
	    align-items: center;
	    justify-content: space-around;
	    padding: 100px 100px 50px 0.1px;
	} 

       .top{
           width: 100%;
           height: 4em;
           background-color: blue;
       }

       .top_text{
           color: white;
           font-size: 3em;
       }

       .botton{
           width: 100%;
           height: 5em;
           background-color: blue;
       }

       .botton_text{
           color: white;
           font-size: 3em;
       }

       .empty{
           width: 80%;
           margin-left: 10%;
           margin-right: 10%;
       }

       .select_box1,
       .select_box2{
           display: inline;
       }

       .box1,
       .box2{
           width: 9em;
           height: 2em;
           border: 1px solid black;
       }

	.con1{
      <%-- border: 1px solid lightgray; --%>
      border-radius: 20px;
      width: 100%;
      position: relative;
      height: 570px;	
	}
	
	.con1:after{
      display: block;
      content: "";
      padding-bottom: 100%;				
	}

	.list_box{
	   /*  border: 1px solid green; */
      	width: 100%;
      	display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 28px;
      @media screen and (max-width: 718px) {
        gap: 3px;
      }	      	
	}
	
	.cart_btn{
		width: 37px;
		height: 37px;
		border-radius: 25px;
		background-color: #734338;		
		border: none;
	}
	
	.heart_btn{
		width: 37px;
		height: 37px;
		border-radius: 25px;
		background-color: #000;
		margin-left: 2%;
		padding: 0;
		border: none;	
	}
	
	.con_info{
		margin-bottom: 10%;	
	}

	.info_out{
		text-align: left;
		height: 225px;
		padding-left: 30%;
	}	
	
	.con_new{
		color: #A66B56;
		font-weight: bold;
		margin-bottom: 5px;
		text-shadow: 1px 1px 2px black;
	}
	
	.con_name{
		font-weight: bold;
		font-size: 1.2em;
	}
	
	.con_taste{
		margin-bottom: 10px;
	}
	
	.con_price{
		font-size: 20px;
	}
	
	.formaa{
		float: left;
	}
	

</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />

    <div style="height: 15em;">

    </div>

    <div class="empty">
        <div class="title_box">
            <h3>전체 목록</h3>
        </div>

        <div style="height: 4em;">

        </div>

       <div class="select_box1">
            <select class="box1" name="select_box">
                <option id="op_name" value="정렬">정렬</option>
                <option value="찜많은순">찜많은순</option>
                <option value="낮은가격순">낮은가격순</option>
                <option value="높은가격순">높은가격순</option>
            </select>
        </div>

        <div class="select_box2">
            <select class="box2" name="select_box2">
                <option id="op_name2" value="고객평가">고객평가</option>
                <option value="5점">5점</option>
                <option value="4점">4점</option>
                <option value="3점">3점</option>
                <option value="2점">2점</option>
                <option value="1점">1점</option>
            </select>
            <br>
        </div>

        <br>
        <hr style="margin: 0;">
        <br>
        <c:set var="list" value="${List }" />

        <c:if test="${empty list }">
        	<table>
        		<tr>
        			<td>	
        			<h3>평가된 원두가 없습니다.</h3>
        			</td>
        		</tr>
        	</table>
        </c:if>
        <c:if test="${!empty list }">
       
         <c:set var="count" value="${Count }" />
        	<div class="title_box">
        		<a>원두상품 총 개수 : ${count } 개</a>
        	</div>
        
        <div class="list_box">
       
        	<c:forEach items="${list }" var="i"  varStatus="status">

        	<div class="con1">
        		<div class="con_box" align="center">
        		
        		<%-- 그냥 beans_img 쓰고 --%>
        		<c:if test="${i.getBeans_add_image() eq null }">
	        		<c:if test="${member_id eq null }">
		        		<img alt="커피원두1" width="300px" height="300px" src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}&no=0'">         				        			
	        		</c:if>
	        		<c:if test="${member_id ne null }">
		        		<img alt="커피원두1" width="300px" height="300px" src="${i.getBeans_img() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}&no=${member_num }'">            		
	        		</c:if>
        		</c:if>
        		
        		<%-- beans_add_image 쓰기 --%>
        		<c:if test="${i.getBeans_add_image() ne null }">
	        		<c:if test="${member_id eq null }">
		        		<img alt="커피원두1" width="300px" height="300px" src="<%=request.getContextPath() %>/resources/res/img/${i.getBeans_add_image() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}&no=0'">         				        			
	        		</c:if>
	        		<c:if test="${member_id ne null }">
		        		<img alt="커피원두1" width="300px" height="300px" src="<%=request.getContextPath() %>/resources/res/img/${i.getBeans_add_image() }" onclick="location.href='bean_content.do?num=${i.getBeans_num()}&no=${member_num }'">            		
	        		</c:if>        		
        		</c:if>
        		</div>
        		<div class="info_out">
	        		<div class="con_info">
	        			<div class="con_name">
	        				<span><%--여기--%>${i.getBeans_name() }</span>
	        			</div>
	        			<div class="con_taste">
	        				<span><%--여기--%>${i.getBeans_taste() }</span>
	        			</div>
	        			<div class="con_price">
	        				<span><b>￦ <fmt:formatNumber value="${i.getBeans_price() }" /></b></span>
	        			</div>        			
	        		</div>
        			
        			<div>
	        			<%-- 장바구니 버튼 --%>
	       				<button type="button" class="cart_btn" onclick="location.href='bean_cart_insert.do?no=${i.getBeans_num()}'">	
							<svg focusable="false" fill="rgb(255, 255, 255)" width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="pip-svg-icon ">
							 <path fill-rule="evenodd" clip-rule="evenodd" d="M10.4372 4h3.1244l.2922.4801 3.3574 5.517h5.0694l-.3104 1.2425L21.5303 13h-2.0615l.2506-1.0029H4.2808l1.3106 5.2426a1 1 0 0 0 .9702.7574H15v2H6.5616c-1.3766 0-2.5766-.9369-2.9105-2.2724L2.03 11.2397l-.3107-1.2426H6.788l3.357-5.517L10.4372 4zm2.0003 2L14.87 9.9971H9.1291L11.5614 6h.8761zm5.5586 10v-2h2v2h2v2h-2v2h-2v-2h-2v-2h2z"></path>
							</svg>						
						</button>      				
	        			
	        			<%-- 찜 버튼 --%>
	       				<button type="button" class="heart_btn" value="${i.getBeans_num() }" style="background-color: #000;">
							<svg focusable="false" width="24" height="24" viewBox="0 0 24 24" fill="rgb(255, 255, 255)" xmlns="http://www.w3.org/2000/svg" class="pip-svg-icon ">
							 <path fill-rule="evenodd" style="fill:rgb(255, 255, 255);" clip-rule="evenodd" d="M19.205 5.599c.9541.954 1.4145 2.2788 1.4191 3.6137 0 3.0657-2.2028 5.7259-4.1367 7.5015-1.2156 1.1161-2.5544 2.1393-3.9813 2.9729L12 20.001l-.501-.3088c-.9745-.5626-1.8878-1.2273-2.7655-1.9296-1.1393-.9117-2.4592-2.1279-3.5017-3.5531-1.0375-1.4183-1.8594-3.1249-1.8597-4.9957-.0025-1.2512.3936-2.5894 1.419-3.6149 1.8976-1.8975 4.974-1.8975 6.8716 0l.3347.3347.336-.3347c1.8728-1.8722 4.9989-1.8727 6.8716 0z"></path>
							</svg>					
						</button>
       				</div> 
					</div>
					</div><%-- con1 끝 --%>
								
				</c:forEach>
				
        	</div> <%-- list_box 끝 --%>
        	 </c:if>
        </div> <%-- empty 끝 --%>
    <jsp:include page="../layout/footer.jsp" />
    
    
<script type="text/javascript">

 $(function(){

	   // 하트 버튼 클릭시 찜 수정 또는 등록 ajax 
	   $(document).on("click", ".heart_btn", function(){
		   
		  if('<%=session.getAttribute("member_id")%>' != "null"){
			  
			let beans_heart = $('#beans_heart').val(); 
		 	let no ='<%=session.getAttribute("member_num")%>';
		 	
	   		$.ajax({
	   			url : "beans_heart.do",
	   			data : {member_num : no,
	   					beans_num : $(this).val()
	   					},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	   			datatype : "text",
	   			success : function(data){
	   				
					console.log("찜 여부 >> "+data);
					
					if(data == 1){
						alert("찜 목록에 추가했습니다.");
						
						
					}else{
						alert("찜 목록에서 삭제했습니다.");
						
					}
	   			
	   			},
	   			error : function(){
	   				console.log('찜 실패!');
	   			}
	   		});
	   		
		  }else{
				alert('로그인 후 이용해주세요.');  
		  }
		 	
	   });

	
	// select 박스 중 옵션 선택 후 정렬 되도록..
 	$('.box1').change(function() {
 	    var result = $('.box1 option:selected').val();
 	   	var name = document.getElementById("op_name").value;
 	   
 	    if (result == '찜많은순') {
 	    	
 	    	location.href="beans_list_heart.do"
 
 	    } else if(result == '낮은가격순'){
 	    	
 	    	location.href="beans_price_down.do"
 	    	
 	    } else if(result == '높은가격순'){
 	    	
 	    	location.href="beans_price_up.do"
 	    	
 	    } else{
 	    	location.href="bean_list.do"
 	    }
 	    
 	  }); 
	
	$('.box2').change(function(){
		
		var result = $('.box2 option:selected').val();
		var name = document.getElementById("op_name2").value;
		
		if(result == '5점'){
			
			location.href="beans_star_5.do"
			
		}else if(result == '4점'){
			
			location.href="beans_star_4.do"
			
		}else if(result == '3점'){
			
			location.href="beans_star_3.do"
			
		}else if(result == '2점'){
			
			location.href="beans_star_2.do"
			
		}else{
			
			location.href="beans_star_1.do"
			
		}
		
	});
 	

}); 

</script>

</body>
</html>