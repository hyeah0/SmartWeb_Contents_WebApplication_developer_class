## DAOImpl

### 리스트 보기

### 상세 보기

### 조회수 추가

### 게시글 등록

### 게시글 수정

### 게시글 삭제

### 게시글 번호 수정

### 게시글 검색

<table>
    <tr>
        <th>설명</th>
        <th>메서드</th>
        <th>this.template</th>
    </tr>
    <tr>
        <th>리스트 보기</th>
        <td>List&lt;BoardDTO&gt; getBoardList(){ }</td>
        <td>this.template.query(sql, new RowMapper&lt;BoardDTO&gt;() { } );</td>
    </tr>
     <tr>
        <th>상세 보기</th>
        <td>BoardDTO boardCont(int no);</td>
        <td>this.template.queryForObject(sql, new RowMapper&lt;BoardDTO&gt;() { } , )</td>
    </tr>
     <tr>
        <th>조회수 추가</th>
        <td>void readCont(int no);</td>
        <td>this.template.update(sql, new PreparedStatementSetter() { } )</td>
    </tr>
     <tr>
        <th>게시글 등록</th>
        <td>int insertBoard(BoardDTO dto);</td>
        <td>
            게시글 번호 : this.template.queryForInt(sql);
        <br> 게시글 등록 : this.template.update(sql, new PreparedStatementSetter() { } )
        </td>
    </tr>
     <tr>
        <th>게시글 수정</th>
        <td>int updateBoard(BoardDTO dto);</td>
        <td>this.template.update(sql, new PreparedStatementSetter() { } )</td>
    </tr>
     <tr>
        <th>게시글 삭제</th>
        <td>int deleteBoard(int no);</td>
        <td>this.template.update(sql, new PreparedStatementSetter() { } )</td>
    </tr>
     <tr>
        <th>게시글 번호 수정</th>
        <td>void updateSeq(int no);</td>
        <td>this.template.update(sql, new PreparedStatementSetter() { } )</td>
    </tr>
     <tr>
        <th>게시글 검색</th>
        <td>List&lt;BoardDTO&gt; searchBoardList(String field, String keyword);</td>
        <td>this.template.query(sql, new RowMapper&lt;BoardDTO&gt;() { } )</td>
    </tr>

</table>
