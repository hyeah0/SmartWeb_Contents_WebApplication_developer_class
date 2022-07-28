## ArrayList, Generic, DTO
### 1. 문제1
#### 1. 문제
> 키보드로 회원수만큼 회원정보를 입력받아 ArrayList에 저장하고 화면에 출력

#### 2. 코드
- DTO

        public class MemberDTO {

            /*
            *  만약 DB상의 테이블의 이름이 member(회원 테이블) 일때, 
            *  member 테이블의 구성(컬럼)이 id, pwd, name, age, phone, address 구성이 되어있다고 가정한다.
            */
            
            // 멤버변수
            private String id;		//회원 아이디
            private String pwd;		//회원 비밀번호
            private String name;	//회원 이름
            private int age;		//회원 나이
            private String phone;	//회원 연락처
            private String addr; 	//회원 주소
            
            // 기본생성자
            public MemberDTO(){}
            
            // 인자생성자
            public MemberDTO(String id, String pwd, String name, int age, String phone, String addr){
                this.id = id;
                this.pwd = pwd;
                this.name = name;
                this.age = age;
                this.phone = phone;
                this.addr = addr;
            }
            
            
            //getter setter 메서드
            public String getId() {
                return id;
            }
            public void setId(String id) {
                this.id = id;
            }
            public String getPwd() {
                return pwd;
            }
            public void setPwd(String pwd) {
                this.pwd = pwd;
            }
            public String getName() {
                return name;
            }
            public void setName(String name) {
                this.name = name;
            }
            public int getAge() {
                return age;
            }
            public void setAge(int age) {
                this.age = age;
            }
            public String getPhone() {
                return phone;
            }
            public void setPhone(String phone) {
                this.phone = phone;
            }
            public String getAddr() {
                return addr;
            }
            public void setAddr(String addr) {
                this.addr = addr;
            }
            
        }

    - 참고 : [DTO](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day10_%EB%AA%A8%EB%8D%B8%EA%B0%9D%EC%B2%B4(Java%20Bean).md)

- 출력 클래스

        import java.util.ArrayList;
        import java.util.List;
        import java.util.Scanner;

        import d13_2_model.MemberDTO;

        // ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★


        public class Ex04 {

            public static void main(String[] args) {

                List<MemberDTO> list = new ArrayList<MemberDTO>();
                
                Scanner sc = new Scanner(System.in);
                System.out.print("회원수를 입력하세요 >>> ");
                int memCnt = sc.nextInt();
                
                // 1. 키보드로 회원 수만큼 리스트 회원 정보를 입력받아 ArrayList에 저장
                for(int i=0; i<memCnt; i++) {
                    System.out.println((i+1)+"번째 회원의 아이디, 비밀번호, 이름, 나이, 연락처, 주소를 입력해주세요.");
                    // MemberDTO 클래스 객체 생성후 인자생성자
                    MemberDTO dto1 = new MemberDTO(sc.next(),sc.next(),sc.next(),sc.nextInt(),sc.next(),sc.next());
                    // list배열 인덱스마다 dto 주소값 할당
                    list.add(dto1);
                    System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
                }
                
                // 실제로 list에 dto 주소값이 들어가있는지 확인
                for(int i=0; i<list.size(); i++) {
                    System.out.println("list [" + i + "] >>> " + list.get(i));
                    System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
                }
                
                // 2. list에 들어있는 데이터 출력
                for(int i=0; i<list.size(); i++) {
                    // ★★★★★ 
                    // 1. 주소값을 MemberDTO dto 에 저장
                    MemberDTO dto2 = list.get(i);
                    System.out.println(dto2.getId()+ "\t" + dto2.getPwd() + "\t" + dto2.getName() + "\t" 
                                    + dto2.getAge() + "\t" + dto2.getPhone() + "\t" + dto2.getAddr());
                    System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
                }   
                sc.close();
            }
        }


#### 3. 결과

        회원수를 입력하세요 >>> 2
        1번째 회원의 아이디, 비밀번호, 이름, 나이, 연락처, 주소를 입력해주세요.
        kim
        aaaa
        김아무개
        20
        010-2222-4444
        경기도
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        2번째 회원의 아이디, 비밀번호, 이름, 나이, 연락처, 주소를 입력해주세요.
        kang
        bbb
        강아무개
        25
        010-3333-6666
        서울
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        list [0] >>> d13_2_model.MemberDTO@7e0babb1
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        list [1] >>> d13_2_model.MemberDTO@6debcae2
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        kim	aaaa	김아무개	20	010-2222-4444	경기도
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        kang	bbb	강아무개	25	010-3333-6666	서울
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### 1. 문제2

#### 1. 문제
- 키보드로 학생수를 입력받고,
- 입력받은 학생수 만큼의 학생정보를 키보드로 입력받아 ArrayList에 저장후 화면에 출력해 보세요.
- ( 조건 - 학생의 정보는 학번, 이름, 학과, 연락처, 주소 )

#### 2. 코드
- DTO 

        public class StudentDTO {
            // 멤버변수
            private int hakbun;
            private String name;
            private String major;
            private String tel;
            private String addr;
            
            // 기본생성자
            public StudentDTO(){};
            
            // 인자생성자
            public StudentDTO(int hakbun, String name, String major, String tel, String addr){
                this.hakbun = hakbun;
                this.name = name;
                this.major = major;
                this.tel = tel;
                this.addr = addr;
            };
            
            // 멤버 메서드
            // getter, setter
            public int getHakbun() {
                return hakbun;
            }
            
            public void setHakbun(int hakbun) {
                this.hakbun = hakbun;
            }
            
            public String getName() {
                return name;
            }
            public void setName(String name) {
                this.name = name;
            }
            public String getMajor() {
                return major;
            }
            public void setMajor(String major) {
                this.major = major;
            }
            public String getTel() {
                return tel;
            }
            public void setTel(String tel) {
                this.tel = tel;
            }
            public String getAddr() {
                return addr;
            }
            public void setAddr(String addr) {
                this.addr = addr;
            } 
            
            @Override
            public String toString() {
                return "StudentDTO \n"+
                    "hakbun \t name \t major \t tel \t addr \n" 
                    + hakbun + "\t" + name + "\t "+ major + "\t" + tel + "\t" + addr;
            }
        }

- 출력클래스

        public class Ex05 {

            public static void main(String[] args) {
                
                // 1. 학생 전체 수 입력받기
                Scanner sc= new Scanner(System.in);
                System.out.print("전체 학생수를 입력해 주세요. >>> ");
                int sTot = sc.nextInt();
                
                // 2. 배열객체를 만들어 키보드로 배열에 데이터 입력하기
                List<StudentDTO> sList = new ArrayList<StudentDTO>(); 
                for(int i=0; i<sTot; i++) {
                    System.out.println((i+1)+"번째 학생의 학번, 이름, 학과, 연락처, 주소를 입력해주세요.");
                    
                    // 2-1 StudentDTO 클래스 객체를 생성해 인자생성자를 통해 데이터 입력
                    StudentDTO sDTO = new StudentDTO(sc.nextInt(), sc.next(), sc.next(), sc.next(), sc.next());
                    
                    // 2-2 sList 배열에 인덱스마다 sDTO 주소값 할당
                    sList.add(sDTO);
                    
                    // 2-1~2 합칠 수 있다.
                    // sList.add(new StudentDTO(sc.nextInt(), sc.next(), sc.next(), sc.next(), sc.next());
                    
                    System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");	
                }
                
                // 3. sList에 들어있는 데이터 출력
                for(int i=0; i<sList.size(); i++) {
                    // 3-1 sList에 있는 주소값을 StudentDTO에 저장
                    StudentDTO sDTO2 = sList.get(i);
                    
                    // 3-2 sList 값 출력
                    System.out.println(sDTO2.toString());
                    System.out.println("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
                }   
                sc.close();
            }
        }

#### 3. 결과

        전체 학생수를 입력해 주세요. >>> 1
        1번째 학생의 학번, 이름, 학과, 연락처, 주소를 입력해주세요.
        1234
        김아무개
        수학과
        010-1234-5678
        경기도
        ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        StudentDTO 
        hakbun 	 name 	 major 	 tel 	 addr 
        1234	김아무개	 수학과	010-1234-5678	경기도
        ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::