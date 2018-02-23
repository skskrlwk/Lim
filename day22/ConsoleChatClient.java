/*
     ===== 구현내용 =====
      - 채팅 서버와 클라이언트가 일대일 채팅하는 프로그램
      - 키보드 입력, 모니터(콘솔화면)에 출력 
 */

package network.day1;

import java.io.*;
import java.net.*;
import java.util.Scanner;

public class ConsoleChatClient implements Runnable {

	Socket socket;
	private final int PORT = 5555;
	
	boolean isStop = false;
	
	// 생성자
	public ConsoleChatClient(String serverIP) {
		service(serverIP);
	}// end of 생성자----------------------------
	
	
	public void service(String serverIP) {
		
		try {
			// === Socket 객체생성 ===
			socket = new Socket(serverIP, PORT);
			System.out.println(">>> 서버["+serverIP+"]와 연결됨!!"); 
			
			// === 키보드 입력 스트림 생성
			// (클라이언트측 사용자가 키보드로 부터 입력한 메시지를 읽어들여 서버로 보내기 위해) 
			BufferedReader keyboardReader = new BufferedReader(new InputStreamReader(System.in));
			// 1byte 기반 System.in(키보드입력)을 InputStreamReader 브릿지 스트림을 사용하여 2byte 기반으로 바꾸어 준 후  
			// 필터(보조)스트림인 BufferedReader 를 장착함.
						
			// === socket(소켓) 객체를 통해 서버에게 메시지를 보낼 스트림 객체 생성 ===
			PrintWriter printWriter = new PrintWriter(socket.getOutputStream(), true);
			// true 라고 했기에 println()메소드를 사용하면 자동으로 flush() 메소드를 호출한다.
			
			
			// ==== 서버로부터  받은 메시지를 계속 듣는 스레드 생성하여 동작시키기 ====  
			Thread thr = new Thread(this);
			thr.start();
			
			// ==== 클라이언트에서 서버쪽으로 메시지를 보내는 작업
			do {
				// 서버와 연결이 끊어지면
				// 즉, socket 이 닫힌 상태이라면
				if( socket.isClosed() ) {
					System.exit(0);
				}
				else {
					// 서버와 연결이 끊어지지 않고 연결이 되었다면
					// 즉, socket 이 열린 상태이라면
					
					// 클라이언트측 사용자가 키보드로 부터 입력한 내용을 읽어다가
					String myMsg = keyboardReader.readLine();
					
					if(myMsg.equalsIgnoreCase("exit")) {
						// exit 또는 EXIT 또는 eXiT 이라면..종료하려고 한다.
						
						// 서버쪽에서 보내어오는 메시지는 들을 필요가 없다.
						// 즉, 위에서 실행한 스레드를 멈추어야 한다.
						isStop = true;
						
						break; // while 문을 빠져나가므로 채팅이 종료됨.
					}
					
					// 소켓을 통해 서버쪽으로 메시지를 전송한다.
					printWriter.println(myMsg);
				}
				
			} while (true); // end of while---------------------
			
			System.out.println(">>> 채팅클라이언트가 종료됩니다.");
			System.exit(0);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}// end of service(String serverIP)-------------------------
	
	
	@Override
	public void run() {
		// 서버에서 보내오는 메시지를 계속 받아서 클라이언트쪽 콘솔에 출력하기
		
		InputStream instream = null;
		// 서버에서 보내온 데이터를 읽어들이기 위한 노드스트림.
		
		BufferedReader bufReader = null;
		// 서버에서 보내온 데이터를 읽어들이기 위한 필터(보조)스트림.
		
		try {
			instream = socket.getInputStream();
			// socket(소켓)을 통해서 서버에서 보내온 데이터를 읽어들이기 위한 노드스트림 생성.
			
			bufReader = new BufferedReader(new InputStreamReader(instream)); 
			// 1byte 기반 InputStream instream 을 InputStreamReader 브릿지 스트림을 사용하여 2byte 기반으로 바꾸어 준 후  
			// 필터(보조)스트림인 BufferedReader 를 장착함.
			
			String serverMsg = "";
			
			while(!isStop) { // 서버와 연결이 이루어진 상태이라면 
				serverMsg = bufReader.readLine();
				// bufReader 을 통해 서버가 보내준 메시지를 한줄씩 읽어온다.
				
				System.out.println(">>> From Server : " + serverMsg);
				// 모니터(콘솔화면)에 출력해준다.
				
			}// end of while--------------------
			
			
		} catch (IOException e) {
			// 서버 측에서 연결을 끊었을 경우 발생함.
			
			System.out.println(">>> 서버가 대화연결을 끊었습니다.");
		} finally {
		
			try {
				 if(socket != null) socket.close();
				 				
				 System.exit(0);
			} catch (IOException e) { }
			
		}	
		
	}// end of run()---------------------------------
	
	
	
	public static void main(String[] args) {
	
		Scanner sc = new Scanner(System.in);
		
		System.out.print("▷ 채팅서버 IP 주소 입력 => ");
		
		String serverIP = sc.next();
		
		new ConsoleChatClient(serverIP);
		
		sc.close();
	}// end of main()------------------------------

	

}
