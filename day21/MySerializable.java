
package io.day3;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class MySerializable {
	
	// == 직렬화(객체를 파일로 저장하기) ==
	public void objectToFileSave(Object obj,String filename){
		
		try {
			FileOutputStream fost = new FileOutputStream(filename, false);
			BufferedOutputStream bost = new BufferedOutputStream(fost, 1024);
			// 객체를 파일에 저장하는 스트림
			ObjectOutputStream oost = new ObjectOutputStream(bost);
			
			oost.writeObject(obj); // 객체를 파일에 저장시켜주는  메소드
			
			oost.close();
			bost.close();
			fost.close();
		} catch (FileNotFoundException e) {
			System.out.println(filename + "파일명이 없습니다.");
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		}
	}
	
	// == 역직렬화(파일에 저장된 객체를 불러서 객체로 복구로시켜주는 것)
	public Object getObjectfromFile(String filename) {
		Object result = null;
		
		try {
			
			FileInputStream fist = new FileInputStream(filename);
			BufferedInputStream bist = new BufferedInputStream(fist, 1024);
			
			// 파일에 저장된 객체정보를 읽어드리는 스트림
			ObjectInputStream oist = new ObjectInputStream(bist);
			Object obj = oist.readObject(); // 파일속에 저장된 객체정보를 읽어서 객체로 만들어주는 메소드 호출
			
			result = obj;
			oist.close();
			bist.close();
			fist.close();
			
		} catch (FileNotFoundException e) {
			System.out.println(filename +"파일이 없습니다");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}


}
