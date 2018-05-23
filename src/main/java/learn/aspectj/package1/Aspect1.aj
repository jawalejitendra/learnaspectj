package learn.aspectj.package1;

public aspect Aspect1 extends ClassA {
	int times=0;
	
	/**
	 * Declare a normal pointcut with name mypointcut
	 * execution defines which methods to be intercepted
	 * first parameter in execution is the return type * means everything
	 * second parameter is what methods, below line means all methods in ClassA
	 * if you want to intercept all methods in package1 then give as learn.aspectj.package1.*.*(..)
	 * 
	 */
	pointcut mypointcut() : execution(* learn.aspectj.package1.ClassA.*(..));
	
	
	/**
	 * before executes before executing the pointcut
	 */
	before() : mypointcut() {
		times++;
		System.out.println("inside before pointcut " + times);
	}
	
	//Call Pointcut
	/**
	 * Define a call pointcut, this point cut executes only when classA method calls classB funcb2(string) 
	 * @param from
	 */
	pointcut callpoint(String from):
		call(* learn.aspectj.package1.ClassB.funcb2(String))
		&& args(from)
		&& withincode(* learn.aspectj.package1.ClassA.*(..));
	
	
	
	/**
	 * This method is to execute the original code of the pointcut added
	 * @param form
	 */
	void around(String form):callpoint(form) {
		proceed(form);
		System.out.println("<<<<------------------Inside around callpoint ");
		
	}
	
	
	after(ClassA classA) returning:
		call(* ClassA.*(..)) 
		&& target(classA) {
		times++;
		System.out.println("inside after returning pointcut with " + classA.number + times);
	}

	/**
	 * after executes after executing the pointcut (Pointcut name mypointcut is provided)
	 */
	after(): mypointcut() {
		times++;
		System.out.println("inside after pointcut " + times);
	
	}
}
