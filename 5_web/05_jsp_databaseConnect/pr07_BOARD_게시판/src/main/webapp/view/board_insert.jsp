<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
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
                <div class="content_table content_table_form">
                    <form method="post" action="">
                        
                        <table>
                            <thead>
                                <tr class="content_table_state" > 
                                    <td colspan="4">:::::::::::: 작 성 중 ::::::::::::</td>
                                </tr>
                                <tr>
                                    <th class="content_form_th"> 제목 </th>
                                    <td colspan="3"> <input type="text" name="title" > </td>
                                </tr>
                                <tr>
                                    <th class="content_form_th"> 작성자 </th>
                                    <td> <input type="text" name="writer" > </td> 
                                    <th class="content_form_th"> 비밀번호 </th>
                                    <td> <input type="text" name="writer" > </td>      
                                </tr>
                                <tr>
                                    <th class="content_form_th"> 작성일 </th>
                                    <td colspan="4"> </td> 
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="content_table_text" colspan="4">
                                        <textarea rows="15" cols="100" name="cont"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td class="content_table_footer" colspan="4">
                                        <button type="submit">작성완료</button>
                                        <button type="reset">다시작성</button>
                                        <button onclick="">목록</button>
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