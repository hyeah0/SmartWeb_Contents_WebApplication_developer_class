# Object class

        - java.lang.Object

## - Object 클래스란?
1. java의 모든 클래스의 조상클래스이다.
    - java의 가장 최상위 조상클래스
2. 사용자가 정의한 클래스에 자동으로 상속이 된다. (extends Object가 생략)
    - 단, extends 키워드를 사용하지 않은 클래스에만 상속이 된다.
	  - 이미 object 클래스를 자동으로 상속받았기 때문에 단일상속으로 이미 상속받은 클래스에는 사용 불가

## Object 메서드
- 형식) 

        클래스이름 참조변수 = new 생성자명();
        참조변수.메서드명();

        Ex01 ex01 = new Ex01();
        ex01.toString()

- toString() 
    - 객체 자신의 정보를 문자열로 반환하는 메서드
    - 인스턴스에 대한 정보를 문자열로 제공할 목적으로 사용이 된다.
    - 따로 오버라이딩을 하지 않는다면 주소값 반환

- getClass()
    - 객체 자신의 클래스 정보를 담고 있는 Class 인스턴스를 반환하는 메서드

- hashCode()
    - 객체 자신의 해쉬코드를 반환하는 메서드
    - ※ 해시코드란? 
    - System.identityHashCode() 다른점

- equals() 
	- 객체 자신과 또 다른 객체가 같은 객체인지 알려주는 메서드
    - 값비교

- clone() 
    - 객체 자신의 복사본을 만드는 메서드
     
### - Object 메서드 예시
- 코드

        public class Ex01 { //public class Ex01 extends Object

            public static void main(String[] args) {
                
                Ex01 ex01 = new Ex01();
                System.out.println("ex01.toString() >>> "+ ex01.toString());
                System.out.println("ex01.getClass() >>> "+ ex01.getClass());
                System.out.println("ex01.hashCode() >>> "+ ex01.hashCode()); // 상수값	
            }
        }

- 결과

        ex01.toString() >>> object.Ex01@7d6f77cc
        ex01.getClass() >>> class object.Ex01
        ex01.hashCode() >>> 2104457164

## - toString 메서드
### - toString() 메서드 재정의(오버라이딩)
- Object 클래스에서 상속을 받은 메서드를 유용한 정보가 반환이 되도록 재정의
- 해당 클래스의 멤버변수가 정보를 가지고 있을때, 해당정보가 올바른 값이 담겼는지 확인 하고 싶은 경우에 toString() 메서드를 재정의 하여 값을 확인할 수 있다.
- 값 확인시 방법 2가지
    1. toString() 메서드 오버라이딩
        1. source 탭 -> generate toString() 클릭
        2. 직접 작성
    2. 메서드 작성

### - toString() 메서드 재정의 예시

- 재정의 클래스 코드

        public class Student {
            
            // 멤버변수
            String name;
            int hakbun;
            String major;
            String tel;
            String addr;
            
            // 기본생성자
            public Student() {	}
            
            // 인자생성자
            public Student(String name, int hakbun, String major, String tel, String addr) {
                this.name = name;
                this.hakbun = hakbun;
                this.major = major;
                this.tel = tel;
                this.addr = addr;
            }

            // 멤버메서드
            // 입력정보 확인 (학생정보출력)
            // 1. source 탭에서 코드작성
            // source -> generate toString()
            @Override
            public String toString() {
                return "Student [name=" + name + ", hakbun=" + hakbun + ", major=" + major + ", tel=" + tel + ", addr=" + addr
                        + "]";
            }
            
            // 2. toString() 오버라이딩
            // @Override
            // public String toString() {
            //	return "학생 이름  >>> " + name + "\n"
            // 		 + "학생 학번  >>> " + hakbun + "\n"
            //		 + "학생 학과  >>> " + major + "\n"
            //		 + "학생 연락처 >>> " + tel + "\n"
            //		 + "학생 주소  >>> " + addr ;
            // }
            
            // 3. 메서드 통해 확인 
            // void getStudentInfo() {
            //	System.out.println("학생 이름  >>> " + name);
            //	System.out.println("학생 학번  >>> " + hakbun);
            //	System.out.println("학생 학과  >>> " + major);
            //	System.out.println("학생 연락처 >>> " + tel);
            //	System.out.println("학생 주소  >>> " + addr);
            // }
        }

- 출력코드

        import java.util.Scanner;

        public class Ex02_Student {

            public static void main(String[] args) {

                Scanner sc = new Scanner(System.in);
                
                System.out.println("학생의 이름, 학번, 학과, 연락처, 주소를 입력하세요.");
                Student student = new Student(sc.next(),sc.nextInt(),sc.next(),sc.next(),sc.next());

                // student.getStudentInfo(); 
                System.out.println(student.toString()); //Object 클래스에 있는 toString() 메서드를 오버라이딩(메서드 재정의)하여 사용
            
                sc.close();
            }
        }

- 결과

        Student [name=홍길동, hakbun=1234, major=수학과, tel=010-1234-5678, addr=경기도]