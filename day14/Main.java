package my.day15;

public class Main {

	public static void main(String[] args) {
	
		AbstractAnimal[]  animalArr = new AbstractAnimal[3];
		
		Dog dog = new Dog();
		dog.name ="뽀삐";
		dog.birthday = "2013-02-03";
		dog.setLevel(11);
		dog.setWeight(7);
		
		Cat cat = new Cat();
		cat.name = "톰";
		cat.birthday = "2015-10-11";
		cat.setLevel(7);
		cat.setColor("검정");
		
		Duck duck = new Duck();
		duck.name = "도널드";
		duck.birthday ="2017-10-11";
		duck.setLevel(5);
		duck.setPrice(5000);
	  
		animalArr[0] = dog;
		animalArr[1] = cat;
		animalArr[2] = duck;
				
		System.out.println("\n====================================\n");
				
		for(AbstractAnimal ani : animalArr) {
			ani.crySound();
			ani.sleep();
			System.out.println("나이 : " + ani.getAge() + "살");
			System.out.println(ani.run());
			System.out.println("등급 : " + ani.grade(ani.getLevel()));
			ani.showInfo();
			System.out.println("\n");
		}
		System.out.println("\n==================================\n");
		
		// !!!!!!!!!!!!!!인터페이스는 객체를 담을 수 있는 저장소 역할을 한다!!!!!!!!!!!!!!!!!!!!!.
		InterAnimal[] interanimal = new InterAnimal[3];
		
		Dog dog2 = new Dog();
		dog.name ="뽀삐";
		dog.birthday = "2013-02-03";
		dog.setLevel(11);
		dog.setWeight(7);
		
		Cat cat2 = new Cat();
		cat.name = "톰";
		cat.birthday = "2015-10-11";
		cat.setLevel(7);
		cat.setColor("검정");
		
		Duck duck2 = new Duck();
		duck.name = "도널드";
		duck.birthday ="2017-10-11";
		duck.setLevel(5);
		duck.setPrice(5000);
	  
		interanimal[0] = dog2;
		interanimal[1] = cat2;
		interanimal[2] = duck2;
		
		for(InterAnimal interani : interanimal) {
			interani.crySound();
			interani.sleep();
			System.out.println("나이 : " + interani.getAge() + "살");
			System.out.println(interani.run());
			System.out.println("등급 : " + interani.grade(((AbstractAnimal)interani).getLevel()) );
			System.out.println("");
		}
		System.out.println("\n================================================\n");
		
		for(int i=0; i<interanimal.length; i++) {
			interanimal[i].crySound();
			interanimal[i].sleep();
			System.out.println("나이 : " + interanimal[i].getAge() + "살");
			System.out.println(interanimal[i].run());
			System.out.println("등급 : " + interanimal[i].grade(((AbstractAnimal)interanimal[i]).getLevel()) );
			System.out.println("");
		}
		
	}

}
