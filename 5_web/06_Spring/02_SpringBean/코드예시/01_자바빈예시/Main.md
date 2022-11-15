```
package com.spring.di02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {

		/*
		 * DAO : 인터페이스 _ add() 추상 메서드가 있다.
		 * OracleDAO : OracleDAO는 DAO 인터페이스를 받아 add() 메서드를 오버라이딩 했다.
		 * MySqlDAO : MySqlDAO는 DAO 인터페이스를 받아 add() 메서드를 오버라이딩 했다.
		 *
		 * ServiceImpl
		 * 1. DAO 자료형인 dao 변수가 있다. --> null인상태
		 * 2. 기본생성자와 인자생성자(매개변수로 DAO타입인걸 받는다.)가 있다.
		 * 	  ㄴ 인자생성자로 받은 매개변수는 dao변수에 넣는다. --> null이 아닌상태
		 * 3. biz() 메서드가 있다.
		 *    ㄴ 해당 메서드는 dao.add() 메서드를 실행한다.
		 *
		 * mydao.xml
		 * 1. 클래스들(MySqlDAO, OracleDAO, ServiceImpl)을 자바 빈에 넣는다.
		 * 2. 자바빈에 넣은 ServiceImpl의 property name에 지정하고 싶은 변수명을 넣는다.
		 * 3. name = dao 에 >> oracle 자바빈을 참조한다
		 *    ㄴ dao = oracle 빈
		 *
		 * Main.java
		 * - 1. mydao.xml 을 가져온다.
		 * - 2. 가져온 xml 파일 안 자바빈중 service라는 자바빈을 가져온다.
		 * - 3. service 자바빈을 ServiceImpl 객체에 넣는다.
		 * - 4. impl의 biz() 메서드를 실행한다.
		 * - 5. AbstractApplicationContext 를 종료한다.
		 */


		// mydao.xml 을 가져옴
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:mydao.xml");

		// id가 service인 자바빈을 가져온다.
		ServiceImpl impl = (ServiceImpl) ctx.getBean("service");

		impl.biz();

		// 스프링 컨테이너 종료
		ctx.close();
	}

}
```
