-- coffee_beans 상품 테이블 데이터 추가
insert into coffee_beans values(4,'케냐 기티투 AB',15000,100,250,'새콤한산미','상큼한 자두의 맛과 블랙커런트의 달콤한 향, 그리고 깔끔함이 인상적인 커피에요.','케냐 기티투 AB','https://d2wosiipoa41qn.cloudfront.net/W1NS7G6FhsUR…ges/20221130/249a4fa439584bce9927b039eb0f92ca.png');
insert into coffee_beans values(5,'디카페인 우에우에테낭고 마운틴워터 과테말라',15000,100,200,'가벼운산미','노트: 레드와인, 건대추, 건자두','디카페인 우에우에테낭고 마운틴워터 과테말라','https://d2wosiipoa41qn.cloudfront.net/ZNEklbMB3A_i…ges/20221125/d4368859fce9474aa8c37f498ff80a8f.png');
insert into coffee_beans values(6,'코르디예라 데 푸에고 무산소발효 코스타리카',16000,100,200,'새콤한산미','노트: 시나몬, 라즈베리, 건자두, 브라운슈가, 크리미','코르디예라 데 푸에고 무산소발효 코스타리카','https://d2wosiipoa41qn.cloudfront.net/DEGpx9ygfHVY…ges/20221125/480582d652774680b68513eb88d741a8.png');
insert into coffee_beans values(7,'하와이 코나 엑스트라 팬시',55000,100,200,'가벼운산미','3대 커피 아로마 : 꽃과 과일이 뒤섞인 복잡하고 향긋한 아로마','하와이 코나 엑스트라 팬시','https://d2wosiipoa41qn.cloudfront.net/NcS1kn7fkM3n…ges/20221125/b915ed27ebd149bbb73f43aa1baf4f1a.png');
insert into coffee_beans values(8,'자메이카 블루마운틴',52500,100,200,'산미가없어요','3대 커피 아로마 : 구운 견과류, 구운 빵, 볶은 커피, 초콜릿의 진한 향 ','자메이카 블루마운틴','https://d2wosiipoa41qn.cloudfront.net/Vj6TDT67_zJL…ges/20221125/fb0d3a49962d47a7809aefd08171712d.png');
insert into coffee_beans values(9,'과테말라 SHB 안티구아/루시아',10500,100,200,'산미가없어요','아로마 : 스모키한 향(루시아는 스모키함은 부족하나 에프터가 더 깨끗해요) ','과테말라 SHB 안티구아/루시아','https://d2wosiipoa41qn.cloudfront.net/ZXfQ92ooozks…ges/20221125/921cc439f17a49559518c25508fcedfe.png');
insert into coffee_beans values(10,'콜롬비아 우일라 리브레 셀렉션 디카페인',15000,100,200,'약한산미','호박, 감초같은 달달함에 건무화과같은 낮은 톤의 산미가 좋은 밸런스를 이루는 커피입니다 :)','콜롬비아 우일라 리브레 셀렉션 디카페인','https://d2wosiipoa41qn.cloudfront.net/dbgwbWiSLqKz…ges/20221123/53763f969cd2401ba2927be3b7987e06.png');

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
insert into coffee_order values('O202211281511301',1,2,15000,to_date('20221128031130','yyyyMMddhhmiss'),4,'케냐 기티투 AB',7500,'새콤한산미',100,0,1);
insert into coffee_order values('O202211281511301',2,3,24000,to_date('20221128031130','yyyyMMddhhmiss'),6,'코르디예라 데 푸에고 무산소발효 코스타리카',8000,'새콤한산미',100,0,1);
insert into coffee_order values('O202211281711301',3,1,55000,to_date('20221128051130','yyyyMMddhhmiss'),7,'하와이 코나 엑스트라 팬시',27500,'가벼운산미',200,1,1);
insert into coffee_order values('O202211281830282',4,4,30000,to_date('20221128063028','yyyyMMddhhmiss'),10,'콜롬비아 우일라 리브레 셀렉션 디카페인',7500,'약한산미',100,1,2);
insert into coffee_order values('O202211301410283',5,2,55000,to_date('20221130021028','yyyyMMddhhmiss'),7,'하와이 코나 엑스트라 팬시',27500,'가벼운산미',100,0,3);
insert into coffee_order values('O202211301410283',6,4,63000,to_date('20221130021028','yyyyMMddhhmiss'),9,'과테말라 SHB 안티구아/루시아',5250,'산미가없어요',300,1,3);
insert into coffee_order values('O202211302150501',7,1,7500,to_date('20221130095050','yyyyMMddhhmiss'),10,'콜롬비아 우일라 리브레 셀렉션 디카페인',7500,'약한산미',100,0,1);
insert into coffee_order values('O202212011110012',8,2,15000,to_date('20221201111001','yyyyMMddhhmiss'),4,'케냐 기티투 AB',7500,'새콤한산미',100,0,2);
insert into coffee_order values('O202212020950021',9,1,14000,to_date('20221202095002','yyyyMMddhhmiss'),5,'디카페인 싱글 오리진',7000,'가벼운산미',200,1,1);
insert into coffee_order values('O202212020950021',10,2,15000,to_date('20221202095002','yyyyMMddhhmiss'),4,'케냐 기티투 AB',7500,'새콤한산미',100,1,1);
insert into coffee_order values('O202212062150022',11,2,52500,to_date('20221206095002','yyyyMMddhhmiss'),8,'자메이카 블루마운틴',26250,'산미가없어요',100,0,2);
insert into coffee_order values('O202212060250301',12,3,15750,to_date('20221206025030','yyyyMMddhhmiss'),9,'과테말라 SHB 안티구아/루시아',5250,'산미가없어요',100,0,1);