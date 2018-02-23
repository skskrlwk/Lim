/*
  	==== TCP 통신방식을 이용한 예제 ====
  	 - 서버단 (TCP 통신에서 연결을 받아주는 쪽)  ==> ServerSocket 및 Socket 이 필요함. 
  	 - 클라이언트단(TCP 통신에서 연결을 하는 쪽) ==> Socket 만 필요함.
 */



package network.day1;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class MyNetServer {

	public static void main(String[] args) throws IOException{
		
		// ServerSocket 객체(클라이언트의 연결을 받아주는 것)를 생성한다.
		// ServerSocket 객체를 생성할때는 반드시 port 번호가 필요하다.
		/*
			TCP port 번호는 1 ~ 65535 까지 있는데 1 ~ 1023 까지는 이미
			시스템 내부적으로 사용되는 포트이므로 사용자가 임의로 설정하는 port 번호는 
			1024 이후로 부터 설정해야한다.
		*/
		
		ServerSocket serversocket = new ServerSocket(7777);
		// TCP 포트번호 7777을 사용하는 서버소켓 객체를 생성함.
		
		System.out.println(">>> 클라이언트 연결을 기다림...");
		
		while(true) {
			
			Socket socket = serversocket.accept();
			/*
			  	서버소켓 객체의 accept() 메소드는
			  	클라이언트가 접속할떄까지 블럭(대기상태)으로 계속해서 머물고 있다가,
			  	클라이언트쪽에서 서버의 해당포트번호 (지금은7777)로 들어오는 시도를 서버쪽에서 인지되면
			  	클라이언트와 서버간에 통신할 수 있는 객체인 소켓객체(통신할 수 있는 객체) socket 을 리턴해준다.
			 */
			System.out.println(">>> *** 클라이언트가 접속해옴 *** <<<");
			
			InetAddress client_ip_raw = socket.getInetAddress();
			// 접속한 클라이언트의 IP 주소를 알아와야 한다.
			// 이것을 해주는 메소드가 socket.getInetAddress() 이다.
			// 그런데 리턴되어지는 값은 /192.168.50.5 와 같이 되어진다.
			// /가 붙은 IP를  raw IP address 라고 부른다.
			
			String client_ip = client_ip_raw.getHostAddress(); // raw IP address에서 /를 뺴준 주소값.
			
			System.out.println("클라이언트의 IP Address [client_ip_raw] : " + client_ip_raw);
			System.out.println("클라이언트의 IP Address [client_ip] : " + client_ip);
			
			System.out.println("\n\n");
			
			/*
			  	서버와 클라이언트간에 데이터를 서로 주고 받는 것은 스트림 객체를 통해서 이루어지므로
			  	먼저 소켓객체를 통해 입.출력 스트림 객체를 생성해야 한다.
			  	
			 */
			
			OutputStream outstream = socket.getOutputStream();
			// 1byte 기반 기본 출력 스트림객체를 생성함.
			
			DataOutputStream doutstream = new DataOutputStream(outstream);
			// 필터스트림(보조스트림) 장착.
			
			String msg = "어서오세요~~~ " + client_ip + "님!!";
			doutstream.writeUTF(msg);
			// 문자열 msg를 UTF-8 형태로 인코딩(== msg를 UTF-8 타입으로 변경)하여 
			// 그 내용물을 데이터 출력 스트림(DataOutputStream)에 기록한다.
			doutstream.flush();
			// 데이터 출력 스트림에 기록된 내용을 내보내는 작업.
			
			InputStream instream = socket.getInputStream();
			DataInputStream dinstream = new DataInputStream(instream);
			String clientMsg = dinstream.readUTF(dinstream);
			System.out.println(clientMsg);
			if(doutstream != null)
				doutstream.close();
			if(outstream != null)
				outstream.close();
			if(dinstream != null)
				dinstream.close();
			if(instream != null)
				instream.close();
			
			
			
		}// end of while----------------------------------
		
			
		
	}// end of main()-----------------------------------

}
