package my.day9;

import my.util.MyUtil;

public class House {

	/*
	  	1) 속성(property, attribute)
	  		속성은 반드시 클래스명과 "has a" 관계가 성립되어야만 한다.
	 		속성은 맴버변수가 된다.
	 */
	int room; //House has a room int의 기본값은 0
	String address; // House has a addr. String 의 기본값은 null
	Owner owner; // House has a owner. Owner 의 기본값음 null;
	char direction; // House has a direction;
	long price; // House has a long의 기본값은 0;
	String hname;
	int housenum;
	
	public House() {}
	
	public House(int room, String address, Owner owner, char direction, long price) {
		super();
		this.room = room;
		this.address = address;
		this.owner = owner;
		this.direction = direction;
		this.price = price;
	}// endo of House(int room, String address, Owner owner, char direction, long price)------------------------
	
	public House(int room, String address, Owner owner, char direction, long price,String hname,int housenum) {
		super();
		this.room = room;
		this.address = address;
		this.owner = owner;
		this.direction = direction;
		this.price = price;
		this.hname = hname;
		this.housenum =  housenum;
	}// endo of House(int room, String address, Owner owner, char direction, long price)------------------------
	
	
	
	public void showInfo() {
		
		System.out.println("1. 집주소 : " + address);
		System.out.println("2. 매매가 : " + MyUtil.getCommaNumber(price) + "백만원");
		System.out.println("3. 방갯수 : " + room);
		String strDirection = "";
		switch (direction) {
			case 'E':
			case 'e':
				strDirection = "동";
				System.out.println("4. 방향 : " + strDirection);
				break;
			case 'W':
			case 'w':
				strDirection = "서";
				System.out.println("4. 방향 : " + strDirection);
				break;
			case 'S':
			case 's':
				strDirection = "남";
				System.out.println("4. 방향 : " + strDirection);
				break;
			case 'N':
			case 'n':
				strDirection = "북";
				System.out.println("4. 방향 : " + strDirection);
				break;
				
	
			default:
				strDirection = "모름";
				System.out.println("4. 방향 : " + strDirection);
				break;
		}
		System.out.println("5. 집주인 정보 : " + owner.owerInfo());
		System.out.println("\n");
		
	}
	

}
