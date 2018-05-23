package learn.aspectj.package1;

public class ClassA {
	
	int number;
	
	public void method1(int x){
		number = 20;
		System.out.println("Method1 in classA called with " + x);
	}
	
	public String method2(){
		number = 30;
		System.out.println("method2 in ClassA called");
		ClassB classb = new ClassB();
		classb.funcb2("From ClassA");
		return "hi";
	}

}
