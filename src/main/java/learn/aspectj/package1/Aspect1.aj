package learn.aspectj.package1;

public aspect Aspect1 extends ClassA {
	int times=0;
	
	pointcut mypointcut() : execution(* learn.aspectj.package1.ClassA.*(..));
	
	before() : mypointcut() {
		times++;
		System.out.println("inside before pointcut " + times);
	}
	
	//Call Pointcut
	
	pointcut callpoint(String from):
		call(* learn.aspectj.package1.ClassB.funcb2(String))
		&& args(from)
		&& withincode(* learn.aspectj.package1.ClassA.*(..));
	
	
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

	after(): mypointcut() {
		times++;
		System.out.println("inside after pointcut " + times);
	
	}
}
