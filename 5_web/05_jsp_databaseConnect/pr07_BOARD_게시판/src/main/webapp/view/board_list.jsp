<%@page import="com.cp.board.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div id="wrap">
        <header>
            <ul>
                <li><a href="#">서울소식</a></li>
                <li><a href="#">시민참여</a></li>
                <li><a href="#">분야별정보</a></li>
            </ul>
            <div id="search">
                <input type="text">
                <button></button>
            </div>
        </header>
        
        <div id="content">
            <div id="content_left">
                <ul>시민의견
                    <li>
                        <a href="#">
                            자유게시판
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            칭찬
                        </a>
                    </li>
                </ul>
            </div>
            <div id="content_rigth">
                <div class="content_head">
                    <h3>자유게시판</h3>
                </div>
                <form class="content_search">
                    <div class="content_search_term">
                        <input type="date" name="startDate">
                        <span> - </span>
                        <input type="date" name="endDate" >
                    </div>
                    <div class="content_search_text">
                        <select name="search_filed">
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                        </select>
                        <input name="search_keyword">
                        <button type="submit">검색</button>
                    </div>
                </form>
                <div class="content_table">
                    <table>
                    	<tr>
                            <th>순번</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    	<% if(boardList.size() != 0) {
                    		for(int i=0; i<boardList.size(); i++){
                    			BoardDTO dto = boardList.get(i);
                    	%>
	                    		<tr>
		                            <td><%=dto.getBoard_no() %></td>
		                            <td>
		                                <a href="<%=request.getContextPath() %>/select_list.do?selectUp=0&no=<%=dto.getBoard_no() %>">
		                                    <%=dto.getBoard_title() %>
		                                </a> 
		                            </td>
		                            <td><%=dto.getBoard_wirter() %></td>
		                            <td><%=dto.getBoard_date() %></td>
		                            <td><%=dto.getBoard_hit() %></td>
	                        	</tr>
                    	
                    	<%  	}
                    		}else {%>
                    			<tr>
                    				<td colspan="5">게시글이 없습니다.</td>
                    			</tr>
                    	<%  }%>
                    	<tr>
                            <td colspan="5" align="right">
                                <button onclick="location.href='view/board_insert.jsp'">글쓰기</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="content_page">

                </div>
            </div>
        </div>
        <footer>

        </footer>
    </div>
</body>
</html>