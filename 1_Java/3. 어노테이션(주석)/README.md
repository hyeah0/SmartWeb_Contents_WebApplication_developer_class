## - 어노테이션이란?

- 자바 어노테이션(Java Annotation)

  - 어노테이션 : 주석 의미

- 자바 소스 코드에 사이에 @ 기호를 앞에 붙여서 사용
  - JDK 1.5 버전 이상에서 사용 가능

## - 어노테이션의 용도

- 컴파일러에게 코드 작성 문법 에러를 체크하도록 정보를 제공
- 소프트웨어 개발툴이 빌드나 배치시 코드를 자동으로 생성할 수 있도록 정보 제공
- 실행시(런타임시)특정 기능을 실행하도록 정보를 제공

## - 내장 애너테이션

- 7개의 표준 어노테이션 중에 3개가 java.lang의 일부이며,
- 나머지 4개는 java.lang.annotation으로부터 가져온다.

### - 어노테이션 종류

#### - 자바 코드에 적용되는 내장 어노테이션

<table border="1" cellspaing="0">
    <tr>
        <th>어노테이션</th>
        <th>설명</th>
    </tr>
    <tr>
        <td>@Override</td>
        <td>선언한 메서드가 오버라이드 되었다는 것을 나타냅니다.
            <br>만약 상위(부모) 클래스(또는 인터페이스)에서 
            <br>해당 메서드를 찾을 수 없다면 컴파일 에러 발생
        </td>
    </tr>
    <tr>
        <td>@Deprecated</td>
        <td>해당 메서드가 더 이상 사용되지 않음을 표시합니다.
            <br>만약 사용할 경우 컴파일 경고를 발생
        </td>
    </tr>
    <tr>
        <td>@SuppressWarnings</td>
        <td>선언한 곳의 컴파일 경고를 무시하도록 합니다.</td>
    </tr>
    <tr>
        <td>@SafeVarargs</td>
        <td>Java7 부터 지원
            <br>제너릭 같은 가변인자의 매개변수를 사용할 때의 경고를 무시합니다.
        </td>
    </tr>
    <tr>
        <td>@FunctionalInterface</td>
        <td>Java8 부터 지원
            <br>함수형 인터페이스를 지정하는 어노테이션입니다.
            <br>만약 메서드가 존재하지 않거나,
            <br>1개 이상의 메서드(default 메서드 제외)가 존재할 경우
            <br>컴파일 오류 발생
        </td>
    </tr>
</table>

#### - 기타 어노테이션에 적용되는 어노테이션 (메타 애터네이션)

<table border="1" cellspaing="0">
    <tr>
        <th>어노테이션</th>
        <th>설명</th>
        <th>종류</th>
        <th>종류 설명</th>
    </tr>
    <tr>
        <td>@Documented</td>
        <td>해당 어노테이션을 Javadoc에 포함
        </td>
        <td colspan="2" rowspan="2"></td>
    </tr>
    <tr>
        <td>@Inherited</td>
        <td>어노테이션의 상속을 가능
        </td>
        <td colspan="2" rowspan="2"></td>
    </tr>
    <tr>
        <td>@Repeatable</td>
        <td>Java8 부터 지원
            <br>연속적으로 어노테이션을 선언할 수 있게 해준다.
        </td>
        <td colspan="2" rowspan="2"></td>
    </tr>
    <tr>
        <td rowspan="3">@Retention</td>
        <td rowspan="3">자바 컴파일러가 어노테이션을 다루는 방법을 기술
            <br>특정 시점까지 영향을 미치는지를 결정
        </td>
        <td>RetentionPolicy.SOURCE</td>
        <td> 컴파일 전까지만 유효. (컴파일 이후에는 사라짐) </td>
    </tr>
    <tr>
        <td>RetentionPolicy.CLASS</td>
        <td>컴파일러가 클래스를 참조할 때까지 유효</td>
    </tr>
    <tr>
        <td>RetentionPolicy.RUNTIME</td>
        <td>컴파일 이후에도 JVM에 의해 계속 참조가 가능. (리플렉션 사용)</td>
    </tr>
    <tr>
        <td rowspan="10">@Target</td>
        <td rowspan="10">어노테이션이 적용할 위치를 선택</td>
        <td>ElementType.PACKAGE </td>
        <td>패키지 선언</td>
    </tr>
     <tr>
        <td>ElementType.TYPE</td>
        <td>타입 선언</td>
    </tr>
     <tr>
        <td>ElementType.ANNOTATION_TYPE</td>
        <td>어노테이션 타입 선언</td>
    </tr>
    <tr>
        <td>ElementType.CONSTRUCTOR</td>
        <td>생성자 선언</td>
    </tr>
    <tr>
        <td>ElementType.FIELD</td>
        <td>멤버 변수 선언</td>
    </tr>
    <tr>
        <td>ElementType.LOCAL_VARIABLE</td>
        <td>지역 변수 선언</td>
    </tr>
    <tr>
        <td>ElementType.METHOD</td>
        <td>메서드 선언</td>
    </tr>
    <tr>
        <td>ElementType.PARAMETER</td>
        <td>전달인자 선언</td>
    </tr>
    <tr>
        <td>ElementType.TYPE_PARAMETER</td>
        <td>전달인자 타입 선언</td>
    </tr>
    <tr>
        <td>ElementType.TYPE_USE</td>
        <td>타입 선언</td>
    </tr>    
</table>
