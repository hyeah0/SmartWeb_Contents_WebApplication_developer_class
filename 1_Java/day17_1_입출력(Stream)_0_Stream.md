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
		
		- java.lang.Object
 			- java.io.InputStream
 				- java.io.FileInputStream
	
	- 1바이트 단위로 파일을 처리하는 바이트 기반 입출력 파일 스트림
	- 그림(이미지), 오디오 파일, 비디오 파일 등 모든 종류의 파일처리가 가능하다.

2. 문자 스트림 : 2바이트 단위로 데이터를 입출력(char) >>> ____Reader

		- java.lang.Object
			- java.io.Reader
				- java.io.InputStreamReader
					- java.io.FileReader
	- 2바이트 단위로 파일을 처리하는 문자 기반 입출력 파일 스트림
  	- 문자 단위로 파일을 처리하기 때문에 그림, 오디오 파일들은 처리가 불가능 하다.
  	- 한글 출력 가능

3. 바이트 스트림 -> 문자 스트림으로 변환 관련 클래스 >>> InputStreamReader / OutputStreamReader

- 보조 스트림 : 다른 스트림과 연결되어 여러가지 편리한 기능을 제공해 주는 스트림을 말한다.
- 보조 스트림은 중간에 메모리 버퍼(buffer)와 작업을 함으로써 실행의 성능을 향상 시킬 수 있다.
	- 예를들면 프로그램은 직접 하드디스크에 데이터를 보내지 않고 메모리 버퍼에 데이터를 보냄으로써 쓰기 속도가 향상된다.
- 버퍼는 데이터가 쌓이기만 기다렸다가, 버퍼가 꽉차게 되면 데이터를 한꺼번에 하드디스크로 보내줌으로써 출력 횟수를 줄여주게 된다.
- 스트림의 기능(속도)를 향상시키는 클래스이다.
- Buffered____ : 버퍼를 제공해 주는 보조 스트림 클래스
- 버퍼(buffer) : CPU와 IO간의 속도차이를 보안


- java 입출력 관련 클래스 : java.io 패키지에 존재한다.
	- 해당 패키지에 있는 클래스들을 이용하여 입출력함
- checked 방식의 예외처리가 적용된다.
- java의 입출력은 단방향성 => 한쪽으로만 입력되고 출력이 된다.
- FIFO(First In First Out) : 먼저 입력되고 먼저 출력된다.

