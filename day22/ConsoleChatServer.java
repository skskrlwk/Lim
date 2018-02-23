/*
     ===== 구현내용 =====
      - 채팅 서버와 클라이언트가 일대일 채팅하는 프로그램
      - 키보드 입력, 모니터(콘솔화면)에 출력 
 */

package network.day1;

import java.io.*;
import java.net.*;

public class ConsoleChatServer implements Runnable {

	ServerSocket serversocket;
	Socket socket;
	private final int PORT = 5555;
	
	boolean isStop = false;
	
	// 생성자
	public ConsoleChatServer() {
		service();
	}// end of 생성자----------------------------
	
	
	public void service() {
		
		BufferedReader keyboardReader = null;
		// 서버자신이 클라이언트쪽으로 입력 내용을 보내기 위해 키보드로 부터 입력받은 내용을 읽어들이는 용도의 스트림.   
		
		PrintWriter printWriter = null; 
		// 서버자신이 키보드로 부터 입력받은 내용을 클라이언트쪽으로 보내기 위한 용도의 스트림. 
		
		System.out.println(">>> ConsoleChatServer 준비중....");
		
		try {
			serversocket = new ServerSocket(PORT);
			// TCP 포트번호 5555 를 사용하는 서버소켓 객체를 생성함.
			// 방화벽에서 TCP 포트번호 5555 를 연결허용 하도록 해야 한다.
			
			socket = serversocket.accept();
			/*
			    서버소켓 객체의  accept() 메소드는
			    클라이언트가 접속할때까지 블럭(대기상태)으로 계속해서 머물고 있다가,
			    클라이언트쪽에서 서버의 해당포트번호(지금은 5555)로 들어오는 시도를 서버쪽에서 인지되면 
			    클라이언트와 서버간에 통신할 수 있는 객체인 소켓객체(통신할수 있는 객체) socket 을 리턴해준다.
			*/
			
			InetAddress inetip = socket.getInetAddress();
			// socket(소켓)에 연결된 클라이언트의 raw IP 주소를 리턴시켜준다.
			
			String ip = inetip.getHostAddress();
			// socket(소켓)에 연결된 클라이언트의 IP 주소를 문자열 형태로 리턴시켜준다.
			
			System.out.println(">>> ["+ip+"]님이 접속하였습니다.");
			
			// === 키보드 입력 스트림 생성
			// (서버측 사용자가 키보드로 부터 입력한 메시지를 읽어들여 클라이언트로 보내기 위해) 
			keyboardReader = new BufferedReader(new InputStreamReader(System.in));
			// 1byte 기반 System.in(키보드입력)을 InputStreamReader 브릿지 스트림을 사용하여 2byte 기반으로 바꾸어 준 후  
			// 필터(보조)스트림인 BufferedReader 를 장착함.
			
			
			// === socket(소켓) 객체를 통해 클라이언트에게 메시지를 보낼 스트림 객체 생성 ===
			printWriter = new PrintWriter(socket.getOutputStream(), true);
			// true 라고 했기에 println()메소드를 사용하면 자동으로 flush() 메소드를 호출한다.
			
			
			// ==== 클라이언트로부터  받은 메시지를 계속 듣는 스레드 생성하여 동작시키기 ====  
			Thread thr = new Thread(this);
			thr.start();
			
			// ==== 서버에서 클라이언트쪽으로 메시지를 보내는 작업
			do {
				// 클라이언트와 연결이 끊어지면
				// 즉, socket 이 닫힌 상태이라면
				if( socket.isClosed() ) {
					System.exit(0);
				}
				else {
					// 클라이언트와 연결이 끊어지지 않고 연결이 되었다면
					// 즉, socket 이 열린 상태이라면
					
					// 서버측 사용자가 키보드로 부터 입력한 내용을 읽어다가
					String myMsg = keyboardReader.readLine();
					
					if(myMsg.equalsIgnoreCase("exit")) {
						// exit 또는 EXIT 또는 eXiT 이라면..종료하려고 한다.
						
						// 클라이언트쪽에서 보내어오는 메시지는 들을 필요가 없다.
						// 즉, 위에서 실행한 스레드를 멈추어야 한다.
						isStop = true;
						
						break; // while 문을 빠져나가므로 채팅이 종료됨.
					}
					
					// 소켓을 통해 클라이언트쪽으로 메시지를 전송한다.
					printWriter.println(myMsg);
				}
				
			} while (true); // end of while---------------------
			
			System.out.println(">>> 채팅서버가 종료됩니다.");
			System.exit(0);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}// end of service()-------------------------
	
	
	
	@Override
	public void run() {
		// 클라이언트에서 보내오는 메시지를 계속 받아서 서버쪽 콘솔에 출력하기
		
		InputStream instream = null;
		// 클라이언트에서 보내온 데이터를 읽어들이기 위한 노드스트림.
		
		BufferedReader bufReader = null;
		// 클라이언트에서 보내온 데이터를 읽어들이기 위한 필터(보조)스트림.
		
		try {
			instream = socket.getInputStream();
			// socket(소켓)을 통해서 클라이언트에서 보내온 데이터를 읽어들이기 위한 노드스트림 생성.
			
			bufReader = new BufferedReader(new InputStreamReader(instream)); 
			// 1byte 기반 InputStream instream 을 InputStreamReader 브릿지 스트림을 사용하여 2byte 기반으로 바꾸어 준 후  
			// 필터(보조)스트림인 BufferedReader 를 장착함.
			
			String clientMsg = "";
			
			while(!isStop) { // 클라이언트와 연결이 이루어진 상태이라면 
				clientMsg = bufReader.readLine();
				// bufReader 을 통해 클라이언트가 보내준 메시지를 한줄씩 읽어온다.
				
				System.out.println(">>> From Client : " + clientMsg);
				// 모니터(콘솔화면)에 출력해준다.
				
			}// end of while--------------------
			
			
		} catch (IOException e) {
			// 클라이언트 측에서 연결을 끊었을 경우 발생함.
			
			System.out.println(">>> 클라이언트가 대화연결을 끊었습니다.");
		} finally {
		
			try {
				 if(socket != null) socket.close();
				 if(serversocket != null) serversocket.close();
				
				 System.exit(0);
			} catch (IOException e) { }
			
		}
		  
	}// end of run()-----------------------------------
	
	
	
	public static void main(String[] args) {

		new ConsoleChatServer();

	}// end of main()------------------------------

	

}
