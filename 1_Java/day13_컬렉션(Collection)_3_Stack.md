## day13_컬렉션(Collection)_Stack

### - Stack

        - java.lang.Object
            - java.util.AbstractCollection<E>
                - java.util.AbstractList<E>
                    - java.util.Vector<E>
                        - java.util.Stack<E>

- 후입선출(LIFO : Last In First Out) 구조이다.

### - Stack 메서드
1. push() 
    - stack에 저장시키는 메서드

2. peek() 
    - stack에 저장된 데이터를 가져오는 메서드

3. pop()  
    - stack에 저장된 데이터를 가져오는 메서드 

- isEmpty() 
    - 비어있는지 확인 boolean타입 
    
#### - Stack 메서드 예시
- 코드

        public class Ex06_Stack {

            public static void main(String[] args) {

                Stack<String> stack = new Stack<String>();
                
                // 1. push() : stack에 저장시키는 메서드
                stack.push("오렌지");
                stack.push("토마토");
                stack.push("청포도");
                stack.push("바나나");
                stack.push("귤");
                
                // 2. peek() : stack에 저장된 데이터를 가져오는 메서드
                //			  - stack의 가장 맨위(마지막, 가장 늦게 입력된) 데이터 가져오는 메서드
                // 			  - 가져온 후 데이터를 stack에서 제거하지 않는다.
                System.out.println("stack peek() >>> " + stack.peek());
                
                // 3. pop()  : stack에 저장된 데이터를 가져오는 메서드 
                //		      - stack의 가장 맨위(마지막, 가장 늦게 입력된) 데이터 가져오는 메서드
                // 		      - 가져온 후 데이터를 stack에서 제거한다.
                // isEmpty() : 비어있는지 확인 boolean타입 
                //            - 비어있으면 true
                // 			  - !isEmpty() 비어있지 않으면 true
                while(!stack.isEmpty()) {
                    System.out.println("과일 >>> " + stack.pop());
                }
            }
        }

- 결과

        stack peek() >>> 귤
        과일 >>> 귤
        과일 >>> 바나나
        과일 >>> 청포도
        과일 >>> 토마토
        과일 >>> 오렌지