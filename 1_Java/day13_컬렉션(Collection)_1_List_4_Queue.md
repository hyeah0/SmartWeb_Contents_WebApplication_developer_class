## day13_컬렉션(Collection)_List_Queue

형식)

        Queue<String> qu = new LinkedList<String>();

### - Queue 자료구조
- Queue 는 인터페이스여서 자식클래스로 객체를 생성하여 사용한다.
- 대표적인 자식 클래스는 LinkedList 이다.
    - [LinkedList]()
- 가로 원통형
- 특징 : 선입선출(FIFO : First In First Out)  구조 

| 반환형 | 메서드 | 설명|
|---- | ---- | ---- | 
| boolean | add(E e) | Inserts the specified element into this queue if it is possible to do so immediately without violating capacity restrictions, returning true upon success and throwing an IllegalStateException if no space is currently available.
| E	| element() | Retrieves, but does not remove, the head of this queue.
| boolean	| offer(E e) | Inserts the specified element into this queue if it is possible to do so immediately without violating capacity restrictions.
| E	 | peek() | Retrieves, but does not remove, the head of this queue, or returns null if this queue is empty.
| E	| poll() | Retrieves and removes the head of this queue, or returns null if this queue is empty.
| E	| remove() | Retrieves and removes the head of this queue.

### - Queue 예시
- 코드

        public class Ex07_Queue {

            public static void main(String[] args) {

                Queue<String> qu = new LinkedList<String>();
                
                // 1. offer() : queue에 저장하는 메서드
                qu.offer("101동");
                qu.offer("102동");
                qu.offer("103동");
                qu.offer("104동");
                qu.offer("105동");
                
                // 2. peek() : queue에 저장된 데이터를 가져오는 메서드
                //			  - queue의 가장 맨처음에 입력된 데이터 가져오는 메서드
                // 			  - 가져온 후 데이터를 queue에서 제거하지 않는다.
                System.out.println("처음 호출 번호 >>> " + qu.peek());
                
                
                // 3. poll() : - queue에 데이터를 가져오는 메서드
                // 			   - queue에서 데이터를 가져온 후 데이터 제거한다.
                while(!qu.isEmpty()) {
                    System.out.println("qu >>> " + qu.poll());
                }
            }
        }

- 결과

        처음 호출 번호 >>> 101동
        qu >>> 101동
        qu >>> 102동
        qu >>> 103동
        qu >>> 104동
        qu >>> 105동