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

## 바이트스트링

	- java.lang.Object
			- java.io.InputStream
				- java.io.FileInputStream
				
### 예시
- 메모장 바이트 스트림 방식으로 읽어오기
- InputStream 추상클래스이다.

		public class Ex01_InputStream_d17 {

			public static void main(String[] args) {


				// InputStream is = null;
				try {
					// 파일이 없을 경우 예외처리
					// is = new FileInputStream("C:/test/test.txt");
					InputStream is = new FileInputStream("C:/test/test.txt");

					while(true) { //무한반복
						// read 메서드 int 타입으로 반환
						int readByte = is.read();

						/*
						 *  read() 메서드로 파일의 내용 읽을 때 더이상 
						 *  읽을 데이터가 없는 경우에 -1값 반환
						 */

						if(readByte == -1) { 
							break; 
						}

						System.out.println("    readByte    : " + readByte); //정수값으로 되어있는 것을 문자로 반환
						System.out.println("(char) readByte : " +(char) readByte);
						System.out.println("------------------------------");
					}

				} catch (Exception e) {
				 // } catch (FileNotFoundException e) {
					e.printStackTrace();
				}		
			}
		}
