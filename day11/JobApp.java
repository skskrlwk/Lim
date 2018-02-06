/*
 	*** *** 구인 구직관련 프로그래밍을 만들어보자 *** ===
 		1. 부품(요소) ---> 구직자, 구인자
 		2. 추상화작업
 			1) 구직화 --> 속성(맴버변수), 기능(메소드)
 			2) 구직화 --> 속성(맴버변수), 기능(메소드)
 			3) 구직화 --> 속성(맴버변수), 기능(메소드)
 */

package my.day10;

import java.util.Scanner;

import my.util.MyUtil;

public class JobApp {
	
	Gujikja[] gugikjaArr = new Gujikja[10];
	static int gujikjaCount = 0;
	Company[] companyArr = new Company[10];
	static int companyCount = 0;
	Recruit[] recruitArr = new Recruit[50];
	static int recruitCount = 0;
		
	public static void menu() {
		
		System.out.println(" ==== Menu ====");
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
		System.out.println("11. 특정 구직자 데이터 변경하기");
		System.out.println("12. 종료");
		System.out.println("==============================");
		System.out.print("메뉴번호를 선택하세여 == > ");
		
	}// end of menu--------------------------------------

	
	public boolean userIdDuplicateCheck(String userid) {
		boolean isUse = false;
		int flag = 0;
		
		for(int i=0;i< gujikjaCount; i++) {
			if(gugikjaArr[i] == null)
				continue;
			
			String existUserid = gugikjaArr[i].userid;
			if(existUserid.equals(userid)) {//중복된 아이디 값확인
				flag = 1;
				break;
			}
		}//end of for---------------------------------------
		if(flag == 0) {
			isUse = true;
		}
		return isUse;
	}
	
	public void saveGujikja(Gujikja gujikja) {
		
		if(gujikjaCount >= gugikjaArr.length) {
			System.out.println("정원이 마감되었습니다. ");
		}else {
			int flag = 0;
			
			if(gujikjaCount > 0) {
				for(int i=0; i<gujikjaCount; i++) {
					if(gugikjaArr[i] == null) {
						gugikjaArr[i] = gujikja;
						flag = 1;
						System.out.println(gujikjaCount+1 + "명 등록[마감정원 : " + gugikjaArr.length + "명");
						break;
					}
				}
			}
			if(flag == 0) {
				gugikjaArr[gujikjaCount] = gujikja;
				System.out.println(gujikjaCount+1 + "명 등록[마감정원 : " + gugikjaArr.length + "명");
				gujikjaCount++;
								
			}
			
		}
			
	}// end of saveGujikja(Gujikja gujikja)--------------------------------
	
	public void saveCompany(Company company) {
		
		if(companyCount >= companyArr.length) {
			System.out.println("정원이 마감되었습니다.");
		}else {
			int flag = 0;
			if(companyCount > 0) {
				for(int i = 0; i<companyCount; i++) {
					if(companyArr[i] == null) {
						companyArr[i] = company;
						flag = 1;
						System.out.println(companyCount+1 + "명 등록[마감정원 : " + companyArr.length + "명");
						break;
					}
				}//end of for----------------------
				
			}
			if(flag == 0) {
				companyArr[companyCount] = company;
				System.out.println(companyCount+1 + "명 등록[마감정원 : " + companyArr.length + "명");
				companyCount++;
			}
			
			
		}
	}// end of saveCompany(Company company)--------------------------------
	
	public void saveRecruit(Recruit recruit) {
		
		if(recruit != null) {
			
			if(recruitCount >= recruitArr.length) {
				System.out.println("채용공고 가능한 횟수 50개가 마감되었습니다.");
			}else {
				recruitArr[recruitCount] = recruit;
				System.out.println(companyCount+1 + "개 채용공고 등록[마감정원 : " + recruitArr.length + "명");
				recruitCount++;
					
			}
				
		}
		
	}//end of saveRecruit(Recruit recruit)
	
	public Company getCompany(String comid) {
		
		Company result = null;
		for(int i=0; i < companyCount; i++) {
			String existComid = companyArr[i].comid;
			
			if(existComid.equals(comid)) {
				result = companyArr[i];
				break;
			}
		}
		
		return result;
		
	}// end of getCompany(String comid)---------------------------------------
	
	// 메뉴번호 1. 구직자 등록을 해주는 메소드 생성하기 
	public void registerGujikja(Scanner sc) {
		
		Gujikja gugikja = new Gujikja();
				
		do {
			System.out.print("아이디 => ");
			String userid = sc.nextLine();
			
			boolean inUseridUse = userIdDuplicateCheck(userid); // 아이디 중복 확인 메소드 (중복일경우 false 중복이 아닌경우 true를 리턴해준다)
			if(inUseridUse) { 
				gugikja.userid = userid;
				break;
			}else {
				System.out.println("이미 사용중인 사용자 ID입니다.");	
			}
				
		} while (true);
		
		do {
			System.out.print("암호 => ");
			String passwd = sc.nextLine();
			
			if(MyUtil.passwdCheck(passwd)) {
				gugikja.passwd = passwd;
				break;
			}else {
				System.out.println("패스워드는 7글자 이상의 영문자 숫자 특수문자가 포함되어야 합니다");
			}
			
		} while (true);
		
		
		
		System.out.print("성명 => ");
		gugikja.name = sc.nextLine();
		do {
			try {
				System.out.print("나이 => ");
				int age = Integer.parseInt(sc.nextLine());
				if(age > 0) {
					gugikja.age = age;
					break;
				}else {
					System.out.println("나이는 0보다 커야 합니다.");
					continue;
				}
					
			} catch (NumberFormatException e) {
				System.out.println(">> 나이는 정수만 입력가능합니다.");
			}
			
		} while (true);
		
		System.out.print("성별(1.남 / 2.여) => ");
		gugikja.gender = sc.nextLine().equals("1")?"남":"여";
		
		System.out.print("주소 => ");
		gugikja.address = sc.nextLine();
		
		System.out.println("학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만) => ");
		switch (sc.nextLine()) {
			case "1":
				gugikja.school = "대졸이상";
				break;
			case "2":
				gugikja.school = "초대졸";
				break;
	
			case "3":
				gugikja.school = "고졸";
				break;
	
			default:
				gugikja.school = "고졸미만";
				break;
		}// end of switch
		
		System.out.print("휴대폰 번호 => ");
		gugikja.mobile = sc.nextLine();
		
		System.out.print("희망직종 => ");
		gugikja.hopejob = sc.nextLine();
		
		do {
			try {
				System.out.print("희망연봉 => ");
				int hopemoney = Integer.parseInt(sc.nextLine());
				if(hopemoney > 0) {
					gugikja.hopemoney = hopemoney;
					break;
				}else {
					System.out.println("급여는 0보다 커야 합니다.");
					continue;
				}
					
			} catch (NumberFormatException e) {
				System.out.println(">> 급여는 정수만 입력가능합니다.");
			}
			
		} while (true);
		System.out.println("\n"+gugikja.showGujikja()+"\n");
		System.out.print("\n>>위 정보를 등록 하시겠습니까??[1.예 2.아니요]");
		if(sc.nextLine().equals("1")) {
			saveGujikja(gugikja);
			
		}
		
	}// end of registerGujikja(Scanner sc)-----------------------------
	
	// 메뉴번호2. 회사정보 등록
	public void registerCompany(Scanner sc) {
		
		Company company = new Company();
		
		do {
			System.out.print("회사아이디 => ");
			String userid = sc.nextLine();
			
			boolean inUseridUse = userIdDuplicateCheck(userid); // 아이디 중복 확인 메소드 (중복일경우 false 중복이 아닌경우 true를 리턴해준다)
			if(inUseridUse) { 
				company.comid = userid;
				break;
			}else {
				System.out.println("이미 사용중인 사용자 ID입니다.");	
			}
				
		} while (true);
		
		do {
			System.out.print("암호 => ");
			String passwd = sc.nextLine();
			
			if(MyUtil.passwdCheck(passwd)) {
				company.passwd = passwd;
				break;
			}else {
				System.out.println("패스워드는 7글자 이상의 영문자 숫자 특수문자가 포함되어야 합니다");
			}
			
		} while (true);
		
		System.out.print("회사명 => ");
		company.comname = sc.nextLine();
		
		System.out.print("대표자명 => ");
		company.ceo = sc.nextLine();
		
		do {
			try {
				System.out.print("자본금");
				int seedmoney = Integer.parseInt(sc.nextLine());
				if(seedmoney > 0) {
					company.seedmoney = seedmoney;
					break;
				}else {
					System.out.println("자본금은 정수로만 입력이 가능합니다.");
				}
				
			}catch (NumberFormatException e) {
				System.out.println("자본금은 숫자로만 입력이 가능합니다");
			}
			
		}while(true);
		
		System.out.print("업종 [1.제조 / 2.IT / 3.서비스 / 4.기타 ]");
		String jobtype = sc.nextLine();
		
		switch (jobtype) {
			case "1":
				company.jobtype = "제조";
				break;
			case "2":
				company.jobtype = "IT";
				break;
			case "3":
				company.jobtype = "서비스";
				break;
				
			default:
				company.jobtype = "기타";
				break;
		}
		
		System.out.print("회사 주소 => ");
		company.addr = sc.nextLine();
		
		System.out.print("회사 전화번호 => ");
		company.tel = sc.nextLine();
		
		System.out.println("\n"+company.showCompany()+"\n");
		System.out.print("\n>>위 정보를 등록 하시겠습니까??[1.예 2.아니요]");
		if(sc.nextLine().equals("1")) {
			saveCompany(company);
			
		}
			
		
	}// end of registerCompany(Scanner sc)----------------------------------------
	
	//메뉴 번호3. 구인등록
	public void registerRecruit(Scanner sc) {
		
		// ==== 구인회사 아이디 입력하기 ====
		System.out.print(">> 구인회사 ID 입력 =>");
		String comid = sc.nextLine();
		
		Company company = getCompany(comid);
		
		if(company == null) {
			// 회사회원으로 존재하지 않는다면 회사등록을 하도록 실행.
			System.out.println(">> 기업회원으로 존재하지 않으므로 채용공고가 불가합니다.");
			System.out.println(">> 기업회원 가입으로 이동합니다.\n");
			registerCompany(sc);
		}else {
			// 기업회원으로 존재하는 경우이라면 채용공고가 되도록 한다.
			Recruit recruit = new Recruit();
			
			recruit.company = company;
			
			System.out.print("채용 성별[1.남 / 2.여 / 3.성별무관] => ");
			switch (sc.nextLine()) {
				case "1":
					recruit.gender = "남";
					break;
				case "2":
					recruit.gender = "여";
					break;
	
				default:
					recruit.gender = "성별무관";
					break;
			}// end of switch----------------------------
			do {
				try {
					System.out.print(">> 채용가능한 최소나이를 입력하세요");
					int agemin = Integer.parseInt(sc.nextLine());
					
					System.out.print(">> 채용가능한 최대나이를 입력하세요");
					int agemax = Integer.parseInt(sc.nextLine());
					
					if(agemin*agemax == 0 || agemin<0 || agemax<0) {
						System.out.println("나이는 0보다 커야합니다.!!!");
					}else {
						recruit.agemin = agemin;
						recruit.agemax = agemax;
						break;
					}
					
				}catch (NumberFormatException e) {
					System.out.println("나이는 숫자만 입력이 가능합니다.");
					
				}
				
				
			} while (true);
			
			System.out.print("채용 학력[1.대졸이상 / 2.초대졸 / 3.고졸 / 4.학력무관] => ");
			switch (sc.nextLine()) {
				case "1":
					recruit.school = "대졸이상";
					break;
				case "2":
					recruit.school = "초대졸";
					break;
				case "3":
					recruit.school = "고졸";
					break;
	
				default:
					recruit.school = "학력무관";
					break;
			}// end of switch----------------------------
			
			System.out.println(recruit.showRecruit());
			
			System.out.print("구인등록을 하시겠습니까? [1.Y / 2.N]");
			if(sc.nextLine().equals("1")) {
				saveRecruit(recruit);
			}else {
				System.out.println(">> 채용공고 등록을 취소하였습니다.");
			}
			
		}// end of if~else-----------------------------------
		
		
	}// end of registerRecruit(Scanner sc)------------------------------
	
	
	//메뉴 번호4. 모든 구직자 정보 출력
	public void showAllGujikja() {
		
		if(gujikjaCount == 0) {
			System.out.println("가입된 구직자가 업습니다");	
		}else {
			for(int i=0; i<gujikjaCount; i++) {
				if(gugikjaArr[i] != null)
				System.out.println(gugikjaArr[i].showGujikja());
				System.out.println("\n");;
			}
		}
		
		
		
	}// end of showAllGujikja()------------------------------
	
	//메뉴번호 5. 모든 구인정보 출력
	public void showAllRecruit() {
		if(recruitCount == 0) {
			System.out.println("구인정보가 없습니다");	
		}else {
			for(int i=0; i<recruitCount; i++) {
				if(recruitArr[i] != null)
				System.out.println(recruitArr[i].showRecruit());
				System.out.println("\n");;
			}
		}
		
	}// end of showAllCompany()-------------------------------------
	
	// 메뉴번호 6. 구직자 ID검색
	public void showGujikjaIdSearch(Scanner sc) {
		
		if(gujikjaCount == 0) {
			System.out.println(">> 가입된 구직자가 없으므로 조회가불가합니다.");
		}else {
			int flag = 0;
			System.out.print("검색하실 아이디를 입력해주세요 : ");
			String searchUserid = sc.nextLine();
			for(int i=0; i<gujikjaCount; i++) {
				
				String existUserid = gugikjaArr[i].userid;
				if(existUserid.equals(searchUserid)) {
					flag = 1;
					System.out.println(gugikjaArr[i].showGujikja());
					break;
				}
				
				
			}//end of for--------------------------------
			if(flag == 0) {
				System.out.println("검색하려는 사용자 ID'"+searchUserid+"'는 존재하지 않습니다.");
			}
			
		}
		
		
	}// end of showGujikjaIdSearch(Scanner sc)---------------------------
	
	// 메뉴번호 7. 회사ID검색
	
	public void showCompanyIdSearch(Scanner sc) {
		
		if(companyCount == 0) {
			System.out.println(">> 가입된 회사가 없으므로 조회가불가합니다.");
		}else {
			int flag = 0;
			System.out.print("검색하실 회사명을를 입력해주세요 : ");
			String searchUsername = sc.nextLine();
			for(int i=0; i<companyCount; i++) {
				
				String existUserid = companyArr[i].comid;
				if(existUserid.equals(searchUsername)) {
					flag = 1;
					System.out.println(companyArr[i].showCompany());
					break;
				}
				
				
			}//end of for--------------------------------
			if(flag == 0) {
				System.out.println("검색하려는 사용자 ID'"+searchUsername+"'는 존재하지 않습니다.");
			}
			
		}
		
		
	}// end of showCompanyIdSearch(Scanner sc)--------------------------------------------
	
	// 메뉴번호 8.특정 업종 구인정보 출력
	public void showSpecialJobtypeRecruit(Scanner sc) {
		
		
		System.out.println("찾고자하는 업종을 선택해주세요. [1.제조 / 2.IT / 3.서비스 / 4.기타 ] ");
		String sjob = sc.nextLine();
		
		switch (sjob) {
			case "1":
				if(companyCount == 0) {
					System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
				}else {
					for(int i=0; i<companyCount; i++) {
						if(companyArr[i].jobtype.equals("제조")) {
							System.out.println(companyArr[i].showCompany());
							break;
						}else {
							
						}
					}
					
				}
				
				break;
			case "2":
				if(companyCount == 0) {
					System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
				}else {
					for(int i=0; i<companyCount; i++) {
						if(companyArr[i].jobtype.equals("IT")) {
							System.out.println(companyArr[i].showCompany());
							break;
						}else {
							
						}
					}
					
				}
				
				break;
			case "3":
				if(companyCount == 0) {
					System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
				}else {
					for(int i=0; i<companyCount; i++) {
						if(companyArr[i].jobtype.equals("서비스")) {
							System.out.println(companyArr[i].showCompany());
							break;
						}else {
							System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
						}
					}
					
				}
				
				break;
	
			default:
				if(companyCount == 0) {
					System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
				}else {
					for(int i=0; i<companyCount; i++) {
						if(companyArr[i].jobtype.equals("기타")) {
							System.out.println(companyArr[i].showCompany());
							break;
						}else {
							System.out.println("찾고싶은 업종의 회사 정보가 없습니다.");
						}
					}
					
				}
				
				break;
		}
		
	}// end of showSpecialJobtypeRecruit(Scanner sc)--------------------------------
	
	// 메뉴번호 9. 특정 조건 구직자정보 출력
	public void showSearchGujikja(Scanner sc) {
		int agemin = 0, agemax = 0, hopemoney = 0;
				
		do {
			try {
				System.out.print(" >> 구직자의 최소나이를 입력해주세요 ");
				agemin = Integer.parseInt(sc.nextLine());
				if(agemin <= 0) {
					System.out.println("0이상의 나이만 입력 가능합니다");
				}else {
					break;
				}
				
				
			}catch (NumberFormatException e) {
				System.out.println("나이는 숫자만 입력이 가능합니다.");
			}
		} while (true);
		
		do {
			try {
				System.out.print(" >> 구직자의 최대나이를 입력해주세요 ");
				agemax = Integer.parseInt(sc.nextLine());
				if(agemax <= 0) {
					System.out.println("0이상의 나이만 입력 가능합니다");
				}else {
					break;
				}
				
				
			}catch (NumberFormatException e) {
				System.out.println("나이는 숫자만 입력이 가능합니다.");
			}
		} while (true);
		
		
		
		System.out.print(" >> 구직자의 성별을 입력해주세요  [1.남자 / 2.여자 / 3.성별무관]");
		String gender = sc.nextLine();
		switch (gender) {
			case "1":
				gender = "남";
				break;
			case "2":
				gender = "여";
				break;
	
			default:
				gender = "성별무관";
				break;
		}
		
		System.out.print(" >> 구직자의 학력을 입력해주세요  [1.대졸이상 / 2.초대졸 / 3.고졸 / 4.학력무관]");
		String school = sc.nextLine();
		switch (school) {
			case "1":
				school = "대졸이상";
				break;
			case "2":
				school = "초대졸";
				break;
			case "3":
				school = "고졸";
				break;
	
			default:
				school = "학력무관";
				break;
		}
		
		do {
			try {
				System.out.print(">>최소 희망급여를 입력해주세요");
				hopemoney = Integer.parseInt(sc.nextLine());
				if(hopemoney<0) {
					System.out.println("희망급여는 0이상만 가능합니다");
				}else {
					break;
				}
			} catch (NumberFormatException e) {
				System.out.println("희망급여는 숫자만 입력이 가능합니다");
			}
			
		} while (true);
		
		int flag = 0;
		
		if(gujikjaCount == 0) {
			System.out.println("등록된 구직자가 없습니다.");
		}else {
			for(int i=0; i<gujikjaCount; i++) {
				
				if((agemin<=gugikjaArr[i].age && gugikjaArr[i].age<=agemax) && hopemoney<=gugikjaArr[i].hopemoney ) {
						
					if(school.equals(gugikjaArr[i].school) && !(school.equals("학력무관"))) { 
						
						if((gender.equals(gugikjaArr[i].gender)) && !(gender.equals("성별무관")) ) {
							flag = 1;
							System.out.println(gugikjaArr[i].showGujikja());
							
						}else if(gender.equals("성별무관")) {
							flag = 1;
							System.out.println(gugikjaArr[i].showGujikja());
							
						}
					}else if(school.equals("학력무관")) {
						
						if((gender.equals(gugikjaArr[i].gender)) && !(gender.equals("성별무관")) ) {
							flag = 1;
							System.out.println(gugikjaArr[i].showGujikja());
							
						}else if(gender.equals("성별무관")) {
							flag = 1;
							System.out.println(gugikjaArr[i].showGujikja());
							
						}
					}
						
				}
			}//end of for---------------------------------
			if(flag == 0)
				System.out.println("요청하신 조건의 구직자가 없습니다.");
		}
		
		

	}// end of showSearchGujikja(Scanner sc)------------------------------------
	
	// 메뉴번호 10. 특정 구직자 삭제해주는 메소드
	public void deleteGujikja(Scanner sc) {
		System.out.println(">>삭제하려는 사용자 ID값을 입력해주세요");
		String userid = sc.nextLine();
		if(gujikjaCount == 0) {
			System.out.println(">> 가입된 구직자가 없으므로 삭제불가합니다.");
		}else {
			int flag = 0;
			for(int i = 0; i<gujikjaCount; i++) {
				if(gugikjaArr[i].userid.equals(userid)) {
					flag = 1;
					gugikjaArr[i] = null;
					
					break;
				}
					
			}//end of for-----------------------
			if(flag == 1) {
				System.out.println(">>>> 사용자 ID '"+userid+"' 삭제성공.");
				
			}else {
				System.out.println(">>> 사용자 ID "+ userid + "은 존재하지 않음으로 삭제하지 못했습니다");
			}
				
		}
		
		
		
	}// end of deleteGujikja(Scanner sc)------------------------------

	
	
	// 메뉴번호 11. 특정 구직자 데이터 변경해주는 메소드 
	public void updateGujikja(Scanner sc) {
		
		Gujikja updategujikja = null;
		
		System.out.print(">> 변경하려는 구직자 ID : => ");
		String userid = sc.nextLine();
		int i = 0, flag = 0;
		
		for(; i<gujikjaCount; i++) {
			if(gugikjaArr[i] == null)
				continue;
			if(gugikjaArr[i].userid.equals(userid)) {
				flag = 1;
				break;
			}
			
		}// end of for--------------------------
		if(flag == 0)
			System.out.println(">> 변경하려는 ID "+ userid +"가 등록되지 않은 ID입니다.");
		else {
			gugikjaArr[i].showGujikja();
			String passwd = "" , name = "", gender = "", address = "", school = "", mobile = "", hopejob = "";
			int age = 0, hopemoney = 0;
					System.out.println("\n ========= 변경내용을 입력 ==========");
			do {
				System.out.print("암호 => ");
				passwd = sc.nextLine();
				
				if(MyUtil.passwdCheck(passwd)) {
					break;
				}else {
					System.out.println("패스워드는 7글자 이상의 영문자 숫자 특수문자가 포함되어야 합니다");
				}
				
			} while (true);
			
			System.out.print("성명 => ");
			name = sc.nextLine();
			do {
				try {
					System.out.print("나이 => ");
					age = Integer.parseInt(sc.nextLine());
					if(age > 0) {
						break;
					}else {
						System.out.println("나이는 0보다 커야 합니다.");
						continue;
					}
						
				} catch (NumberFormatException e) {
					System.out.println(">> 나이는 정수만 입력가능합니다.");
				}
				
			} while (true);
			
			System.out.print("성별(1.남 / 2.여) => ");
			gender = sc.nextLine().equals("1")?"남":"여";
			
			System.out.print("주소 => ");
			address = sc.nextLine();
			
			System.out.println("학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만) => ");
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
		
				default:
					school = "고졸미만";
					break;
			}// end of switch
			
			System.out.print("휴대폰 번호 => ");
			mobile = sc.nextLine();
			
			System.out.print("희망직종 => ");
			hopejob = sc.nextLine();
			
			do {
				try {
					System.out.println("희망연봉 => ");
					hopemoney = Integer.parseInt(sc.nextLine());
					if(hopemoney > 0) {
						break;
					}else {
						System.out.println("급여는 0보다 커야 합니다.");
						continue;
					}
						
				} catch (NumberFormatException e) {
					System.out.println(">> 급여는 정수만 입력가능합니다.");
				}
				
			} while (true);
			
			System.out.println("\n ==== <변경내용 입력란 끝> ====");
			
			System.out.print("\n>>위 정보로 변경 하시겠습니까??[1.예 2.아니요]");
			String yn = sc.nextLine();
			if(yn.equals("1")) {
			
				updategujikja = new Gujikja(userid, passwd, name, age, gender, address, school, mobile, hopejob, hopemoney);
				gugikjaArr[i] = updategujikja;
				System.out.println(">> 구직자 내용변경 성공!!");
				
			}else {
				System.out.println(">> 구직자 내용변경 취소함");
			}
		
		}// end of if ~ else--------------------------------------
		
		
	}// end of updateGujikja(Scanner sc)--------------------------------
	

	public static void main(String[] args) {
		
		String menuNo = "";
		Scanner sc = new Scanner(System.in);
		JobApp jobapp = new JobApp();
		do {
			JobApp.menu();
			
			menuNo = sc.nextLine();
			
			switch (menuNo) {
				case "1": //구직자 등록
					jobapp.registerGujikja(sc);
					break;
				case "2": //회사정보등록
					jobapp.registerCompany(sc);
					break;
				case "3": //구인등록
					jobapp.registerRecruit(sc);
					break;
				case "4": // 모든 구직자정보 출력
					jobapp.showAllGujikja();
					break;
				case "5": // 모든 구인정보 출력
					jobapp.showAllRecruit();
					break;
				case "6": // 구직자 ID 검색
					jobapp.showGujikjaIdSearch(sc);
					break;
				case "7": // 구인회사 ID 검색
					jobapp.showCompanyIdSearch(sc);
					break;
				case "8": // 특정 업종 구인정보 출력
					jobapp.showSpecialJobtypeRecruit(sc);
					break;
				case "9": // 특정 조건 구직자 정보 출력
					jobapp.showSearchGujikja(sc);
					break;
				case "10": // 특정 구직자 삭제하기
					jobapp.deleteGujikja(sc);
					break;
				case "11": // 특정 구직자 데이터변경하기
					jobapp.updateGujikja(sc);
					break;				
					
	
				default:
					System.out.println("존재하지 않는 메뉴번호 입니다. 다시 선택하세요!!!");
					break;
			}// end of switch---------------------------------
			
		}while(!(menuNo.equals("12")));

		System.out.println(">>> 안녕히 가세요 \n" + MyUtil.getNowTime());
		sc.close();
	}// end of main------------------------------------------

}
