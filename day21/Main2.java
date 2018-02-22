package io.day3;

import java.util.Scanner;

public class Main2 {
		
	public static void insert(MySerializable mysr ,Scanner sc) {
		
		int flag = 0;
		int age = 0;
		
		System.out.print("성명을 입력해주세요 :");
		String name = sc.nextLine();
		
		do {
			
			try {
				System.out.print("나이를 입력해주세요 : ");
				int agetest = Integer.parseInt(sc.nextLine());
				if(agetest <= 0) {
					System.out.println("나이는 1살이상 입력 가능합니다.");
				}else {
					age = agetest;	
				}
				
			} catch (NumberFormatException e) {
				System.out.println("나이는 숫자만 입력 가능합니다.");
			}
			
		} while (!(age > 0));
		
		System.out.print("주소를 입력해주세요 : ");
		String addr = sc.nextLine();
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age + "세");
		System.out.println("주소 : " + addr);
		System.out.print("등록하시겠습니까??[Y,N]");
		String cho = sc.nextLine();
		
		if(cho.toLowerCase().equals("y")) {
			User user = new User(name, age, addr);
			mysr.objectToFileSave(user, "c:/iotestdata/userinfo1.txt" );
			System.out.println("등록 완료");
			
		}else {
			System.out.println("취소하였습니다");
		}
	}
	
	public static void menu() {
		System.out.println("\n ======== <메뉴> ==============");
		System.out.println("1. 회원 추가하기");
		System.out.println("2. 회원 정보 확인");
		System.out.println("3. 종료");
		System.out.println("▷ 메뉴번호 선택 => ");
	}
	

	public static void main(String[] args) {
		
		MySerializable mysr = new MySerializable();
		
		Object obj = null;
		Scanner sc = new Scanner(System.in);
		
		String snum = "";
		do {
			menu();
			snum = sc.nextLine();
			switch (snum) {
			case "1":
				insert(mysr, sc);
				break;
			case "2":
				obj = mysr.getObjectfromFile("c:/iotestdata/userinfo1.txt");
				if(obj == null) {
					System.out.println("등록된 회원정보가 없습니다.");
				}else {
					User user = (User)obj;
					System.out.println(user);
				}
				break;
			case "3":
				System.out.println(">> 종료합니다");
				
				break;

			default:
				break;
			}
			
		} while (!(snum.equals("3")));
		
		
		
		

	}

}
