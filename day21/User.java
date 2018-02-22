/*
		
		
		



 */


package io.day3;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4228317543328623989L;
	private String name;
	private int age;
	private String address;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User() {}
	
	public User(String name, int age, String address) {
		this.name = name;
		this.age = age;
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "성명: " + name + "  나이: " + age + "세  주소: " +address;
	}
	
	
}
