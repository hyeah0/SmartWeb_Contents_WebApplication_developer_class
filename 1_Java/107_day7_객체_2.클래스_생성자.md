## day7_객체(class&method)_클래스_생성자
### - 클래스 형식

        [접근제한] class 클래스이름{
                    멤버변수;
                    생성자();
                    멤버메서드();
        }

### - 클래스를 대상으로 객체를 생성하는 과정
- 형식)

        클래스명 참조변수 = new 클래스명();	(X)
        클래스명 참조변수 = new 생성자();	(O)

## - 생성자(Constructor)
### - 생성자란?
1. 클래스를 대상으로 객체를 생성하는 역할을 한다.
2. 클래스 이름과 동일하다.
3. 클래스에 포함되어 있으며, 객체를 생성할때 자동으로 딱 한번만 호출된다.
4. 클래스는 생성자를 통해서 객체로 생성이 된다.

    - 생성자 형식

            1. 기본생성자 : 자동 호출(생략가능)
                [접근제한] 생성자이름(){

                }
            
            2. 인자생성자 : 매개변수를 포함한 생성자
            [접근제한] 생성자이름(매개변수){
                    생성자 호출 시 실행될 문장;
            }

5. 생성자는 메서드 형태를 가지고 있다.
    - 리턴타입(반환형)(x), void(x), 매개변수(o)
6. 모든 클래스는 반드시 한개 이상의 생성자를 가지고 있음
7. 사용자가 생성자를 정의하지 않으면, JVM이 컴파일 시점에서 자동으로 기본 생성자를 만들어준다.

### - 생성자 목적 
- 멤버변수들의 초기화 목적으로 사용된다.

### - 생성자 특징

1. 생성자 이름 == 클래스 이름

2. 메서드와 다르게 반환형이 없다.
3. 클래스는 반드시 한개 이상의 생성자를 가지고 있다.
4. 생성자 오버로딩이 가능함(즉, 여러개의 생성자가 존재할 수 있다.)
5. 생성자가 보이지 않으면 기본 생성자가 숨어있다.
6. 기본 생성자라 함은 매개변수가 없는 생성자를 의미한다.
7. 기본 생성자 외의 다른 생성자를 만들면, 숨어 있던 기본 생성자는 사라진다.
8. 기본 생성자 외의 다른 생성자를 만들면, 무조건 기본생성자를 만들어 줄것
    - 인자생성자를 만들면 기본생성자가 사라짐 따라 기본 생성자를 만들어야함 
    - 만약 기본 생성자를 만들지 않으면, 상속에 문제가 발생


### - 생성자 예시

#### - 클래스 예시

        public class Student {
            
            // 속성 5개 , 기능 1개
            // 멤버변수
            int hakbun;		//학생 학번
            String name;	//학생 이름
            String major;	//학생 학과
            String phone;	//학생 연락처
            String addr; 	//학생 주소
            
            // 멤버메서드
            void getStudentInfo() {
                System.out.println("학생 학번 >>> " + hakbun);
                System.out.println("학생 이름 >>> " + name);
                System.out.println("학생 학과 >>> " + major);
                System.out.println("학생 연락처 >>> " + phone);
                System.out.println("학생 주소 >>> " + addr);
            }
            
            //기본생성자(생략가능)
            public Student(){}
            
            //인자 생성자 : 매개변수를 받는 생성자(생성자 오버로딩)
            public Student(int hak, String nam, String maj, String pho, String add){
                hakbun = hak; // 인자생성자 매개변수 hak을 멤버변수 hakbun에 할당
                name = nam;
                major = maj;
                phone = pho;
                addr = add;
            }
            
        }

#### - 클래스 선언 및 메모리 생성 예시1 (클래스 예시에서 만든 클래스를 사용)

- 코드 

    public class Ex04_Student {

        public static void main(String[] args) {
            Student student = new Student();
            
            student.hakbun = 2022001;
            student.name = "홍길동";
            student.major = "경제학과";
            student.phone = "010-1111-1234";
            student.addr = "서울시 남대문로";
            
            student.getStudentInfo();
            System.out.println();
            
            // 인자생성사로 객체 생성
            Student student1 = new Student(123, "김태리", "영화학과", "010-1111-1111", "서울시");
            student1.getStudentInfo();
            System.out.println();
        
        }

    }

- 결과

        학생 학번 >>> 2022001
        학생 이름 >>> 홍길동
        학생 학과 >>> 경제학과
        학생 연락처 >>> 010-1111-1234
        학생 주소 >>> 서울시 남대문로

        학생 학번 >>> 123
        학생 이름 >>> 김태리
        학생 학과 >>> 영화학과
        학생 연락처 >>> 010-1111-1111
        학생 주소 >>> 서울시
    
#### - 클래스 선언 및 메모리 생성 예시2 (인자생성자에 직접 변수 입력)

- 코드 

        public class Ex05_Student_input {

            public static void main(String[] args) {
                Scanner sc = new Scanner(System.in);
                
                //1. 변수에 입력후 인자 생성자에 변수명 입력
                System.out.print("학생의 학번 입력 : ");
                int hakbun = sc.nextInt();
                System.out.print("학생의 이름 입력 : ");
                String name = sc.next();
                System.out.print("학생의 학과 입력 : ");
                String major = sc.next();
                System.out.print("학생의 연락처 입력 : ");
                String phone = sc.next();
                System.out.print("학생의 주소 입력 : ");
                String addr = sc.next();
                
                Student student = new Student(hakbun, name, major, phone, addr);
                student.getStudentInfo();
                
                //2. 인자생성자에 직접 입력
                System.out.println("학생의 학번, 이름, 학과, 연락처, 주소를 입력하세요");
                Student student1 = new Student(sc.nextInt(),sc.next(),sc.next(),sc.next(),sc.next());
                student1.getStudentInfo();
                
                sc.close();
            }

        }
    
- 결과

        학생의 학번 입력 : 123
        학생의 이름 입력 : aaa
        학생의 학과 입력 : 영어학과
        학생의 연락처 입력 : 010-0000-0000
        학생의 주소 입력 : 경기도
        학생 학번 >>> 123
        학생 이름 >>> aaa
        학생 학과 >>> 영어학과
        학생 연락처 >>> 010-0000-0000
        학생 주소 >>> 경기도
        학생의 학번, 이름, 학과, 연락처, 주소를 입력하세요
        444
        bbb
        수학과
        010-1000-1234
        서울시
        학생 학번 >>> 444
        학생 이름 >>> bbb
        학생 학과 >>> 수학과
        학생 연락처 >>> 010-1000-1234
        학생 주소 >>> 서울시
