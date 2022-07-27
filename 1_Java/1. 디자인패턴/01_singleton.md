# singleton 패턴

- 일반

        public class Company {
            // 기본생성자
            Company(){}
        }

- 싱글톤패턴 적용

        public class Company_singleton {

            // 멤버변수
            private static Company_singleton instance = null;
            
            // 기본생성자(싱글톤으로 사용시) _ 외부에서는 객체생성안됨
            private Company_singleton(){}

            //인자생성자
            
            
            // 멤버메서드
            // private Company(){} 생성자 접근하기 위해
            public static Company_singleton getInstance() {
                if(instance == null) {
                    instance = new Company_singleton();
                }
                return instance;
            }
            
        }

- 출력 

        public class Ex01_Company {

            public static void main(String[] args) {

                // singleton 주소값이 같다.
                // static 메서드 사용 (클래스이름.메서드이름)
                Company_singleton com1 = Company_singleton.getInstance();
                Company_singleton com2 = Company_singleton.getInstance();
                Company_singleton com3 = Company_singleton.getInstance();
                
                System.out.println("com1  >>> " + com1);
                System.out.println("com2  >>> " + com2);
                System.out.println("com3  >>> " + com3);
                    
                // 새로운 객체 생성
                Company com5 = new Company();
                Company com6 = new Company();
                Company com7 = new Company();
                Company com8 = new Company();
                Company com9 = new Company();
                Company com10 = new Company();
                
                System.out.println("com5  >>> " + com5);
                System.out.println("com6  >>> " + com6);
                System.out.println("com7  >>> " + com7);
                System.out.println("com8  >>> " + com8);
                System.out.println("com9  >>> " + com9);
                System.out.println("com10 >>> " + com10);    
            }

        }

- 결과

        com1  >>> singleton.Company_singleton@3fb4f649
        com2  >>> singleton.Company_singleton@3fb4f649
        com3  >>> singleton.Company_singleton@3fb4f649
        com5  >>> singleton.Company@5aaa6d82
        com6  >>> singleton.Company@73a28541
        com7  >>> singleton.Company@6f75e721
        com8  >>> singleton.Company@69222c14
        com9  >>> singleton.Company@606d8acf
        com10 >>> singleton.Company@782830e