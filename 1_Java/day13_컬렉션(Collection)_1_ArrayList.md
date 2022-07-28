## day13_컬렉션(Collection) + ArrayList

- 객체배열 
    
        클래스이름[] 참조변수 = new 클래스이름[배열크기];

    - 불특정다수 배열생성할 수 없다.
    - 배열중 삭제된 인덱스를 찾기에는 어려운 점이 있다.

- 객체배열의 단점을 보완한 컬렉션

 ### - 컬렉션 프레임워크란?
- 컬력센의 사전적 의미 
    - 수집해서 모으다, 저장한다는 의미
- 자바에서 컬렉션은 데이터의 추가, 수정, 삭제, 검색색 등을 효과적으로 제공해 주는 자료구조 관련 클래스
	 - 값을 담을 수 있는 그릇을 의미한다.(컨테이너 개념)
- java.util 패키지에 포함되어있다.
- 인터페이스를 통해서 정형화된 방법으로 다양한 컬렉션 클래스를 이용
- 컬렉션은 제네릭이 들어간다.

### - 컬렉션 프레임워크 
	 1. 컬렉션을 표준화 하여 설계해 놓은 인터페이스
	 2. List 계열, Set 계열, Map 계열

### - List 계열의 컬렉션 프레임워크

- 형식)

  		List<E>lst = new List<E>();
 		lst.add("Mercury");

        ** 다형성
        ArrayList <Object> list = new ArrayList <Object>();
        
        또는 

        List <Object> list = new ArrayList <Object>();  

** 다형성 참고 [다형성](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day10_%EA%B0%9D%EC%B2%B4_5_4_%EB%8B%A4%ED%98%95%EC%84%B1.md)

#### - List 계열의 컬렉션 프레임워크의 특징 ★★★
- 자료의 순서가 보장(index) : 정렬 기능 제공
- 중복데이터가 허용 
- 인덱스가 다르기 때문 (index0값과 index1값은 같을 수 있다)

- List 인터페이스의 자식클래스로 구현
    - List = 인터페이스
    - ArrayList = 클래스

- ArrayList(O), LinkedList(가끔), Vector(X)
    - ArrayList : 공간을 원하는데로 늘릴수 있다(default 10개씩)
- 특히 DB에 데이터를 레코드 단위로 저장하거나, 저장된 데이터를 가져올 경우 많이 사용

#### - List 계열의 컬렉션 프레임워크 메서드
1. add("값") 
    - 데이터를 추가하는 메서드

2. add(index, 값) 
    - list의 특정 index에 데이터를 추가하는 메서드
    - 해당 index에 추가가 되고 기존 데이터들은 한칸씩 뒤로 밀려난다.
    - ※ add(값) 메서드는 데이터 끝에 추가됨
    - ※ 값은 element라 한다.

3. size() 
    - 데이터의 크기를 정수로 반환해 주는 메서드
    - ※ length()는 길이반환이다.

4. get(index) 
    - list에 저장되어있는 데이터를 출력해주는 메서드

5. clear() 
    - 모든 요소를 제거하는 메서드

6. remove(index) 
    - list 특정 요소(인덱스)를 제거하는 메서드
    - 제거된 다음 index 부터 index 값이 하나씩 당겨진다.	


- 리스트 배열 전체 출력시
    1. 단축 for문 
    2. for문
    3. Iterator
        - 자바의 클렉션 프레임워크에서 저장되어 있는 요소들을 읽어 오는 방법을 표준화해 놓은 객체
		- for문대신 사용 가능
        - 형식)

                List<클래스자료형> 참조변수명 = new ArrayList<클래스자료형>
                Iterator<클래스자료형> 참조변수명 = 배열이름.iterator(); 
            
                List<String> list = new ArrayList<String>
                Iterator<String> it = list.iterator();

        - hasNext() 
            - 읽어올 요소가 있는지 확인하는 메서드로 boolean 타입이다.

		- next() 	 
            - 요소를 가져오는 메서드 ( list의 get메서드와 비슷하다. )

		- ※ while문으로 배열 출력시 인덱스값을 알기가 어렵다.

#### - ArrayList 예시

- ArrayList

        - java.lang.Object
            - java.util.AbstractCollection<E>
                - java.util.AbstractList<E>
                    - java.util.ArrayList<E>


- 예시
        public class Ex01_ArrayList {

            public static void main(String[] args) {
                
                /*
                * 제네릭 클래스 생성 
                * <E> elements 요소
                * List<String> list = new ArrayList<String>(20); // 다형성
                *  ㄴ default 로 10개 공간이 생성됨, 공간 변경시에 가로 안에 원하는 공간 크기 입력
                */

                // List 계열 컬렉션 생성
                List<String> list = new ArrayList<String>();
                
                // 1. add("값") : 데이터를 추가하는 메서드
                list.add("오렌지");
                list.add("사과");
                list.add("청포도");
                list.add("유자");
                list.add("토마토");
                list.add("유자"); 	//중복데이터
                
                // 2. size() : 데이터의 크기를 정수로 반환해 주는 메서드
                // 			   ※ length()는 길이반환이다.
                System.out.println("list의 크기 >>> " + list.size() + "\n");
                
                // 3. get(index) : list에 저장되어있는 데이터를 출력해주는 메서드
                System.out.println("list[2] 데이터 >>> " + list.get(2)+ "\n");
                
                // 4. clear() : 모든 요소를 제거하는 메서드
                list.clear();
                System.out.println("clear() 이후 list.size() >>> " + list.size());
                
                list.add("오렌지");
                list.add("사과");
                list.add("청포도");
                list.add("유자");
                list.add("토마토");
                list.add("유자"); 	
                System.out.println("add()   이후 list.size() >>> " + list.size()+ "\n");
            
                // 5. remove(index) 
                //	  - list 특정 요소(인덱스)를 제거하는 메서드
                // 	  - 제거된 다음 index 부터 index 값이 하나씩 당겨진다.	 
                list.remove(2);
                for(int i=0; i<list.size(); i++) {
                    System.out.println("list[" + i +"] >>> " + list.get(i));
                }
                System.out.println("list.size() >>> " + list.size()+ "\n");
                
                // 6. add(index, 값) : list의 특정 index에 데이터를 추가하는 메서드
                //		- 해당 index에 추가가 되고 기존 데이터들은 한칸씩 뒤로 밀려난다.
                // 		※ add(값) 메서드는 데이터 끝에 추가됨
                // 		※ 값은 element라 한다.
                list.add(2,"파인애플");
                list.add("자몽");
                for(int i=0; i<list.size(); i++) {
                    System.out.println("list[" + i +"] >>> " + list.get(i));
                }
                System.out.println("list.size() >>> " + list.size()+ "\n");
                
                
                // list에 있는 모든 요소를 화면에 출력
                // 1. 단축 for문
                for(String s: list) {
                    System.out.println("list 배열 >>> " + s);
                }
                System.out.println();
                
                // 2. for문 (크기 length가 아니라 size/ 배열 출력시 get() 메서드 사용)
                for(int i=0; i<list.size(); i++) {
                    System.out.println("list[" + i +"] >>> " + list.get(i));
                }
                System.out.println();
                
                // 3. Iterator : 자바의 클렉션 프레임워크에서 저장되어 있는 요소들을 읽어 오는 방법을 표준화해 놓은 객체
                //			  - for문대신 사용 가능
                Iterator<String> it = list.iterator();
                
                // hasNext() : 읽어올 요소가 있는지 확인하는 메서드로 boolean 타입이다.
                // next() 	 : 요소를 가져오는 메서드 ( list의 get메서드와 비슷하다. )
                // ※ while문으로 배열 출력시 인덱스값을 알기가 어렵다.
                while(it.hasNext()) {
                    System.out.println(it.next());
                }
            }
        }     

- 결과

        list의 크기 >>> 6

        list[2] 데이터 >>> 청포도

        clear() 이후 list.size() >>> 0
        add()   이후 list.size() >>> 6

        list[0] >>> 오렌지
        list[1] >>> 사과
        list[2] >>> 유자
        list[3] >>> 토마토
        list[4] >>> 유자
        list.size() >>> 5

        list[0] >>> 오렌지
        list[1] >>> 사과
        list[2] >>> 파인애플
        list[3] >>> 유자
        list[4] >>> 토마토
        list[5] >>> 유자
        list[6] >>> 자몽
        list.size() >>> 7

        list 배열 >>> 오렌지
        list 배열 >>> 사과
        list 배열 >>> 파인애플
        list 배열 >>> 유자
        list 배열 >>> 토마토
        list 배열 >>> 유자
        list 배열 >>> 자몽

        list[0] >>> 오렌지
        list[1] >>> 사과
        list[2] >>> 파인애플
        list[3] >>> 유자
        list[4] >>> 토마토
        list[5] >>> 유자
        list[6] >>> 자몽

        오렌지
        사과
        파인애플
        유자
        토마토
        유자
        자몽