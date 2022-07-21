## day8_객체배열

1. 클래스 만들기
2. 객체 배열
    1. 객체 배열 생성(메모리 할당)

            클래스명[] 참조변수(참조자료명) = new 클래스명[배열크기]
            ex) Drink[] drinks = new Drink[sc.nextInt()];
    
    2. 배열에 데이터 입력 (예시코드 참고)
        1. 방법 1
            - 객체를 생성하고 데이터를 입력한 후 -> 객체배열에 객체를 할당
        2. 방법 2
            - for문을 통해 객체 배열에 객체생성 및 데이터 입력 동시 진행

    3. 데이터 출력


### 음료 자판기 만들기

- 클래스 코드

        public class Drink {

            // 멤버변수
                String name;		//음료 이름
                int price;			//음료 가격

            // 기본생성자
                public Drink() {}

            // 인자생성자
                public Drink(String n, int p) {
                    name = n;		//n값을 name에 할당
                    price = p;		//p값을 price에 할당
                }

            // 멤버메서드
                void drinkInfo() {
                    System.out.println(name + " : "+ price + "원");
                }        
        }

- 객체 배열 생성코드

            import java.util.Scanner;

            public class Ex08_Drink {

                public static void main(String[] args) {

                    Scanner sc = new Scanner(System.in);
                    System.out.print("자판기 음료 갯수를 입력하세요 . : ");

                    // 1. 객체 배열 만들기

                    // 1-1 객체 배열 생성 (메모리 공간 확보)
                        // 앞에 기본자료형(int, double..)이 아닌 참조자료형,객체가 들어간다
                        // 클래스명[] 참조자료명 

                        Drink[] drinks = new Drink[sc.nextInt()];


                    // 1-2 ~ 3 합쳐서 진행 (간소화)
                        for(int i=0; i<drinks.length; i++) {
                            System.out.println("음료의 이름과 가격을 입력하세요...");
                            System.out.println("::::::::::::::::::::::::::::");
                            drinks[i] = new Drink(sc.next(),sc.nextInt());
                        }

                    // 1-2 객체 생성
                    //	Drink drink1 = new Drink("콜라",2000);
                    //	Drink drink2 = new Drink("사이다",2000);
                    //	Drink drink3 = new Drink("환타",2000);
                    //	Drink drink4 = new Drink("캔커피",1000);
                    //	Drink drink5 = new Drink("탄산수",1500);
                    //	Drink drink6 = new Drink("레몬에이드",1700);

                    // 1-3 객체배열에 생성한 객체를 할당
                    //	drinks[0] = drink1;
                    //	drinks[1] = drink2;
                    //	drinks[2] = drink3;
                    //	drinks[3] = drink4;
                    //	drinks[4] = drink5;
                    //	drinks[5] = drink6;

                    // 1-4 출력
                        System.out.println();
                        System.out.println("drinks[0] 주소값 >>> " + drinks[0]);
                        System.out.println("drinks[1] 주소값 >>> " + drinks[1]);
                        System.out.println("drinks[2] 주소값 >>> " + drinks[2]);
                        System.out.println("drinks[3] 주소값 >>> " + drinks[3]);
                        System.out.println("drinks[4] 주소값 >>> " + drinks[4]);
                        System.out.println("drinks[5] 주소값 >>> " + drinks[5]);
                        System.out.println();

                     //음료정보                    
                        System.out.println("drinks[0]의 음료명 >>> " + drinks[0].name);
                        System.out.println("drinks[0]의 가격 >>> " + drinks[0].price);
                        System.out.println();

                        System.out.println("***    음료 정보    ***");
                        for(int i=0; i<drinks.length; i++) {
                            drinks[i].drinkInfo();
                        }
                        System.out.println();

                    // 계산하기
                        System.out.println("돈을 넣어주세요 : ");
                        int coin = sc.nextInt();

                    // 입력받은 돈으로 구매할 수 있는 물품을 출력
                        // 입력받은 coin(돈)과 객체 배열에 저장된 drink 클래스의 멤버변수인 price와 비교하여 coin 보다 가격이 같거나 작은 음료를 선택.

                        System.out.print("구매할 수 있는 음료는 >>> ");
                        for(int i=0; i<drinks.length; i++) {
                            if(coin >= drinks[i].price) { //입력받은 돈이 음료 가격보다 크거나 동일할 경우
                                System.out.print(drinks[i].name + "\t");
                            }
                        }


                    // scanner 종료
                        sc.close();
                }

            }


- 결과

            자판기 음료 갯수를 입력하세요 . : 6
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            콜라
            2000
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            환타
            2000
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            캔커피
            1000
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            탄산수
            1500
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            레몬에이드
            1700
            음료의 이름과 가격을 입력하세요...
            ::::::::::::::::::::::::::::
            사이다
            2000

            drinks[0] 주소값 >>> Class.Drink@7e0babb1
            drinks[1] 주소값 >>> Class.Drink@6debcae2
            drinks[2] 주소값 >>> Class.Drink@5ba23b66
            drinks[3] 주소값 >>> Class.Drink@2ff4f00f
            drinks[4] 주소값 >>> Class.Drink@c818063
            drinks[5] 주소값 >>> Class.Drink@3f0ee7cb

            drinks[0]의 음료명 >>> 콜라
            drinks[0]의 가격 >>> 2000

            ***    음료 정보    ***
            콜라 : 2000원
            사이다 : 2000원
            환타 : 2000원
            캔커피 : 1000원
            탄산수 : 1500원
            레몬에이드 : 1700원

            돈을 넣어주세요 : 
            1500
            구매할 수 있는 음료는 >>> 캔커피	탄산수	
