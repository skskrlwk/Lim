package io.day3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
	
	static {
		User user1 = new User("한석규", 31, "서울시 강서구 방화동");
		User user2 = new User("두석규", 25, "경기도 광명시 철산동");
		User user3 = new User("세석규", 28, "서울시 서울역 1번출구");
		User user4 = new User("네석규", 27, "서울시 을지로입구역 2번출구");
		
		List<User> userList = new ArrayList<User>();
		userList.add(user1);
		userList.add(user2);
		userList.add(user3);
		userList.add(user4);
		
		MySerializable mysr = new MySerializable();
		mysr.objectToFileSave(userList, "c:/iotestdata/userinfo.txt");
	}
	
	public static void menu() {
		System.out.println("\n ======== <메뉴> ==============");
		System.out.println("1. 파일에 저장된 객체정보를 불러오기");
		System.out.println("2. 연령대 검색");
		System.out.println("3. 종료");
		System.out.println("=================================");
		System.out.println("▷ 메뉴번호 선택 => ");
		
	}

	public static void main(String[] args) {
		
		MySerializable mysr = new MySerializable();
		Object obj = null;
		List<User> userList = null;
		
		Scanner sc = new Scanner(System.in);
		String menuNo = "";
		do {
			
			Main.menu();
			menuNo = sc.nextLine();
			
			switch (menuNo) {
			case "1":
				obj = mysr.getObjectfromFile("c:/iotestdata/userinfo.txt");
				
				if(obj != null) {
					
					userList = (List<User>)obj;
					for(User user : userList) {
						System.out.println(user);
					}
				}
				break;
			case "2":
				try {
					int age = 0;
					System.out.print("검색하실 나이대를 입력해주세요 : ");
					age = Integer.parseInt(sc.nextLine());
					int flag = 0;
					obj = mysr.getObjectfromFile("c:/iotestdata/userinfo.txt");
					userList = (List<User>)obj;
					for(User user : userList) {
						if((user.getAge()/10) == age/10) {
							System.out.println(user);
							flag = 1;
						}
					}
					if(flag == 0) {
						System.out.println("검색하신 연령대가 없습니다.");
					}
					
				}catch (NumberFormatException e) {
					System.out.println("나이는 숫자만 입력가능 합니다");
				}
					
				
				break;
				
			case "3":
				System.out.println(">> 프로그램 종료");
				break;
			default : 
	
				break;
			}
			
		}while(!(menuNo.equals("3")));
		sc.close();

	}

}
