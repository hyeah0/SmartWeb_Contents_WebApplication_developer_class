## day17_입출력_스트림의 종류

### 자바 입출력 방식
1. 메인 메서드 안 인수에서 받기
2. JOptionPane 클래스에서 받기
3. Scanner 클래스를 통해 받기
4. Stream을 통해 받기

[1~3번 방식](https://github.com/hyeah0/SmartWeb_Contents_WebApplication_developer_class/blob/main/1_Java/day02_%EC%97%B0%EC%82%B0%EC%9E%90(Operator).md) 

### - Stream을 통해 받기

 java에서의 입출력 방식
- 스트림이라는 방식을 이용함
- 스트림의 사전적 의미 
    - 시냇물이라는 뜻을 가지고 있다.
	- 즉, 데이터가 물 흐르는것처럼 흐른다고 생각하면 된다.
- java에서의 스트림 : 순서가 있는 일련의 연속된 데이터

### - 스트림의 종류 
1. 바이트 스트림 : 1바이트 단위로 데이터를 입출력(byte) >>> InputStream

2. 문자 스트림 : 2바이트 단위로 데이터를 입출력(char) >>> ____Reader

3. 바이트 스트림 -> 문자 스트림으로 변환 관련 클래스 >>> InputStreamReader / OutputStreamReader

- java 입출력 관련 클래스 : java.io 패키지에 존재한다.
	- 해당 패키지에 있는 클래스들을 이용하여 입출력함
- checked 방식의 예외처리가 적용된다.
- java의 입출력은 단방향성 => 한쪽으로만 입력되고 출력이 된다.
- FIFO(First In First Out) : 먼저 입력되고 먼저 출력된다.

