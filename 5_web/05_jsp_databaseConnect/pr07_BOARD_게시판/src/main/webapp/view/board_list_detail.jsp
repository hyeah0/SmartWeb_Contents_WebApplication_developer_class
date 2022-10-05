<%@page import="com.cp.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BoardDTO dto = (BoardDTO) request.getAttribute("dto"); %>
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
                <div class="content_table content_table_d">
                    <table>
                        <thead>
                            <tr>
                                <th class="content_table_title" name="title">
                                	<%=dto.getBoard_title() %>
                                </th>
                            </tr>
                            <tr>
                                <th class="content_table_writer" name="writer">
                                	<%=dto.getBoard_wirter() %>
                                </th>
                            </tr>
                            <tr>
                            	<th class="content_table_update" name="update">
                           		 <% if(dto.getBoard_date().equals(dto.getBoard_update())){ %>
	                                <%=dto.getBoard_date() %>
	                             <% } else{ %>
	                             	<%=dto.getBoard_update() %>
	                             <% } %>
	                            </th>   
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="content_table_text" name="cont">
                                	<%=dto.getBoard_cont() %>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="content_table_footer">
                                    <button onclick="location.href='select_list.do?selectUp=1&no=<%=dto.getBoard_no() %>'">수정</button>
                                    <button onclick="location.href='delete.do?no=<%=dto.getBoard_no()%>'">삭제</button>
                                    <button onclick="location.href='select.do'">목록</button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="content_comment">
                   
                    </div>
                </div>
            </div>
        </div>
        <footer>

        </footer>
    </div>
</body>
</html>