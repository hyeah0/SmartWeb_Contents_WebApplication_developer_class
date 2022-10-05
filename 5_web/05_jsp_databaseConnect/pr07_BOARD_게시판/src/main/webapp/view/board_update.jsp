<%@page import="com.cp.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% BoardDTO dto = (BoardDTO) request.getAttribute("dto"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
                <div class="content_table content_table_d">
                    <form method="post" action="<%=request.getContextPath() %>/update.do?no=<%=dto.getBoard_no() %>">
                       <%--  <input type="hidden" name="board_no" value="<%=dto.getBoard_no() %>"> --%>
                        <table>
                            <thead>
                                <tr class="content_table_state" > 
                                    <td>:::::::::::: 수 정 중 ::::::::::::</td>
                                </tr>
                                <tr>
                                    <th class="content_table_title" >
                                    	<input type="text" name="title" value="<%=dto.getBoard_title() %> "> 
                                    </th>
                                </tr>
                                <tr>
                                    <th class="content_table_writer" name="writer"><%=dto.getBoard_wirter() %></th>
                                </tr>
                                <tr>
                                    <th class="content_table_update" name="update"><%=dto.getBoard_date() %></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="content_table_text">
                                        <textarea rows="15" cols="100" name="cont">
                                        	<%=dto.getBoard_cont() %>
                                        </textarea>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="content_table_footer">
                                        <button type="submit">수정</button>
                                        <button type="reset">다시작성</button>
                                        <button onclick="location.href='select.do'">목록</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <footer>

        </footer>
    </div>
</body>
</html>