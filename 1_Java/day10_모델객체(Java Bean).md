## day10_모델객체(Java Bean)

### ★★★ 자바 빈(Java Bean) ★★★
- DB에 접근하여 테이블의 특정 컬럼(속성)에 값을 가져오거나 저장 할 때 사용하는 클래스

> Java Bean == DTO(Data Transfer Object) == VO(Value Object) == 모델객체

- 구성 요소
  1. 멤버변수 - DB 컬럼명 : 접근지정자(private)
  2. setter() : 지정자 메서드
  3. getter() : 획득자 메서드

### - 자바빈 예시

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
            
            // 멤버메서드
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