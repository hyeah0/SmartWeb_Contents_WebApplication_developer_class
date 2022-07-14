### 1. 문제
> 직급에 따라 실행문을 달리 하세요

### 2. 코드

#### 1. switch case 이용 예시

        import java.util.Scanner;

        public class Ex17 {

            public static void main(String[] args) {
                Scanner sc = new Scanner(System.in);
                System.out.print("직급(사장/전무/부장/차장/과장/대리/사원) 중 하나의 직급을 선택하세요 >>> ");
                String position = sc.next();
                
                switch(position) {
                
                    case "사장" : 
                        System.out.println("직급이 사장 입니다. 월급은 1,000만원 입니다.");
                        break;
                    case "전무" : 
                        System.out.println("직급이 전무 입니다. 월급은 900만원 입니다.");
                        break;
                    case "부장" : 
                        System.out.println("직급이 부장 입니다. 월급은 800만원 입니다.");
                        break;
                    case "차장" : 
                        System.out.println("직급이 차장 입니다. 월급은 600만원 입니다.");
                        break;
                    case "과장" : 
                        System.out.println("직급이 과장 입니다. 월급은 500만원 입니다.");
                        break;
                    case "대리" : 
                        System.out.println("직급이 대리 입니다. 월급은 300만원 입니다.");
                        break;
                    case "사원" : 
                        System.out.println("직급이 사원 입니다. 월급은 200만원 입니다.");
                        break;
                    default :
                        System.out.println("해당 회사의 직원이 아닙니다.");
                        break;
                }
                sc.close();
            }

        }

#### 2. 다중 if else를 사용해서 확인(equals)

        import java.util.Scanner;

        public class Ex17 {

            public static void main(String[] args) {
                Scanner sc = new Scanner(System.in);
                System.out.print("직급(사장/전무/부장/차장/과장/대리/사원) 중 하나의 직급을 선택하세요 >>> ");
                String position = sc.next();
                
               //다중 if else를 사용해서 확인시
                if(position.equals("사장")) {
                    System.out.println("직급이 사장 입니다. 월급은 1,000만원 입니다.");
                }else if(position.equals("전무")) {
                    System.out.println("직급이 전무 입니다. 월급은 900만원 입니다.");
                }else if(position.equals("부장")) {
                    System.out.println("직급이 부장 입니다. 월급은 800만원 입니다.");
                }else if(position.equals("차장")) {
                    System.out.println("직급이 차장 입니다. 월급은 600만원 입니다.");
                }else if(position.equals("과장")) {
                    System.out.println("직급이 과장 입니다. 월급은 500만원 입니다.");
                }else if(position.equals("대리")) {
                    System.out.println("직급이 대리 입니다. 월급은 300만원 입니다.");
                }else if(position.equals("사원")) {
                    System.out.println("직급이 사원 입니다. 월급은 200만원 입니다.");
                }else {
                    System.out.println("직급이 없습니다");
                }
                
                sc.close();
            }

        }