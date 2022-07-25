## day10_패키지(Packages)

### - 패키지(package)란?
- 서로 연관성이 있는 클래스와 인터페이스들의 묶음을 말한다.
- 패키지는 물리적으로 폴더 개념과 유사하다.
- 패키지는 서브 패키지를 가질 수 있으며, "."으로 구분한다.
- import 키워드 : 현재 패키지의 클래스에서 다른 패키지에 있는 다른 클래스를 사용하고 싶은 경우 import 해야한다.
- 단, 동일한 패키지에 있는 다른 클래를 사용할 경우에는 생략 가능하다.

- 형식

		형식 ) import 패키지명.서브패키지명.클래스명
		예시 ) import java.util.Scanner;

- import 방법 
    1. 에러문설명 에서 import
    2. 단축키 : ctrl + shift + o 
    3. 단축키 : ctrl + enter

### 1. 패키지 예시
- 객체생성 참고 : [모델객체](); 

        import java.util.Scanner;
        import model.MemberDTO;

        public class Ex01 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                
                //model 패키지에 있는 MemberDTO 클래스를 사용하는 방법
                
                MemberDTO dto = new MemberDTO();
                
                // 회원의 정보를 저장
                dto.setId("aaa");
                dto.setPwd("***");
                dto.setName("김사과");
                dto.setAge(15);
                dto.setPhone("010-1234-5678");
                dto.setAddr("서울시 강서구");
                
                //저장된 회원의 정보를 출력
                System.out.println("회원 아이디 >>> " + dto.getId());
                System.out.println("회원 비밀번호 >>> " + dto.getPwd());
                System.out.println("회원 이름 >>> " + dto.getName());
                System.out.println("회원 나이 >>> " + dto.getAge());
                System.out.println("회원 연락처 >>> " + dto.getPhone());
                System.out.println("회원 주소 >>> " + dto.getAddr());
                
                sc.close();
            }

        }

- 출력

        회원 아이디 >>> aaa
        회원 비밀번호 >>> ***
        회원 이름 >>> 김사과
        회원 나이 >>> 15
        회원 연락처 >>> 010-1234-5678
        회원 주소 >>> 서울시 강서구

### 2. 패키지 예시(객체배열)

- 회원 수를 키보드로 입력받고, 회원 수 만큼 회원의 정보를 객체 배열에 저장하여 화면에 회원의 정보를 출력

- 코드 

        public class Ex02 {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                
                // 1. 회원 수를 키보드로 입력 받아 객체 배열의 크기 설정
                System.out.print("총 회원 수를 입력해 주세요. >>> ");
                MemberDTO[] dto = new MemberDTO[sc.nextInt()];
                
                // 2. 객체배열에 데이터 입력
                for(int i=0; i<dto.length; i++) {
                    System.out.println("회원 아이디, 패스워드, 이름, 나이, 핸드폰번호, 주소를 입력해주세요.");
                    dto[i] = new MemberDTO(sc.next(),sc.next(),sc.next(),sc.nextInt(),sc.next(),sc.next());
                }
                
                System.out.println("<<   회원 정보 입니다  >>");
                System.out.println("아이디 \t 비밀번호 \t 이름 \t 나이 \t 연락처 \t 주소 ");
                for(int i=0; i<dto.length; i++) {
                    System.out.println(dto[i].getId() + "\t" + dto[i].getPwd()+ "\t" + dto[i].getName() + "\t" + dto[i].getAge() + "\t" + dto[i].getAddr());
                    // System.out.println("회원 아이디 >>> " + dto[i].getId());
                    // System.out.println("회원 비밀번호 >>> " + dto[i].getPwd());
                    // System.out.println("회원 이름 >>> " + dto[i].getName());
                    // System.out.println("회원 나이 >>> " + dto[i].getAge());
                    // System.out.println("회원 연락처 >>> " + dto[i].getPhone());
                    // System.out.println("회원 주소 >>> " + dto[i].getAddr());
                    System.out.println(":::::::::::::::::::::::::::::::::::::::::::");
                }
                sc.close();
            }

        }
