package my.day20.sub1;

import java.util.Scanner;

public class YieldThreadMain {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Yield[] yieldmemberArr = new Yield[5];
		int count = 0;
		
		do {
			System.out.println(">>> 회원가입하기 <<<");
			
			Yield member = new Yield();
						
			System.out.print("▷ 아이디 : ");
			String id = sc.nextLine();
			member.setId(id);
			
			do {
				System.out.print("▷ 암호 :");
				String passwd = sc.nextLine();
				member.setPasswd(passwd);
				
				if(member.getPasswd() != null)
					break;
			} while (true);
			
			yieldmemberArr[count++] = member;
			int yn = 0;
			do {
				try {
					System.out.print("연속해서 가입을 하시겠습니까? [1.예 / 2.아니요] => ");
					yn = Integer.parseInt(sc.nextLine());
					
					
				} catch (NumberFormatException e) {
					System.out.println(">>> 숫자로 1또는 2로 선택하세요");
				}
				
				
			} while (!(yn == 1 || yn == 2));
			
			if(yn == 2)
				break;
			
			if(count == yieldmemberArr.length) {
				
				System.out.println(">>> 정원마감으로 더이상 회원가입이 불가합니다.");
				break;
				
			}
				
			
		} while (true);

		// *** Runnable 객체를 스레드로 만들기 *** //
		Thread[] threadArr = new Thread[5];
		
		for(int i=0; i<count; i++) {
			threadArr[i] = new Thread(yieldmemberArr[i]);
		}
		
		System.out.println("");
		System.out.println(">>> 가입된 회원정보 출력하기 <<<");
		
		for(int i=0; i<count; i++) {
			threadArr[i].start();
		}
		sc.close();
	}

}
