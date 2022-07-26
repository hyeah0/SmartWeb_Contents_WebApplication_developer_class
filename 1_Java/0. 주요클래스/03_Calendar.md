# Calendar class

        - java.lang.Object
            - java.util.Calendar
	            -java.util.GregorianCalendar  

## - Calendar 클래스란?
- 날짜/시간과 관련된 정보를 제공해주는 클래스
- 날짜와 시간을 계산하는데 꼭 필요한 메서드나 상수로 구성이 되어 있다.
- 추상클래스이다. 날짜와 시간을 계산하는 방법이 지역, 나라별 다르기 때문이다.
- 객체 생성하기 하려면 Calendar 클래스가 가지고 있는 클래스(정적)메서드 getInstance() 메서드를 사용하면 된다.
- getInstance() 메서드를 호출하면 내부적으로 java.util.GreogrianCalendar 객체를 생성하여 리턴해준다. 
- GreogrianCalendar 클래스는 Calendar 클래스의 자식 클래스이다.
- getInstance() : 싱글턴 방식, 하나의 인스턴스만을 공유해서 사용할 때 쓰는 방식

- 형식) 

        Calendar cal = Calendar.getInstance(); 
        cal.get(Calendar.___);
        
### - Calendar 예시
- 코드

        public class Ex03_Calendar {

            public static void main(String[] args) {
                // 객체타입으로 반환
                Calendar cal = Calendar.getInstance(); 
                
                // 날짜와 관련된 정보 반환 (참조변수.get(클래스이름.)
                int year = cal.get(Calendar.YEAR);
                int month = cal.get(Calendar.MONTH) + 1 ;  //월은 1월이 0으로 +1을 해줘야 한다.
                int day = cal.get(Calendar.DAY_OF_MONTH);
                int week = cal.get(Calendar.WEEK_OF_YEAR); // 1년 52주 중에서 몇번째 주인지
                int mWeek = cal.get(Calendar.WEEK_OF_MONTH);
                
                System.out.println("현재 년도 : " + year);
                System.out.println("현재 월 : " + month);
                System.out.println("현재 일 : " + day);
                System.out.println("현재 몇째주 : " + week); 
                System.out.println("현재 월의 몇번째주 : " + mWeek);

                System.out.println();
                
                // 시간과 관련된 정보
                // 1. 12시간제를 이용하는 방법 - 오전(0), 오후(1)
                int am_pm = cal.get(Calendar.AM_PM);
                
                System.out.println("현재 시간은 ");
                System.out.println("-----------------12시간제");
                if(am_pm == 0) {
                    System.out.println("AM/PM >>> AM");
                }else {
                    System.out.println("AM/PM >>> PM");
                }
                
                System.out.println("hour >>> " + cal.get(Calendar.HOUR) + "시");
                System.out.println("minute >>> " + cal.get(Calendar.MINUTE) + "분");
                System.out.println("second >>> " + cal.get(Calendar.SECOND) + "초");
                
                // 2. 24시간제를 이용하는 방법 
                System.out.println("-----------------24시간제");
                System.out.println("hour >>> " + cal.get(Calendar.HOUR_OF_DAY) + "시");
                System.out.println("minute >>> " + cal.get(Calendar.MINUTE) + "분");
                System.out.println("second >>> " + cal.get(Calendar.SECOND) + "초");   
            }
        }

- 결과

        현재 년도 : 2022
        현재 월 : 7
        현재 일 : 26
        현재 몇째주 : 31
        현재 월의 몇번째주 : 5

        현재 시간은 
        -----------------12시간제
        AM/PM >>> PM
        hour >>> 2시
        minute >>> 56분
        second >>> 8초
        -----------------24시간제
        hour >>> 14시
        minute >>> 56분
        second >>> 8초


