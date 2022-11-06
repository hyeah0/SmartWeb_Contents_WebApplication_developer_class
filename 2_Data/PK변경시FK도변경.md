--board 테이블에서 board_num 변경시 Board_reply board_num 도 변경
```
CREATE TRIGGER [trigger 이름]
 alter update of [pk 컬럼명] on [pk가 있는 테이블명] for each row
 begin
    update [fk가 있는 테이블명]
       set [fk 컬럼명] = :new.[pk 컬럼명]
     where [fk 컬럼명] = :old.[pk 컬럼명] ;
end;

CREATE TRIGGER UPDATE_BOARD_NUM
AFTER UPDATE of board_num ON board FOR EACH ROW
BEGIN
	UPDATE board_reply
	SET board_num = :new.board_num
	WHERE board_num = :old.board_num; 
END;
/
drop trigger UPDATE_BOARD_NUM;
```
