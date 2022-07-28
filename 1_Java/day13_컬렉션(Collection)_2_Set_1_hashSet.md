## day13_컬렉션(Collection)_Set_hashSet

### - hashSet

        - java.lang.Object
            - java.util.AbstractCollection<E>
                - java.util.AbstractSet<E>
                    - java.util.HashSet<E>

- 형식)

    - 다형성

            Set<클래스형객체> 참조변수 = new HashSet<클래스형객체>();
            Set<Integer> set = new HashSet<Integer>();

#### - hashSet 예시
- 코드

        public class Ex08_Set {

            public static void main(String[] args) {
                Set<Integer> set = new HashSet<Integer>();
                
                // 1. add(값) : 원소를 추가하는 메서드
                set.add(100);
                set.add(200);
                set.add(300);
                set.add(400);
                set.add(500);
                set.add(300); 	// 중복데이터 발생 (입력시에는 오류 안남)
                
                // 2. size() : 원소의 크기를 알려주는 메서드
                //			 - 중복데이터는 1개만 집계한다.
                System.out.println("Set 컬렉션의 크기 >>> " + set.size());
                Iterator<Integer> iterator = set.iterator();
                while(iterator.hasNext()) {
                    System.out.println("Set 요소 >>> " + iterator.next());
                }	
            }
        }

- 결과

        Set 컬렉션의 크기 >>> 5
        Set 요소 >>> 400
        Set 요소 >>> 100
        Set 요소 >>> 500
        Set 요소 >>> 200
        Set 요소 >>> 300