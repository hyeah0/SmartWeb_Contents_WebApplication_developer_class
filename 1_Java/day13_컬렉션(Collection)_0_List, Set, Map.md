## day13_컬렉션(Collection)

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

- Collection interface
    - List interface
        - [ArrayList class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_1_ArrayList.md)
        - [stack class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_3_Stack.md)
        - [Queue interface](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_4_Queue.md)
            - [LinkedList class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_2_LinkedList.md)
    - Set interface
        - [hashSet](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_2_Set_1_hashSet.md)
    - Map interface
        - [HashMap](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_3_Map_1_HashMap.md)
        - HashTable
        - Properties

### 1. List 계열
- Collection interface
    - List interface
        - [ArrayList class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_1_ArrayList.md)
        - [stack class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_3_Stack.md)
        - [Queue interface](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_4_Queue.md)
            - [LinkedList class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_2_LinkedList.md)

- 형식)

  		List<E>lst = new List<E>();
 		lst.add("Mercury");
        
#### - List 계열의 컬렉션 프레임워크의 특징 ★★★
- 자료의 순서가 보장(index) : 정렬 기능 제공
- 중복데이터가 허용 
- 인덱스가 다르기 때문 (index0값과 index1값은 같을 수 있다)
- List 인터페이스의 자식클래스로 구현
- ArrayList(O), LinkedList(가끔), Vector(X)
    - ArrayList : 공간을 원하는데로 늘릴수 있다(default 10개씩)
- 특히 DB에 데이터를 레코드 단위로 저장하거나, 저장된 데이터를 가져올 경우 많이 사용

### 2. Set 계열
- Collection interface
    - List interface
    - Set interface
        - [hashSet](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_2_Set_1_hashSet.md)

#### - Set 계열 컬렉션 프레임 워크 특징
- 자료의 순서가 없다.(정렬 기능 없다. index 없다)
- 중복 데이터 허용 불가
- set 인터페이스의 자식 클래스를 이용하여 구현
-> HashSet(O), TreeSet(X)

### - List 계열의 컬렉션 프레임워크 메서드 (list, set)
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

#### 리스트 배열 전체 출력시
1. 단축 for문 
2. for문
3. Iterator [예시](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_1_List_1_ArrayList.md)
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


### 3. Map 계열

- Collection interface
    - List interface
    - Set interface
    - Map interface
        - [HashMap class](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day13_%EC%BB%AC%EB%A0%89%EC%85%98(Collection)_3_Map_1_HashMap.md)
        - HashTable class 
        - Properties class

#### - Map 계열의 컬렉션 프레임 워크 특징
- key, value를 한쌍으로 해서 데이터를 저장하고, 검색하는 기능을 제공한다.
- key는 중복 불가, value는 중복 가능 (key 이름이 중복불가, 값은 중복가능)
- Map 인터페이스의 자식 클래스로 구현 
	-> HashMap(O), HashTable(O), Properties(가끔), TreeMap(X)

### - Map 계열의 컬렉션 프레임워크 메서드 
1. put() 
    - map에 데이터를 저장하는 메서드

2. get(key) 
    - map에 저장된 데이터를 가져오는 메서드
    - get(key) 메서드를 호출하면 키에 해당하는 value 값을 반환해 주는 메서드

3. keySet() 
    - map에 저장된 전체 데이터를 출력하는 메서드(set타입으로 반환 결과값 순서대로 반환되지 않는다)

- 참조변수.containsKey(값) 
    - 인자로 넘어온 키가 map에 있는지 여부를 확인하는 메서드(반환형 : boolean)
    - 가로값이 포함되어있으면 true, 없을 경우 false 
