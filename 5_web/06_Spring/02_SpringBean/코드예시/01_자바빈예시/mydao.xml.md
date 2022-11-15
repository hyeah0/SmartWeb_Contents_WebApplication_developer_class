```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

<!-- 자바빈등록(클래스명은 등록하고 싶은 클래스명) -->
<bean id="mysql" class="com.spring.di02.MySqlDAO"></bean>
<bean id="oracle" class="com.spring.di02.OracleDAO"></bean>

<bean id="service" class="com.spring.di02.ServiceImpl">

	<property name="dao">

		<!-- dao는 참조한다. -->
		<ref bean="oracle"/>

	</property>

</bean>

</beans>
```
