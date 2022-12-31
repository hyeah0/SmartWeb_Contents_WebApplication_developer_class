-- coffee_beans 상품 테이블 데이터 추가
insert into coffee_beans values(4,'케냐 기티투 AB',15000,100,250,'새콤한산미','상큼한 자두의 맛과 블랙커런트의 달콤한 향, 그리고 깔끔함이 인상적인 커피에요.','케냐 기티투 AB','https://d2wosiipoa41qn.cloudfront.net/W1NS7G6FhsUR…ges/20221130/249a4fa439584bce9927b039eb0f92ca.png');
insert into coffee_beans values(5,'디카페인 우에우에테낭고 마운틴워터 과테말라',15000,100,200,'가벼운산미','노트: 레드와인, 건대추, 건자두','디카페인 우에우에테낭고 마운틴워터 과테말라','https://d2wosiipoa41qn.cloudfront.net/ZNEklbMB3A_i…ges/20221125/d4368859fce9474aa8c37f498ff80a8f.png');
insert into coffee_beans values(6,'코르디예라 데 푸에고 무산소발효 코스타리카',16000,100,200,'새콤한산미','노트: 시나몬, 라즈베리, 건자두, 브라운슈가, 크리미','코르디예라 데 푸에고 무산소발효 코스타리카','https://d2wosiipoa41qn.cloudfront.net/DEGpx9ygfHVY…ges/20221125/480582d652774680b68513eb88d741a8.png');
insert into coffee_beans values(7,'하와이 코나 엑스트라 팬시',55000,100,200,'가벼운산미','3대 커피 아로마 : 꽃과 과일이 뒤섞인 복잡하고 향긋한 아로마','하와이 코나 엑스트라 팬시','https://d2wosiipoa41qn.cloudfront.net/NcS1kn7fkM3n…ges/20221125/b915ed27ebd149bbb73f43aa1baf4f1a.png');
insert into coffee_beans values(8,'자메이카 블루마운틴',52500,100,200,'산미가없어요','3대 커피 아로마 : 구운 견과류, 구운 빵, 볶은 커피, 초콜릿의 진한 향 ','자메이카 블루마운틴','https://d2wosiipoa41qn.cloudfront.net/Vj6TDT67_zJL…ges/20221125/fb0d3a49962d47a7809aefd08171712d.png');
insert into coffee_beans values(9,'과테말라 SHB 안티구아/루시아',10500,100,200,'산미가없어요','아로마 : 스모키한 향(루시아는 스모키함은 부족하나 에프터가 더 깨끗해요) ','과테말라 SHB 안티구아/루시아','https://d2wosiipoa41qn.cloudfront.net/ZXfQ92ooozks…ges/20221125/921cc439f17a49559518c25508fcedfe.png');
insert into coffee_beans values(10,'콜롬비아 우일라 리브레 셀렉션 디카페인',15000,100,200,'약한산미','호박, 감초같은 달달함에 건무화과같은 낮은 톤의 산미가 좋은 밸런스를 이루는 커피입니다 :)','콜롬비아 우일라 리브레 셀렉션 디카페인','https://d2wosiipoa41qn.cloudfront.net/dbgwbWiSLqKz…ges/20221123/53763f969cd2401ba2927be3b7987e06.png');

insert into coffee_beans values(11,'에티오피아 시다마 파피초 마이크로 내추럴',18000,100,100,'꽃향기_과일','실키한 마우스필과 슈가케인의 단맛, 망고와 고급스러운 장미의 향미가 느껴지는 커피입니다.','https://d2wosiipoa41qn.cloudfront.net/T-5N7QBo0NddHkMBCyep9gkV5rM=/650x650/s3.ap-northeast-2.amazonaws.com/koke-uploads/images/20221212/c16a1da48d474035a6af0a357387c086.png');

commit;

-- coffee_cart 장바구니 테이블 데이터 추가
insert into coffee_cart values(1,4,15000,1,100,0,1);
insert into coffee_cart values(2,6,16000,3,200,1,1);
insert into coffee_cart values(3,7,55000,2,300,0,1);
insert into coffee_cart values(4,5,15000,4,400,1,2);
insert into coffee_cart values(5,9,10500,1,100,0,1);
insert into coffee_cart values(6,8,52500,1,100,0,2);
insert into coffee_cart values(7,7,55000,3,100,0,3);
insert into coffee_cart values(8,4,15000,4,100,1,2);
insert into coffee_cart values(9,6,16000,1,100,1,3);
insert into coffee_cart values(10,10,15000,2,100,1,1);
commit;

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

