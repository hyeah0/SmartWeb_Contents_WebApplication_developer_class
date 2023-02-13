## 테이블

<table>
    <tr>
        <td>show tables;</td>
        <td>테이블 목록 보기</td>
    </tr>
     <tr>
        <td>DESC [테이블명];</td>
        <td>테이블 확인</td>
    </tr>
    <tr>
        <td>DROP TABLE [테이블명];</td>
        <td>테이블 삭제</td>
    </tr>
    <tr>
        <td>CREATE TABLE [DB명.테이블명]( 변수명 자료형 제약조건, 변수명 자료형 제약조건..)</td>
        <td>테이블 생성</td>
    </tr>
    <tr>
        <td>INSERT INTO [DB명.테이블명] ([컬럼1], email) VALUES("[컬럼1데이터]", "orange@gmail.com"); </td>
        <td>테이블 행 데이터추가</td>
    </tr>
    <tr>
        <td>DELETE FROM [DB명.테이블명] WHERE [컬럼] = 0;
            <br>DELETE FROM [DB명.테이블명]
        </td>
        <td>특정 컬럼이 지정한 값인 행 삭제 또는
            <br>전체 데이터 삭제  
        </td>
    </tr>
    <tr>
        <td>UPDATE [DB명.테이블명] SET [컬럼명]='[값]' WHERE [조건컬럼]='[조건값]'; </td>
        <td>데이터 수정</td>
    </tr>
    <tr>
        <td>-- 필수사항 ⬇️ ----------
        <br>SELECT [컬럼명] 또는 [*] 
        <br>FROM [테이블명]
        <br>-- 선택사항 ⬇️ ----------
        <br>WHERE [조건] 
        <br>GROUPBY [그룹지을 컬럼]
        <br>ORDERBY [정렬할 컬럼 ASC] 또는 [정렬할 컬럼 DESC] 
        <br>LIMIT [row갯수] 또는 [a], [b]
        <br>OFFSET [몇번째 row]
        </td>
        <td>데이터 조회</td>
    </tr>
</table>

- [oracle sql 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/2_Data/extra02_sql%20%EC%A0%95%EB%A6%AC.md)

<small>- [터미널 접속방법 참고](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/00_%ED%84%B0%EB%AF%B8%EB%84%90%EC%97%90%EC%84%9Cmysql%EC%A0%91%EC%86%8D%EB%B0%A9%EB%B2%95.md)</small>

## 테이블 생성하기 + 생성한 테이블 보기

<img src="https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/0_MacSet/mysql/image/terminal/createTable.png" width="100%">

```
CREATE TABLE [DB명.테이블명]( 변수명 자료형 제약조건, 변수명 자료형 제약조건..)
CREATE TABLE [DB명.테이블명](
    변수명 자료형 제약 조건,
)

CREATE TABLE nodejs.users(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT UNSIGNED NOT NULL,
    married TINYINT NOT NULL,
    comment TEXT NULL,
    created_at DATETIME NOT NULL DEFAULT now(),
    PRIMARY KEY(id),
    UNIQUE INDEX name_UNIQUE(name ASC))
    COMMENT = '사용자 정보'
    ENGINE = 'InnoDB';
```

### - 자료형 종류

<table>
    <tr><th>자료형</th><th>상세</th></tr>
    <tr><td>INT</td><td>정수</td></tr>
    <tr><td>TINYINT</td><td>1 또는 0만 저장시 boolean의 역할</td></tr>
    <tr><td>FLOAT, DOUBLE</td><td>실수</td></tr>
    <tr><td>CAHR(고정자릿수)</td><td>텍스트<br>(0~자릿수까지의 공간을 다 사용하지 않았다면 빈곳은 스페이스(' ')으로 채워진다.</td></tr>
    <tr><td>VARCHAR(자릿수)</td><td>텍스트<br>(0~자릿수까지의 공간을 다 사용하지 않아도 된다.)</td></tr>
    <tr><td>TEXT</td><td>긴글을 저장할때</td></tr>
    <tr><td>DATETIME</td><td>날짜, 시간정보</td></tr>
    <tr><td>DATE</td><td>날짜정보</td></tr>
    <tr><td>TIME</td><td>시간정보</td></tr>
</table>

### - 제약조건(옵션) 종류

<table>
    <tr><th>제약조건</th><th>상세</th></tr>
    <tr><td>NOT NULL</td><td>빈칸 허용 불가</td></tr>
    <tr><td>NULL</td><td>빈칸 허용</td></tr>
    <tr><td>UNSIGNED</td><td>음수는 무시, INT자료형에 적용</td></tr>
    <tr><td>ZEROFILL</td><td>INT(자리수) : int 자료형에 자릿수가 포함되어있다면 비어있는 자리에 0을 넣는다.<br> INT(4) 입력데이터 1 >>> 0001 </td></tr>
    <tr><td>AUTO_INCREMENT</td><td>자동 1씩 증가</td></tr>
    <tr><td>DEFAULT 디폴트값</td><td>해당 컬럼에 값이 없을경우 디폴트값을 넣는다.</td></tr>
</table>

### - PRIMARY KEY(기본키), UNIQUE INDEX

<table>
    <tr><td>PRIMARY KEY('컬럼명')</td><td>기본키로 설정할 컬럼명, 기본키는 자동으로 UNIQUE INDEX 이다.</td></tr>
    <tr><td>UNIQUE INDEX 인덱스이름(컬럼명 오름차순ASC,내림차순DESC)</td><td>중복값을 허용하지 않는 인덱스</td></tr>
</table>

### - COMMENT, ENGINE

<table>
    <tr><td>COMMENT</td><td>테이블 보충 설명<br>필수는 아니다.</td></tr>
    <tr><td>ENGINE='MyISAM' 또는 'InnoDB'</td><td>mySQl InnoDB 사용</td></tr>
</table>

## 테이블 조회

```
SELECT [컬럼명] 또는 [*]
       >>> * : 전체 컬럼 조회
FROM [테이블명]
WHERE [조건]
      예시) 컬럼명 = '1' 해당 컬럼명의 데이터값이 1인것만 추출
GROUPBY [그룹지을 컬럼]
         >>> 그룹지을 컬럼이 아닌 컬럼은 그룹함수를 써야한다.
         예시) MAX(컬럼명), MIN(컬럼명)... etc
ORDERBY [정렬할 컬럼 ASC] 또는 [정렬할 컬럼 DESC]
         >>> asc 오름차순
         >>> desc 내림차순
LIMIT [row갯수] 또는 [a], [b]
       >>> 1 일경우 row가 1개만 출력
       >>> 1, 3 일경우 1번째 row부터 3개의 row 출력
OFFSET [몇번째 row]
        >>> 몇번째 row부터 출력할 지. (1번째 row면 0)
```
