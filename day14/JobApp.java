/*
     === *** 구인, 구직 관련 프로그래밍을 만들어보자 *** ===
     
       1. 부품(요소) --> 구직자, 구인회사
       2. 추상화작업
          1) 구직자    --> 속성(멤버변수), 기능(메소드)
          2) 구인회사 --> 속성(멤버변수), 기능(메소드)
          
 */

package my.day13.test;

import java.util.Scanner;

import my.util.MyUtil;

public class JobApp {

	Common[] commonArr = new Common[20];
	static int commonCount = 0;
	
	Recruit[] recruitArr = new Recruit[50];
	static int recruitCount = 0;
	
	public static void menu() {
		
		System.out.println("========= Menu ==========");
		System.out.println("1. 구직자등록");
		System.out.println("2. 회사정보등록");
		System.out.println("3. 구인등록");
		System.out.println("4. 모든 구직자정보 출력");
		System.out.println("5. 모든 구인정보 출력");
		System.out.println("6. 구직자 ID 검색");
		System.out.println("7. 구인회사 ID 검색");
		System.out.println("8. 특정 업종 구인정보 출력");
		System.out.println("9. 특정 조건 구직자정보 출력");
		System.out.println("10. 특정 구직자 삭제하기");
		System.out.println("11. 특정 구직자 데이터변경하기");
		System.out.println("12. 종료");
		System.out.println("===========================");
		System.out.print("메뉴번호를 선택하세요 => ");
		
	}// end of menu()-----------------------------------
	
	
	// *** 메뉴번호 1. 구직자 등록을 해주는 메소드 생성하기 *** //
	public void registerGujikja(Scanner sc) {
		
		Gujikja gujikja = new Gujikja();
		
		do {
			System.out.print("▷아이디 => ");
			String userid = sc.nextLine();
			
			// 구직자아이디가 중복된 것이라면 false 리턴해주고,
			// 구직자아이디가 중복된 것이 아니라면 true 리턴해주는 메소드호출
			boolean isUseridUse = userIdDuplicateCheck(userid);
			
			if(isUseridUse) {  // 구직자아이디가 중복된 것이 아니라면
				gujikja.id = userid;
				break;
			}
			else { // 구직자아이디가 중복된 것이라면
				System.out.println(">>> 이미 사용중인 사용자 ID 이므로 새로운 ID값을 입력하세요!!");
			}
			
		} while (true);
		
		
		do {
			System.out.print("▷암호 => ");
			String passwd = sc.nextLine();
			
			if( MyUtil.passwdCheck(passwd) ) {
				gujikja.passwd = passwd;
				break;
			}
			else {
				System.out.println(">> 암호는 7글자 이상의 영문자,숫자,특수문자가 혼합되어져야만 합니다.!!"); 
			}
			
		} while (true);
		
		
		System.out.print("▷성명 => ");
		gujikja.name = sc.nextLine();
		
		do {
			try {
				System.out.print("▷나이 => ");
				int age = Integer.parseInt(sc.nextLine());
				if(age > 0) {
				//	gujikja.age = age;
					gujikja.setAge(age);
					break;
				}
				else {  // 입력한 나이가 0 또는 음수로 입력한 경우이라면
					System.out.println(">> 나이는 0보다 커야 합니다.");
					continue;
				}
				
			} catch (NumberFormatException e) {
				System.out.println(">> 나이는 정수만 입력가능합니다.!!");
			}
				
		} while (true);
		
		
		System.out.print("▷성별(1.남 / 2.여) => ");
	//	gujikja.gender = "1".equals(sc.nextLine())?"남":"여";
		gujikja.setGender("1".equals(sc.nextLine())?"남":"여");
				
		System.out.print("▷주소 : ");
		gujikja.address = sc.nextLine();
		
		System.out.print("▷학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만 ) => "); 
		
		switch (sc.nextLine()) {
			case "1":
		//		gujikja.school = "대졸이상";
				gujikja.setSchool("대졸이상");
				break;
	
			case "2":
		//		gujikja.school = "초대졸";
				gujikja.setSchool("초대졸");
				break;
				
			case "3":
		//		gujikja.school = "고졸";
				gujikja.setSchool("고졸");
				break;
				
			case "4":
			default:
		//		gujikja.school = "고졸미만";
				gujikja.setSchool("고졸미만");
				break;
		}// end of switch-------------------------
		
		System.out.print("▷휴대폰번호 : ");
		gujikja.tel = sc.nextLine();
		
		System.out.print("▷희망직종 : ");
	//	gujikja.hopejob = sc.nextLine();
		gujikja.setHopejob(sc.nextLine());
		
		do {
			try {
				System.out.print("▷희망급여 => ");
				int hopemoney = Integer.parseInt(sc.nextLine());
				if(hopemoney > 0) {
				//	gujikja.hopemoney = hopemoney;
					gujikja.setHopemoney(hopemoney);
					break;
				}
				else {  // 희망급여를  0 또는 음수로 입력한 경우이라면
					System.out.println(">> 희망급여는 0보다 커야 합니다.");
					continue;
				}
				
			} catch (NumberFormatException e) {
				System.out.println(">> 희망급여는 정수만 입력가능합니다.!!");
			}
				
		} while (true);
		
		System.out.println("\n"+gujikja.showGujikja()+"\n");
		
		System.out.print("\n>> 위 정보를 등록하시겠습니까?[1.예 / 2.아니오] => "); 
		if("1".equals(sc.nextLine())) {
			// 객체 gujikja 을  Gujikja[] gujikjaArr 에 저장시킨다.
			// 문제는 gujikjaArr 이 배열이므로 배열의 크기가 꽉차있으면
			// 저장시킬 수가 없다.
			// 그러므로 배열의 크기를 먼저 알아봐서 크기가 오버가 되어지면
			// "정원마감" 이라는 메시지를 띄우도록 하자.
			saveGujikja(gujikja);
		}
		
	}// end of void registerGujikja(Scanner sc)---------------
	
	public void saveGujikja(Gujikja gujikja) {
		
		if(commonCount >= commonArr.length) {
			System.out.println(">>> 정원이 마감되었습니다.");
		}
		else {
			
			int flag = 0;
			
			if (commonCount > 0) {
				for(int i=0; i<commonCount; i++) {
					if ( commonArr[i] == null ) { // 배열에서 삭제된 것이 있는 경우   
						commonArr[i] = gujikja;   // 그 배열의 삭제된 방번호에 새로운 구직자를 저장시켜준다.
						flag = 1;
						break;
					}
				}// end of for--------------------------
			}
			
			if(flag == 0) {
				commonArr[commonCount++] = gujikja;	
			}
			
			System.out.println(commonCount + "명 등록[마감정원: " + commonArr.length + "명]");
			System.out.println("");
		}
		
	}// end of void  saveGujikja(Gujikja gujikja)------------------
	
	public boolean userIdDuplicateCheck(String userid) {
		
		int flag = 0;
		boolean isUse = false;
		
		for (int i=0; i<commonCount; i++) {
			
			if (commonArr[i] == null) continue;
			
			String existUserid = commonArr[i].id;
  //////////	
			if(commonArr[i] instanceof Gujikja && userid.equals(existUserid)) {  
				// 기존에 존재하는 구직자의 userid 값과 
				// 새로이 가입하려는 userid 값이 일치하는 경우
				// 즉, 중복된 userid 값인 경우이다.
				flag = 1;
				break;
			}
			
		}// end of for---------------------
		
		if (flag == 0) {  // 새로이 가입하려는 userid 값이 기존의 userid 값과
			              // 일치하는 것이 없는 경우 (고유한 userid 이라면)
			
			isUse = true;
		}
		
		return isUse;
		
	}// end of userIdDuplicateCheck(String userid)---------------
	
	
	// *** 메뉴번호 2. 회사정보등록 해주는 메소드 생성하기 *** //
	public void registerCompany(Scanner sc) {
		
		Company company = new Company();
		
		do {
			System.out.print("▷회사아이디 => ");
			String comid = sc.nextLine();
			
			// 회사아이디가 중복된 것이라면 false 리턴해주고,
			// 회사아이디가 중복된 것이 아니라면 true 리턴해주는 메소드호출
			boolean isComidUse = comIdDuplicateCheck(comid);
			
			if(isComidUse) {  // 회사아이디가 중복된 것이 아니라면
				company.id = comid;
				break;
			}
			else { // 회사아이디가 중복된 것이라면
				System.out.println(">>> 이미 사용중인 회사 ID 이므로 새로운 ID값을 입력하세요!!");
			}
			
		} while (true);
		
		
		do {
			System.out.print("▷암호 => ");
			String passwd = sc.nextLine();
			
			if( MyUtil.passwdCheck(passwd) ) {
				company.passwd = passwd;
				break;
			}
			else {
				System.out.println(">> 암호는 7글자 이상의 영문자,숫자,특수문자가 혼합되어져야만 합니다.!!"); 
			}
			
		} while (true);
		
		
		System.out.print("▷회사명 => ");
		company.name = sc.nextLine();
		
		System.out.print("▷대표자명 => ");
	//	company.ceo = sc.nextLine();
		company.setCeo(sc.nextLine());
		
		do {
			try {
				System.out.print("▷자본금 => ");
				long seedmoney = Long.parseLong(sc.nextLine());
				if(seedmoney > 0) {
				//	company.seedmoney = seedmoney;
					company.setSeedmoney(seedmoney);
					break;
				}
				else {  // 입력한 자본금이 0 또는 음수로 입력한 경우이라면
					System.out.println(">> 자본금은 0보다 커야 합니다.");
					continue;
				}
				
			} catch (NumberFormatException e) {
				System.out.println(">> 자본금은 정수만 입력가능합니다.!!");
			}
				
		} while (true);
		
		System.out.print("▷업종[1.제조 / 2.IT / 3.서비스 / 4.기타] => "); 
		
		switch (sc.nextLine()) {
			case "1":
			//	company.jobtype = "제조";
				company.setJobtype("제조");
				break;
	
			case "2":
			//	company.jobtype = "IT";
				company.setJobtype("IT");
				break;
				
			case "3":
			//	company.jobtype = "서비스";
				company.setJobtype("서비스");
				break;
				
			case "4":
			default:
			//	company.jobtype = "기타";
				company.setJobtype("기타");
				break;
		}// end of switch-------------------------
				
		System.out.print("▷회사주소 : ");
		company.address = sc.nextLine();
		
		System.out.print("▷회사전화번호 : ");
		company.tel = sc.nextLine();
		
		System.out.println("\n"+company.showCompany()+"\n");
		
		System.out.print("\n>> 위 정보를 등록하시겠습니까?[1.예 / 2.아니오] => "); 
		if("1".equals(sc.nextLine())) {
			// 객체 company 을  Company[] companyArr 에 저장시킨다.
			// 문제는 companyArr 이 배열이므로 배열의 크기가 꽉차있으면
			// 저장시킬 수가 없다.
			// 그러므로 배열의 크기를 먼저 알아봐서 크기가 오버가 되어지면
			// "정원마감" 이라는 메시지를 띄우도록 하자.
			saveCompany(company);
		}		
		
	}// end of registerCompany(Scanner sc)--------------------
	

	public boolean comIdDuplicateCheck(String comid) {
		
		int flag = 0;
		boolean isUse = false;
		
		for (int i=0; i<commonCount; i++) {
			
			if (commonArr[i] == null) continue;
			
			String existComid = commonArr[i].id;
 ///////////			
			if(commonArr[i] instanceof Company && comid.equals(existComid)) {  
				// 기존에 존재하는 회사의 comid 값과 
				// 새로이 가입하려는 comid 값이 일치하는 경우
				// 즉, 중복된 comid 값인 경우이다.
				flag = 1;
				break;
			}
			
		}// end of for---------------------
		
		if (flag == 0) {  // 새로이 가입하려는 comid 값이 기존의 comid 값과
			              // 일치하는 것이 없는 경우 (고유한 comid 이라면)
			
			isUse = true;
		}
		
		return isUse;
		
	}// end of comIdDuplicateCheck(String comid)---------------	
	
	
	public void saveCompany(Company company) {
		
		if(commonCount >= commonArr.length) {
			System.out.println(">>> 정원이 마감되었습니다.");
		}
		else {
			
			int flag = 0;
			
			if (commonCount > 0) {
				for(int i=0; i<commonCount; i++) {
					if ( commonArr[i] == null ) { // 배열에서 삭제된 것이 있는 경우   
						commonArr[i] = company;   // 그 배열의 삭제된 방번호에 새로운 회사를 저장시켜준다.
						flag = 1;
						break;
					}
				}// end of for--------------------------
			}
			
			if(flag == 0) {
				commonArr[commonCount++] = company;	
			}
			
			System.out.println(commonCount + "회사 등록[마감정원: " + commonArr.length + "회사]");
			System.out.println("");
		}
		
	}// end of void saveCompany(Company company)------------------
	
	
	// *** 메뉴번호 3. 구인등록 해주는 메소드 생성하기 *** //
	public void registerRecruit(Scanner sc) {
		
		// == 구인회사 아이디 입력하기 ==
		System.out.print(">> 구인회사 ID 입력 => ");
		String comid = sc.nextLine();
		
		Company company = searchCompany(comid);
		
		if (company == null) {
			// 회사회원으로 존재하지 않는 회사이라면
			// 회사등록을 하도록 하겠다.
			System.out.println(">> 기업회원으로 존재하지 않으므로 채용공고가 불가합니다."); 
			System.out.println(">> 기업회원 가입으로 이동합니다.\n");
			registerCompany(sc);
		}
		else {
			// 기업회원으로 존재하는 경우이라면 채용공고가 되도록 한다.
			Recruit recruit = new Recruit();
			
		//	recruit.company = company;
			recruit.setCompany(company);
			
			System.out.print("채용성별[1.남 / 2.여 / 3.성별무관] => ");
			switch (sc.nextLine()) {
				case "1":
				//	recruit.gender = "남";
					recruit.setGender("남");
					break;
					
				case "2":
				//	recruit.gender = "여";
					recruit.setGender("여");
					break;
				
				case "3":
				default:
				//	recruit.gender = "성별무관";
					recruit.setGender("성별무관");
					break;
			}// end of switch-------------------
			
			do {
				try {
					System.out.print(">> 최소나이 => ");
					int agemin = Integer.parseInt(sc.nextLine());
					
					System.out.print(">> 최대나이 => ");
					int agemax = Integer.parseInt(sc.nextLine());
					
					if (agemin*agemax == 0 || 
						agemin < 0 || agemax < 0 ) {
						System.out.println(">> 나이는 0보다 커야합니다.!!");
					}
					else {
					//	recruit.agemin = agemin;
						recruit.setAgemin(agemin);
					
					//	recruit.agemax = agemax;
						recruit.setAgemax(agemax);
						break;
					}
					
				} catch (NumberFormatException e) {
					System.out.println(">> 나이는 숫자만 가능합니다.!!");
				}
					
			} while (true);
			
			
			System.out.print("채용학력[1.대졸이상 / 2.초대졸 / 3.고졸 / 4.학력무관] => "); 
			switch (sc.nextLine()) {
				case "1":
				//	recruit.school = "대졸이상";
					recruit.setSchool("대졸이상");
					break;
					
				case "2":
				//	recruit.school = "초대졸";
					recruit.setSchool("초대졸");
					break;
				
				case "3":
				//	recruit.school = "고졸";
					recruit.setSchool("고졸");
					break;
					
				case "4":	
				default:
				//	recruit.school = "학력무관";
					recruit.setSchool("학력무관");
					break;
			}// end of switch-------------------			
			
			System.out.println("\n"+recruit.showRecruit());
			
			System.out.print(">>\n위의 채용공고를 등록하시겠습니까?[1.예 / 2.아니오] => "); 
			
			if ("1".equals(sc.nextLine())) 
				saveRecruit(recruit);
			else
				System.out.println(">> 채용공고 등록을 취소하셨습니다."); 
			
		}// end of if ~ else----------------------
		
	}// end of registerRecruit(Scanner sc)-------------------
	
	
	public Company searchCompany(String comid) {
		
		Company result = null;
		
		for(int i=0; i<commonCount; i++) {
			if(commonArr[i] == null)
				continue;
			String existComid = commonArr[i].id;
  	
			if(commonArr[i] instanceof Company && existComid.equals(comid)) {
				result = (Company)commonArr[i];
				break;
			}
		}// end of for---------------------------
		
		return result;
	}// end of Company searchCompany(String comid)--------------
	
	
	public void saveRecruit(Recruit recruit) {
		
		if (recruit != null) {
			
			if(recruitCount >= recruitArr.length) {
				System.out.println(">>> 채용공고 가능한 횟수 50개가 마감되었습니다.");
			}
			else {
				recruitArr[recruitCount++] = recruit;
				System.out.println(recruitCount + "개 채용공고 등록[마감정원: " + recruitArr.length + "건]");  
			}
			
		}
		
	}// end of saveRecruit(Recruit recruit)------------------
	
	
	// *** 메뉴번호 4. 모든 구직자정보 출력 해주는 메소드 생성하기 *** //
	public void showAllGujikja() {
	/*	
		if(gujikjaCount == 0) {
			System.out.println(">>> 가입된 구직자가 없으므로 조회불가합니다.");
		}
		else {
			for(int i=0; i<gujikjaCount; i++) {
				if(gujikjaArr[i] != null) {
					System.out.println(gujikjaArr[i].showGujikja());
					System.out.println("\n");
				}
			} // end of for--------------------
		}
	*/
		int count = 0;
		
		for(int i=0; i<commonCount; i++) {
			if(commonArr[i] != null && commonArr[i] instanceof Gujikja) {
				count++;
				System.out.println(((Gujikja)commonArr[i]).showGujikja());
				System.out.println("\n");
			}
		} // end of for--------------------
		
		if(count == 0) {
			System.out.println(">>> 가입된 구직자가 없으므로 조회불가합니다.");
		}
		
	}// end of void showAllGujikja()-----------------------
	
	
	// *** 메뉴번호 5. 모든 구인정보 출력 해주는 메소드 생성하기 *** //
	public void showAllRecruit() {
		
		for (int i=0; i<recruitCount; i++) {
			System.out.println(recruitArr[i].showRecruit()+"\n");
		}
		
	}// end of showAllRecruit()---------------------------
		
	
	// *** 메뉴번호 6. 구직자 ID 검색 해주는 메소드 생성하기 *** //
	public void showGujikaIdSearch(Scanner sc) {
	/*	
		if (gujikjaCount == 0) {
			System.out.println(">>> 가입된 구직자가 없으므로 조회불가합니다.");
		}
		else {
			System.out.print(">> 조회하려는 아이디명 ==> ");
			String searchUserid = sc.nextLine();
			
			int flag = 0;
			
			for (int i=0; i<gujikjaCount; i++) {
				 String existUserid = gujikjaArr[i].userid;
				 
				 if (existUserid.equals(searchUserid)) {
					 flag = 1;
					 System.out.println(gujikjaArr[i].showGujikja());
					 break;
				 }
			}// end of for-------------------------
			
			if (flag == 0) {
				System.out.println(">>> 검색하려는 사용자 ID " + searchUserid + "은 존재하지 않습니다.");
			}
			
		}
	*/	
		
		System.out.print(">> 조회하려는 아이디명 ==> ");
		String searchUserid = sc.nextLine();
		
		int flag = 0;
		
		for (int i=0; i<commonCount; i++) {
			if(commonArr[i] == null)
				continue;
			 String existUserid = commonArr[i].id;
			 
			 if (commonArr[i] instanceof Gujikja && existUserid.equals(searchUserid)) {
				 flag = 1;
				 System.out.println(((Gujikja)commonArr[i]).showGujikja());
				 break;
			 }
		}// end of for-------------------------
		
		if (flag == 0) {
			System.out.println(">>> 검색하려는 사용자 ID " + searchUserid + "은 존재하지 않습니다.");
		}
		
	}// end of showGujikaIdSearch(Scanner sc)-------------------
	
	
	// *** 메뉴번호 7. 구인회사 ID 검색해주는 메소드 생성하기 *** //
	public void showCompanyIdSearch(Scanner sc) {
	/*	
		if (companyCount == 0) {
			System.out.println(">>> 가입된 회사가 없으므로 조회불가합니다.");
		}
		else {
			System.out.print(">> 조회하려는 아이디명 ==> ");
			String searchComid = sc.nextLine();
			
			int flag = 0;
			
			for (int i=0; i<companyCount; i++) {
				 String existComid = companyArr[i].comid;
				 
				 if (existComid.equals(searchComid)) {
					 flag = 1;
					 System.out.println(companyArr[i].showCompany());
					 break;
				 }
			}// end of for-------------------------
			
			if (flag == 0) {
				System.out.println(">>> 검색하려는 회사 ID " + searchComid + "은 존재하지 않습니다.");
			}
			
		}		
	*/
		System.out.print(">> 조회하려는 아이디명 ==> ");
		String searchComid = sc.nextLine();
		
		int flag = 0;
		
		for (int i=0; i<commonCount; i++) {
			 String existComid = commonArr[i].id;
			 
			 if (commonArr[i] instanceof Company && existComid.equals(searchComid)) {
				 flag = 1;
				 System.out.println(((Company)commonArr[i]).showCompany());
				 break;
			 }
		}// end of for-------------------------
		
		if (flag == 0) {
			System.out.println(">>> 검색하려는 회사 ID " + searchComid + "은 존재하지 않습니다.");
		}
		
	}// end of showCompanyIdSearch(Scanner sc)--------------------
	
	
	// *** 메뉴번호 8. 특정 업종 구인정보 출력 해주는 메소드 생성하기 *** //
	public void showSpecialJobtypeRecruit(Scanner sc) {
		
		System.out.println(">> 업종[1.제조 / 2.IT / 3.서비스 / 4.기타]");
		System.out.print(">> 조회할 업종선택 => ");
		
		String jobTypeNo = sc.nextLine();
		String searchJobtype = "";
		
		switch (jobTypeNo) {
			case "1":
				searchJobtype = "제조";
				break;
			
			case "2":
				searchJobtype = "IT";			
				break;
			
			case "3":
				searchJobtype = "서비스";
				break;
			
			case "4":
			default:
				searchJobtype = "기타";
				break;
		}// end of switch----------------------------
		
		for(int i=0; i<recruitCount; i++) {
			
		//	String jobtype = recruitArr[i].company.jobtype;
			String jobtype = recruitArr[i].getCompany().getJobtype();
			
			if(jobtype.equals(searchJobtype)) 
				System.out.println(recruitArr[i].showRecruit()+"\n"); 
			
		}// end of for----------------------------
		
	}// end of showSpecialJobtypeRecruit(Scanner sc)---------------
	
	
	// *** 메뉴번호 9. 특정 조건 구직자정보 출력 해주는 메소드 생성하기 *** //
	public void showSearchGujikja(Scanner sc) {
		
		int agemin=0, agemax=0, hopemoneymin=0, hopemoneymax=0;
		String gender = "", school = "";
		
		try {
			
			do {
				System.out.print("▷최소나이 => ");
				agemin = Integer.parseInt(sc.nextLine());
				
				System.out.print("▷최대나이 => ");
				agemax = Integer.parseInt(sc.nextLine());
			
				if (agemin <= 0 || agemax <= 0) {
					System.out.println(">> 나이는 0보다 커야 합니다.");
					continue;
				}
				else break;
					
			} while (true);
			
			
			System.out.print("▷성별[1.남 / 2.여 / 3.성별무관] => ");
			
			switch (sc.nextLine()) {
				case "1":
					gender = "남";
					break;
					
				case "2":
					gender = "여";
					break;	
				
				case "3":	
				default:
					gender = "성별무관";
					break;
			}// end of switch------------------
			
			 
			System.out.print("▷학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만 / 5.학력무관 )=> ");
			
			switch (sc.nextLine()) {
				case "1":
					school = "대졸이상";
					break;
					
				case "2":
					school = "초대졸";
					break;	
				
				case "3":
					school = "고졸";
					break;
					
				case "4":
					school = "고졸미만";
					break;	
					
				case "5":	
				default:
					school = "학력무관";
					break;
			}// end of switch------------------
			
			do {
				System.out.print("▷최소희망급여 => ");
				hopemoneymin = Integer.parseInt(sc.nextLine());
				
				System.out.print("▷최대희망급여 => ");
				hopemoneymax = Integer.parseInt(sc.nextLine());
			
				if (hopemoneymin <= 0 || hopemoneymax <= 0) {
					System.out.println(">> 희망급여는 0보다 커야 합니다.");
					continue;
				}
				else if (hopemoneymin > hopemoneymax) {
					System.out.println(">> 최대희망급여는 최소희망급여 보다 같거나 커야 합니다.");
					continue;
				}
				else break;
					
			} while (true);
			
			
			// ==== 나이 검색 ====
		//	Gujikja[] ageGujikjaArr = new Gujikja[gujikjaArr.length];
			Gujikja[] ageGujikjaArr = new Gujikja[commonArr.length];
			int ageIndex = 0;
			
			for(int i=0; i<commonCount; i++) {
				 if(commonArr[i] == null) continue;
				 
				 if(commonArr[i] instanceof Gujikja && 
					agemin <= ((Gujikja)commonArr[i]).getAge() && ((Gujikja)commonArr[i]).getAge() <= agemax 
					)
					ageGujikjaArr[ageIndex++] = (Gujikja)commonArr[i];
			}// end of for------------------
			
			if (ageIndex == 0) {
				System.out.println(">> 검색조건에 맞는 연령대의 구직자는 없습니다.!!");
				return; // -------- 메소드 종료하기 -----------
			}
			
			
			// ==== 희망급여 검색 =====
			Gujikja[] hopemoneyGujikjaArr = null;
			int hopemoneyIndex = 0;
			
			if( ageIndex > 0 ) {
			
				hopemoneyGujikjaArr = new Gujikja[ageIndex];
				
				for(int i=0; i<ageIndex; i++) {
				//	 if( hopemoneymin <= ageGujikjaArr[i].hopemoney && ageGujikjaArr[i].hopemoney <= hopemoneymax )  
				//		 hopemoneyGujikjaArr[hopemoneyIndex++] = ageGujikjaArr[i];
					 
					 if( hopemoneymin <= ageGujikjaArr[i].getHopemoney() && ageGujikjaArr[i].getHopemoney() <= hopemoneymax )  
						 hopemoneyGujikjaArr[hopemoneyIndex++] = ageGujikjaArr[i]; 
					 
				}// end of for------------------
				
				if (hopemoneyIndex == 0) {
					System.out.println(">> 검색조건에 맞는 희망급여의 구직자는 없습니다.!!");
					return; // -------- 메소드 종료하기 -----------
				}	
			}
						
			// ==== 성별 및 학력 검색 =====
			// 경우1 : 성별무관 이며 학력도 무관일 경우
			// 경우2 : 성별은 있으면서 학력이 무관일 경우
			// 경우3 : 성별은 무관이면서 학력이 있을 경우
			// 경우4 : 성별도 있고 학력도 있을 경우
			
			// System.out.println("확인용 hopemoneyIndex : " + hopemoneyIndex);
			
			if (hopemoneyIndex > 0) {

				Gujikja[] finalGujikjaArr = new Gujikja[hopemoneyIndex];
				int finalIndex = 0;
				
				// === 경우1 : 성별무관 이며 학력도 무관일 경우 ===
				if ("성별무관".equals(gender) && "학력무관".equals(school)) {
					
					for(int i=0; i<hopemoneyIndex; i++) {
						finalGujikjaArr[finalIndex++] = hopemoneyGujikjaArr[i];
					}// end of for------------------------
					
				}
				
				// === 조건2 : 성별은 있으면서 학력이 무관일 경우 ===
				else if (!"성별무관".equals(gender) && "학력무관".equals(school)) {
					
					for(int i=0; i<hopemoneyIndex; i++) {
					//	String existGender = hopemoneyGujikjaArr[i].gender;
						String existGender = hopemoneyGujikjaArr[i].getGender();
						
						if(existGender.equals(gender))
							finalGujikjaArr[finalIndex++] = hopemoneyGujikjaArr[i];
					}// end of for------------------------
					
					if(finalIndex == 0) {
						System.out.println(">> 검색조건에 맞는 성별과 학력의 구직자는 없습니다.!!");
						return; // -------- 메소드 종료하기 -----------
					}
					
				}
				
				// === 조건3 : 성별은 무관이면서 학력이 있을 경우 ===
				else if ("성별무관".equals(gender) && !"학력무관".equals(school)) {
				
					for(int i=0; i<hopemoneyIndex; i++) {
					//	String existSchool = hopemoneyGujikjaArr[i].school;
						String existSchool = hopemoneyGujikjaArr[i].getSchool();
						
						if(existSchool.equals(school))
							finalGujikjaArr[finalIndex++] = hopemoneyGujikjaArr[i];
					}// end of for------------------------
					
					if(finalIndex == 0) {
						System.out.println(">> 검색조건에 맞는 성별과 학력의 구직자는 없습니다.!!");
						return; // -------- 메소드 종료하기 -----------
					}	
					
				}
				
				// === 조건4 : 성별도 있고 학력도 있을 경우 ===
				else if (!"성별무관".equals(gender) && !"학력무관".equals(school)) {
					for(int i=0; i<hopemoneyIndex; i++) {
					//	String existGender = hopemoneyGujikjaArr[i].gender;
					//	String existSchool = hopemoneyGujikjaArr[i].school;
						
						String existGender = hopemoneyGujikjaArr[i].getGender();
						String existSchool = hopemoneyGujikjaArr[i].getSchool();
						
						if(existGender.equals(gender) && existSchool.equals(school))
							finalGujikjaArr[finalIndex++] = hopemoneyGujikjaArr[i];
					}// end of for------------------------
					
					if(finalIndex == 0) {
						System.out.println(">> 검색조건에 맞는 성별과 학력의 구직자는 없습니다.!!");
						return; // -------- 메소드 종료하기 -----------
					}	
				}
				
				System.out.println(">> === 최종검색결과 === <<");
				
				if (finalGujikjaArr != null && finalGujikjaArr.length > 0) {
					for (Gujikja gujikja : finalGujikjaArr) {
						System.out.println(gujikja.showGujikja()+"\n");
					}	
				}
				
			}
			
		} catch (NumberFormatException e) {
			System.out.println(">> 입력값은 숫자만 가능합니다.");
		}
		
	}// end of showSearchGujikja(Scanner sc)----------------------
	
	
	// *** 메뉴번호 10. 특정 구직자 삭제해주는 메소드 생성하기 *** //
	public void deleteGujikja(Scanner sc) {
		
		System.out.print(">>> 삭제하려는 사용자 ID => ");
		String userid = sc.nextLine();
	/*	
		if (gujikjaCount == 0) {
			System.out.println(">>> 가입된 구직자가 없으므로 삭제불가합니다."); 
		}
		else {
			int flag = 0;
			
			for (int i=0; i<gujikjaCount; i++) {
				 if(gujikjaArr[i].userid.equals(userid)) {
					flag = 1; 
					gujikjaArr[i] = null; // 삭제하기
					// gujikjaArr[0] ==> "한석규"
					// gujikjaArr[1] ==> null
					// gujikjaArr[2] ==> "세석규"
					
					// gujikjaArr[3] ==> "네석규" 와 같이 하지 말고
					// gujikjaArr[1] ==> "네석규" 와 같이 하자는 말이다.
					
					break;
				 }
			}// end of for-------------------------
			
			if (flag == 1) {
				System.out.println(">>> 사용자 ID " + userid + "은 삭제 성공하였습니다."); 
			}
			else {
				System.out.println(">>> 사용자 ID " + userid + "은 존재하지 않으므로 삭제하지 못했습니다."); 
			}
		}
	*/
		
			int flag = 0;
			
			for (int i=0; i<commonCount; i++) {
				 if(commonArr[i] instanceof Gujikja && commonArr[i].id.equals(userid)) {
					flag = 1; 
				//	gujikjaArr[i] = null; // 삭제하기
					commonArr[i] = null; // 삭제하기
					// gujikjaArr[0] ==> "한석규"
					// gujikjaArr[1] ==> null
					// gujikjaArr[2] ==> "세석규"
					
					// gujikjaArr[3] ==> "네석규" 와 같이 하지 말고
					// gujikjaArr[1] ==> "네석규" 와 같이 하자는 말이다.
					
					break;
				 }
			}// end of for-------------------------
			
			if (flag == 1) {
				System.out.println(">>> 사용자 ID " + userid + "은 삭제 성공하였습니다."); 
			}
			else {
				System.out.println(">>> 사용자 ID " + userid + "은 존재하지 않으므로 삭제하지 못했습니다."); 
			}
		
	}// end of deleteGujikja(Scanner sc)-----------------------
	
	
	// *** 메뉴번호 11. 특정 구직자 데이터변경해주는 메소드 생성하기 *** //
	public void updateGujikja(Scanner sc) {
		
		Gujikja updategujikja = null;
		
		System.out.print(">> 변경하려는 구직자 ID : => ");
		String userid = sc.nextLine(); 
		
		int i=0, flag=0;
		
		for (; i<commonCount; i++) {
			if ( commonArr[i] == null ) 
				continue;
			else {
				if (commonArr[i] instanceof Gujikja && commonArr[i].id.equals(userid) ) {
					 flag = 1;
					 break;
				}
			}
		}// end of for----------------------
		
		if (flag == 0) {
			System.out.println(">> 변경하려는 사용자 ID " + userid + "은 등록되지 않은 ID 입니다.");
		}
		else {
			((Gujikja)commonArr[i]).showGujikja(); // 변경대상의 기존정보를 보여준다.
			
			String passwd="", name="", gender="", address="", school="", mobile="", hopejob="";
			int age=0, hopemoney=0;
			
		    System.out.println("\n==== <변경내용 입력란 시작> ====");
		
			do {
				System.out.print("▷암호 => ");
				passwd = sc.nextLine();
				
				if( MyUtil.passwdCheck(passwd) ) {
					break;
				}
				else {
					System.out.println(">> 암호는 7글자 이상의 영문자,숫자,특수문자가 혼합되어져야만 합니다.!!"); 
				}
				
			} while (true);
		
		
			System.out.print("▷성명 => ");
			name = sc.nextLine();
		
			do {
				try {
					System.out.print("▷나이 => ");
					age = Integer.parseInt(sc.nextLine());
					if(age > 0) {
						break;
					}
					else {  // 입력한 나이가 0 또는 음수로 입력한 경우이라면
						System.out.println(">> 나이는 0보다 커야 합니다.");
						continue;
					}
					
				} catch (NumberFormatException e) {
					System.out.println(">> 나이는 정수만 입력가능합니다.!!");
				}
					
			} while (true);
		
		
		System.out.print("▷성별(1.남 / 2.여) => ");
		gender = "1".equals(sc.nextLine())?"남":"여";
				
		System.out.print("▷주소 : ");
		address = sc.nextLine();
		
		System.out.print("▷학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만 ) => "); 
		
		switch (sc.nextLine()) {
			case "1":
				school = "대졸이상";
				break;
	
			case "2":
				school = "초대졸";
				break;
				
			case "3":
				school = "고졸";
				break;
				
			case "4":
			default:
				school = "고졸미만";
				break;
		}// end of switch-------------------------
		
		System.out.print("▷휴대폰번호 : ");
		mobile = sc.nextLine();
		
		System.out.print("▷희망직종 : ");
		hopejob = sc.nextLine();
		
		do {
			try {
				System.out.print("▷희망급여 => ");
				hopemoney = Integer.parseInt(sc.nextLine());
				if(hopemoney > 0) {
					break;
				}
				else {  // 희망급여를  0 또는 음수로 입력한 경우이라면
					System.out.println(">> 희망급여는 0보다 커야 합니다.");
					continue;
				}
				
			} catch (NumberFormatException e) {
				System.out.println(">> 희망급여는 정수만 입력가능합니다.!!");
			}
				
		} while (true);
		
		System.out.println("\n==== <변경내용 입력란 끝> ====");
		
		System.out.print("\n>> 위 정보로 변경하시겠습니까?[1.예 / 2.아니오] => "); 

		String yn = sc.nextLine();
		
		if("1".equals(yn)) { 
			updategujikja = new Gujikja(userid, passwd, name, address, mobile, age, gender, school, hopejob, hopemoney);
			commonArr[i] = updategujikja;
			System.out.println(">> 구직자 내용변경 성공!!");
		}
		else {
			System.out.println(">> 구직자 내용변경 취소함!!");
		}
		
	  }// end of if~else-----------------------------	
		
	}// end of updateGujikja(Scanner sc)-----------------------
	
	
	public static void main(String[] args) {
		
		JobApp jobapp = new JobApp();
		Scanner sc = new Scanner(System.in);
		String menuNo = "";
		
		do {
			JobApp.menu();
			
			menuNo = sc.nextLine();
			
			switch (menuNo) {
				case "1":  // 구직자등록 
					jobapp.registerGujikja(sc);
					break;
					
				case "2":  // 회사정보등록
					jobapp.registerCompany(sc);
					break;
				
				case "3":  // 구인등록
					jobapp.registerRecruit(sc);
					break;
	
				case "4":  // 모든 구직자정보 출력 
					jobapp.showAllGujikja();
					break;
				
				case "5":  // 모든 구인정보 출력
					jobapp.showAllRecruit();
					break;
	
				case "6":  // 구직자 ID 검색
					jobapp.showGujikaIdSearch(sc);
					break;
				
				case "7":  // 구인회사 ID 검색
					jobapp.showCompanyIdSearch(sc);
					break;
	
				case "8":  // 특정 업종 구인정보 출력 
					jobapp.showSpecialJobtypeRecruit(sc);
					break;
				
				case "9":  // 특정 조건 구직자정보 출력
					jobapp.showSearchGujikja(sc);
					break;	
					
				case "10":  // 특정 구직자 삭제하기
					jobapp.deleteGujikja(sc);
					break;
					
				case "11":  // 특정 구직자 데이터변경하기
					jobapp.updateGujikja(sc);
					break;		
				
				case "12": // 종료
					break;
					
				default:
					System.out.println(">> 존재하지 않는 메뉴번호 입니다. 다시선택하세요!!\n"); 
					break;
			}// end of switch---------------------
			
			
		} while (!("12".equals(menuNo) ));
		
		System.out.println(">>> 안녕히 가세요~~~");
		System.out.println("종료시각 : " + MyUtil.getNowTime());
        sc.close();
        
	}// end of main()----------------------------------

}
