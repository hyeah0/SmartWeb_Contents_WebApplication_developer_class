## day13_컬렉션(Collection)_Map_hashMap

### - hashMap

        - java.lang.Object
            - java.util.AbstractMap<K,​V>
                - java.util.HashMap<K,​V>
 
- 형식) 

        Map 인터페이스의 자식클래스를 이용하여 객체 생성
        Map<key, value> 참조변수명 = new HashMap<key, value>();

        Map<String, Integer> map = new HashMap<String, Integer>();

### - hashMap 예시
- 코드

        import java.util.HashMap;
        import java.util.Map;
        import java.util.Scanner;

        public class Ex09_Map {

            public static void main(String[] args) {
                
                // Map 인터페이스의 자식클래스를 이용하여 객체 생성
                // Map<key, value> 참조변수명 = new HashMap<key, value>();
                Map<String, Integer> map = new HashMap<String, Integer>();
                
                // 1. put() - map에 데이터를 저장하는 메서드
                map.put("원조김밥", 3000);
                map.put("야채김밥", 3500);
                map.put("참치김밥", 4000);
                map.put("멸치김밥", 4500);
                map.put("계란김밥", 4500);
                
                // 2. get(key) - map에 저장된 데이터를 가져오는 메서드
                // 			   - get(key) 메서드를 호출하면 키에 해당하는 value 값을 반환해 주는 메서드
                System.out.println("멸치김밥 가격 >>> " + map.get("멸치김밥") + "\n");
                
                // 3. keySet() : map에 저장된 전체 데이터를 출력하는 메서드(set타입으로 반환 결과값 순서대로 반환되지 않는다)
                for(String s : map.keySet()) {
                    System.out.println(s+ " 가격 >>> " + map.get(s));
                }
                
                Scanner sc = new Scanner(System.in);
                System.out.println("어떤 김밥으로 주문하시겠습니까? : ");
                String orderMenu = sc.next();
                
                //참조변수.containsKey(값) - 인자로 넘어온 키가 map에 있는지 여부를 확인하는 메서드(반환형 : boolean)
                // 						- 가로값이 포함되어있으면 true, 없을 경우 false 
                if(map.containsKey(orderMenu)) {
                    System.out.println(orderMenu + " 가격  >>> " +  map.get(orderMenu));
                }else {
                    System.out.println("해당 김밥은 없습니다.");
                }   
                sc.close();
            }
        }


- 결과

        멸치김밥 가격 >>> 4500

        원조김밥 가격 >>> 3000
        참치김밥 가격 >>> 4000
        멸치김밥 가격 >>> 4500
        야채김밥 가격 >>> 3500
        계란김밥 가격 >>> 4500
        어떤 김밥으로 주문하시겠습니까? : 
        멸치김밥
        멸치김밥 가격  >>> 4500