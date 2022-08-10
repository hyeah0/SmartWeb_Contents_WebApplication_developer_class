## day17_입출력_바이트스트림

java 스트림의 종류
1. 바이트 스트림 관련 클래스
	- 바이트 스트림 방식으로 데이터를 입출력 하는 클래스

			____InputStream / ____OutputStream
			- 예시) FileInputStream

2. 문자 스트림 관련 클래스
	- 문자 스트림 방식으로 데이터를 입출력하는 클래스
	    
			 ____Reader / ____Writer
			
3. 바이트 스트림 -> 문자 스트림으로 변환 관련 클래스
	
		InputStreamReader / OutputStreamReader 
		2바이트씩 문자를 출력


### 문자스트림
- 예시
- 입력값을 받으면 화면에 보여주고 끝이라고 하면 더이상 입력값을 받지 않는다.

		public class P2_inputStream {

			public static void main(String[] args) {
				System.out.println("입력 후 끝이라고 입력하세요");
				InputStreamReader isr = new InputStreamReader(System.in);

					try {
						while(true) {
						int readByte = isr.read();
						if(readByte == '끝') {
							break;
						}
						System.out.print((char)readByte);
						}
						isr.close(); 
					} catch (IOException e) {
						e.printStackTrace();

					} finally {
						// 입출력 스트림은 종료시켜주는 것이 좋다. (close)
							}		
			}

		}
