package my.day5.quiz;

import java.util.Scanner;

public class SwitchQuiz {
	
	int num1, num2;
	String op;

	public SwitchQuiz() {
		
		Scanner sc = new Scanner(System.in);
		
		try {
			System.out.println("첫번째 수 입력 : ");
			num1 = Integer.parseInt(sc.nextLine());
			System.out.println("두번쨰 수 입력 : ");
			num2 = Integer.parseInt(sc.nextLine());
			System.out.println("연산를 선택해주세요 (+,-,*,/,%)");
			op = sc.nextLine();
			
			result();
			
		} catch (Exception e) {
			System.out.println("입력이 잘못되었습니다.");
			return;
		}
		
				
	}
	
	public void result() {
		int result;
		
		switch (op) {
			case "+":
				result = num1 + num2;
				System.out.println("결과 : "+ num1 +" " + op + " " + num2 + " = " + result );
				break;
			case "-":
				result = num1 - num2;
				System.out.println("결과 : "+ num1 +" " + op + " " + num2 + " = " + result );
				break;
			case "*":
				result = num1 * num2;
				System.out.println("결과 : "+ num1 +" " + op + " " + num2 + " = " + result );
				break;
			case "/":
				try {
					double result1 = (double)num1 / (double)num2;
					System.out.println("결과 : "+ num1 +" " + op + " " + num2 + " = " + result1 );
					break;
				} catch (Exception e) {
					System.out.println("0으로는 나눌수 없습니다.");
				}
			case "%":
				result = num1 % num2;
				System.out.println("결과 : "+ num1 +" " + op + " " + num2 + " = " + result );
				break;
		
			default:
				System.out.println("올바른 기호를 입력해주세요");
				break;
		}
		
		
	}
}
