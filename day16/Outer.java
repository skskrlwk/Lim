/*
	==== 내부클래스(inner class) ==== 
	내부클래스는 주로 AWT나 Swing과 같은 GUI어플리케이션의 이벤트처리 외에는 잘 사용하지 않을 정도로 
	사용빈도가 높지 않으므로 내부클래스의 기본 원리와 특징을 이해하는 정도까지만 학습해도 충분하다. 
	
	1. 내부클래스(inner class)란?
	    - 내부클래스란, 클래스 내에 선언된 클래스이다. 
	               클래스에 다른 클래스 선언하는 이유는 간단하다. 두 클래스가 서로 긴밀한 관계에 있기 때문이다. 
	    
	    - 내부클래스(inner class)를 사용함으로써 얻는 장점       
	                    ▷ 한 클래스를 다른 클래스의 내부클래스로 선언하면 두 클래스의 멤버들간에 서로 쉽게 접근할 수 있다는 것과 
	                    ▷ 외부에는 불필요한 관계클래스를 감춤으로써 코드의 복잡성을 줄일 수 있다는 장점을 얻을 수 있다. 
	      
	   class A {                     class A {        <== 외부클래스
	     // .......                     // .......
	   }                   ====>        class B {     <== 내부클래스(inner class)
	                                        // ......
	   class B {                        }
	     // .......                     // .......
	   }                              }
	
	
	2. 내부클래스(inner class)의 종류와 특징
	  - 내부클래스(inner class)의 종류는 변수의 선언위치에 따른 종류와 같다. 
	        내부클래스는 마치 변수를 선언하는 것과 같은 위치에 선언할 수 있으며, 
	        변수의 선언위치에 따라 인스턴스변수, 클래스변수(static변수), 지역변수로 구분되는 것과 같이 
	        내부클래스도 선언위치에 따라 다음과 같이 구분되어 진다. 
	        내부클래스의 유효범위와 성질이 변수와 유사하므로 서로 비교해보면 이해하는데 많은 도움이 된다. 
	           
	    1) 인스턴스 내부클래스(instance inner class)
	      	- 외부클래스의 멤버변수 선언위치에 선언하며, 외부클래스의 인스턴스 멤버처럼 다루어진다. 
	      	    주로 외부클래스의 인스턴스멤버들과 관련된 작업에 사용될 목적으로 선언된다.
	    
	    2) 스태틱 내부클래스(static inner class)
	        - 외부클래스의 멤버변수 선언위치에 선언하며, 외부클래스의 static 멤버처럼 다루어진다. 
	                   주로 외부클래스의 static멤버, 특히 static 메소드에서 사용될 목적으로 선언된다.
	    
	    3) 지역클래스(local class)
	        - 외부클래스의 메소드나 초기화블럭 안에 선언하며, 선언된 영역 내부에서만 사용될 수 있다.
	    
	    4) 익명클래스(anonymous class)
	        - 클래스의 선언과 객체의 생성을 동시에 하는 이름없는 클래스(일회용)
	        
	        
	3. 내부클래스(inner class)의 선언 
	   - 아래의 오른쪽 코드에는 외부클래스(Outer)에 3개의 서로 다른 종류의 내부클래스(inner class)를 선언했다. 
	          양쪽의 코드를 비교해 보면 내부클래스(inner class)의 선언위치가 변수의 선언위치와 동일함을 알 수 있다.
	          변수가 선언된 위치에 따라 인스턴스변수, 스태틱변수(클래스변수), 지역변수로 나뉘듯이 
	          내부클래스(inner class)도 이와 마찬가지로 선언된 위치에 따라 나뉜다. 
	          그리고, 각 내부클래스의 선언위치에 따라 같은 선언위치의 변수와 동일한 유효범위(scope)와 접근성(accessibility)을 갖는다.
	     
	     Class Outer {						Class Outer {
	         int a=0;							class InstanceInner { }
	         static int b=0;                    static class StaticInner { }
	         
	         void myMethod() {                  void myMethod() {
	             int c=0;                            class LocalInner { }
	         }                                  } 
	     }  	                            }
	   
	
	
	 4. 내부클래스(inner class)의 제어자와 접근성
	    - 아래코드에서 인스턴스클래스(InstanceInner)와 스태틱클래스(StaticInner)는 
	           외부클래스(Outer)의 멤버변수(인스턴스변수와 클래스변수)와 같은 위치에 선언되며, 
	           또한 멤버변수와 같은 성질을 갖는다.
	           따라서 내부클래스가 외부클래스의 멤버와 같이 간주되고, 인스턴스멤버와 static멤버간의 규칙이 내부클래스에도 똑같이 적용된다.
	           내부클래스도 클래스이기 때문에 abstract나 final과 같은 제어자를 사용할 수 있을 뿐만 아니라, 
	           멤버변수들처럼 private, protected 접근제어자도 사용이 가능하다.         
	      
	      class Outer {                       class Outer {                      	
	          private int a=0;                    private class InstanceInner { }
	          protected static int b=0;           protected static class StaticInner { }
	          
	          void myMethod() {                   void myMethod() {   
	               int c=0;                            class LocalInner { }
	          }                                   }
	       }                                   }
               	
*/

package my.day18;

public class Outer {
	
	int a = 10;			 // 인스턴스 멤버 변수
	static int b = 20;	 // 클래스변수(static 변수)
	
	
	// **** 인스턴스 내부 클래스(instance inner class) 생성 ****
	class Inner{
		
		int c = 30;
		
		void innerMethod() {
			System.out.println(">>> 인스턴스 내부 클래스(instance inner class)의 innerMethod() 메소드 호출");
		}
		
	}// end of class Inner ////////////////////////////////////
	
	// *** 네비게이터에 가서  Inner 클래스의 이름이 어떻게 생성되었는지 확인하자.
	// 결과 Outer$Inner.class
	
	// **** 스태틱 내부클래스(static inner class) 생성***
	
	static class StaticInner {
		
		int d = 40;
		static int e = 50;
		
		void staticInner_instanceMethod() {
			System.out.println(">>>  스태틱 내부클래스(static inner class)의 staticInner_instanceMethod() 메소드를 호출함!!  ");
		}
		static void staticInner_staticMethod() {
			System.out.println(">>>  스태틱 내부클래스(static inner class)의 staticInner_staticMethod() 메소드를 호출함 ");
		}
	}// end of class StaticInner
	
	public void test() {
		// Outer 클래스의 메소드내에서 인스턴스 내부클래스(instance inner class)의 메소드를 
		// 호출하는 2가지 방법에 대해서 알아본다.
		
		// 1. 정식표현
		Outer.Inner inobj = this.new Inner();
		inobj.innerMethod();
		// 2. 약식표현
		Inner inobj2 = new Inner();
		inobj2.innerMethod();
		// Outer는 자기 자신이므로 생략이 가능하고, this 도 자기자신이므로 생략이 가능하다
		
	}// end of void test()---------------------------------------------------
	
	
}
