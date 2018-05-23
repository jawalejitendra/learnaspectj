package learn.aspectj.package1;

public class MainClass {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ClassA classA = new ClassA();
		classA.method1(10);
		classA.method2();
		
		ClassB classb = new ClassB();
		classb.funcb2("From Main");
	}

	
}
