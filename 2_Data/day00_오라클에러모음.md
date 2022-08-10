## 에러표
| 에러코드  | 에러 메세지                | 설명                                           |
| --------- | -------------------------- | ---------------------------------------------- |
| ORA-01400 | cannot insert NULL into    | null 값이 들어갈 수 없는 곳에 null 값이 들어감 |
| ORA-00913 | too many values            | 컬럼에 비해 너무 많은 값이 들어감              |
| ORA-00001 | unique constraint          | 중복값 등록                                    |
| ORA-02291 | integrity constraint       | 참조키가 없음                                  |
| ORA-12899 | value too large for column | 들어갈수있는 특정값 외 다른값이 들어감         |
| ORA-02438 | Column check constraint cannot reference other columns | 제약조건의 컬럼명과 실제 컬럼명이 상이할경우| 


## ORA-02438 케이스
발생사유 : 테이블 생성시 check 제약조건 컬럼 컬럼명 사이하게 작성
as-is : studentType varchar2(3) CONSTRAINT type_ck check(type in('학부생','대학원생'))
to-be : studentType varchar2(3) CONSTRAINT studentType_ck check(studentType in('학부생','대학원생'))
