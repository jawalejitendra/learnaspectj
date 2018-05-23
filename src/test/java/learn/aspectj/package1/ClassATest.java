package learn.aspectj.package1;

import org.testng.annotations.Test;

public class ClassATest {


    @Test
    public void myTest1() {
    	ClassA classA = new ClassA();
    	classA.method2();
    }

}
