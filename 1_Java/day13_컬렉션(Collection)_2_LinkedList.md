## day13_컬렉션(Collection)_LikedList

        - java.lang.Object
            - java.util.AbstractCollection<E>
                - java.util.AbstractList<E>
                    - java.util.AbstractSequentialList<E>
                        - java.util.LinkedList<E>

### LikedList란?

- List 인터페이스의 자식 클래스 중 한 종류

- 형식) 
    
        List<Integer> list2 = new LinkedList<Integer>();

<!-- - 1 ,2, 3, 4, 5
    1은 2에 주소값이 할당
    2는 3에 주소값이 할당 -->

- 특징
	 1. 인접 참조를 링크해서 체인처럼 관리한다.
	 2. 특정인덱스에서 객체를 제거하거나 추가하게 되면 앞 뒤의 링크만 연결하면 된다.
	 3. 빈번히 객체의 삽입과 삭제가 일어나는 곳에서는 ArrayList 보다 더 큰 성능을 발휘한다.
		- 단, 중간에 삽입과 삭제가 일어나는 경우에만 해당

### LikedList 예시
- 코드 

        public class Ex03_LikedList {

            public static void main(String[] args) {

                List<Integer> list1 = new ArrayList<Integer>();
                List<Integer> list2 = new LinkedList<Integer>();
                long start, end;
                
                // 1. ArrayList로 중간에 데이터 입력시 걸리는 시간
                // System.nanoTime() : 10억분에 1초를 계산 메서드 , 반환타입 long타입
                start = System.nanoTime();  
                for(int i=1; i<10000; i++) {
                    list1.add(0, i);
                }
                end = System.nanoTime(); 
                System.out.println(" ArrayList로 데이터 입력시 걸린 시간 >>> " + (end-start) + "ns");
                
                
                // 2. LinkedList로 중간에 데이터 입력시 걸리는 시간
                start = System.nanoTime();  
                for(int i=1; i<10000; i++) {
                    list2.add(0, i);
                }
                end = System.nanoTime(); 
                System.out.println("LinkedList로 데이터 입력시 걸린 시간 >>> " + (end-start) + "ns");
            }

        }

- 결과

        ArrayList로 데이터 입력시 걸린 시간 >>> 7007500ns
        LinkedList로 데이터 입력시 걸린 시간 >>> 3234700ns

#### - System.nanoTime()
- System.nanoTime() 
    - 10억분에 1초를 계산 메서드 , 반환타입 long타입