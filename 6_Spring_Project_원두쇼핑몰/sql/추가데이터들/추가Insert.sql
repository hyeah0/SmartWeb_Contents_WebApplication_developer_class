-- coffee_order 주문 내역 테이블 데이터 추가
insert into coffee_order values('O202209281511301',1,2,27800,to_date('20220928031130','yyyyMMddhhmiss'),4,'라까프 에스프레소 블렌드',13900,'견과류_쌉쌀',100,0,1,0,2);
insert into coffee_order values('O202209281511301',2,3,57000,to_date('20220928031130','yyyyMMddhhmiss'),6,'DEEP, DEEPLY 과테말라 엘 모리또',19000,'상큼_과일',100,0,1,0,2);
insert into coffee_order values('O202209281711301',3,1,38000,to_date('20220928051130','yyyyMMddhhmiss'),7,'LIGHT,LIGHTER 케냐 기차타이니',19000,'은은한_화사한',200,1,1,0,2);
insert into coffee_order values('O202210281830282',1,4,31200,to_date('20221028063028','yyyyMMddhhmiss'),10,'고독',7800,'고소_부드러운',100,1,2,0,2);
insert into coffee_order values('O202210301410283',1,2,38000,to_date('20221030021028','yyyyMMddhhmiss'),7,'LIGHT,LIGHTER 케냐 기차타이니',19000,'은은한_화사한',100,0,3,0,2);
insert into coffee_order values('O202211301410283',2,4,106800,to_date('20221130021028','yyyyMMddhhmiss'),9,'밀밭',8900,'달콤_모카',300,1,3,0,2);
insert into coffee_order values('O202211302150501',1,1,7800,to_date('20221130095050','yyyyMMddhhmiss'),10,'고독',7800,'고소_부드러운',100,1,3,0,3);
insert into coffee_order values('O202212011110012',1,2,27800,to_date('20221201111001','yyyyMMddhhmiss'),4,'라까프 에스프레소 블렌드',13900,'견과류_쌉쌀',100,1,3,0,3);
insert into coffee_order values('O202212020950021',1,1,27800,to_date('20221202095002','yyyyMMddhhmiss'),5,'라까프 핀 블렌드',13900,'고소_밸런스',200,1,1,1000,2);
insert into coffee_order values('O202212020950021',2,2,27800,to_date('20221202095002','yyyyMMddhhmiss'),4,'라까프 에스프레소 블렌드',13900,'견과류_쌉쌀',100,1,1,0,2);
insert into coffee_order values('O202212062150022',1,2,38000,to_date('20221206095002','yyyyMMddhhmiss'),8,'LIGHT,LIGHTER 에티오피아 보타바 워시드',19000,'상큼_깔끔함',100,0,2,5000,1);
insert into coffee_order values('O202212060250301',1,3,26700,to_date('20221206025030','yyyyMMddhhmiss'),9,'밀밭',8900,'달콤_모카',100,0,1);

commit;
-- 커피 찜
insert into member_star values(0,1,1,2);
insert into member_star values(0,1,1,7);
insert into member_star values(0,1,1,10);
insert into member_star values(0,1,1,9);
insert into member_star values(0,1,2,2);
insert into member_star values(0,1,2,7);
insert into member_star values(0,1,2,10);
insert into member_star values(0,1,2,9);

-- 후기
insert into coffee_write values(0,'ddd',sysdate,'','test3',3);
commit;

