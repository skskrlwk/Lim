package servletTest.chap2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPersonServlet1 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -975723997007235472L;

	/*
	  	Servlet 은 웹서비스 기능을 해주는 자바의 클래스를 말하는데
	  	Servlet 이 되기 위한 전제조건은
	  	javax.servlet.http.HttpServlet 클래스를 부모클래스로하여
	  	상속을 받아야만 한다.
	  	
	  	웹클라이언트의 요청 방식이 GET 방식으로 요청을 해오면 
       	  doGet() 메소드로 응답을 해주도록 코딩을 해야 하고,
       	웹클라이언트의 요청 방식이 POST 방식으로 요청을 해오면 
          doPost() 메소드로 응답을 해주도록 코딩을 해주어야 한다.
       	그러므로 반드시 doGet() 메소드와 doPost() 메소드를 
       	 Overriding(재정의)를 해주어야 한다.
       	 
       	doGet()메소드와 doPost()메소드의 
       	첫번째 파라미터는 HttpServletRequest 타입이고,
       	두번째 파라미터는 HttpServletResponse 타입이다.
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException{
		
		/* 첫번쟤 파라미터인 HttpServletRequest request은 
		       웹브라우저에서 사용자가 요청한 내용(데이터)을 받아주는 용도로 쓰인다.
		       
		       두번째 파라미터인 HttpServletResponse response은
		       첫번쟤 파라미터인 HttpServletRequest request가 받아와서
		       처리한 최종 결과물을 웹브라우저 사용자에게 보여주기 위한 용도로 사용한다.
		 */
		String name = request.getParameter("name");
		String color= request.getParameter("color");
		String[] foodArr = request.getParameterValues("food");
		String animal = request.getParameter("animal");
		
		/*System.out.println("name : " + name );
		System.out.println("color : " + color);
		if(foodArr.length > 0) {
			System.out.print("food : ");
			for(String food: foodArr) {
				System.out.print(" " + food + " ");
			}
			
		}
		System.out.println("animal : " + animal);*/
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>개인 취향 테스트 결과화면</title></head>");
		out.println("<body>");
		out.println("<h2>개인 취향 테스트 결과(GET)</h2>");
		out.printf("<span style='color:blue; font-weight: bold;'>%s</span>님의 개인취향은 <br/><br/>",name);
		out.printf("%s색을 좋아하고, %s 동물을 좋아합니다. <br/><br/>", color, animal);
		
		if(foodArr != null) {
			out.print("좋아하는 음식은 ");
			
			for(int i=0; i<foodArr.length; i++) {
				if(i==0) {
					out.printf("%s", foodArr[i]);
					
				}else {
					out.printf(", %s", foodArr[i]);
				}
			}// end of for------------------------------
			out.println("입니다.");
			
		}else {
			out.println("좋아하는 음식은 없습니다.");
		}
				
		out.println("</body>");
		out.println("</html>");
		
		
	}// end of doGet(request, response)------------------------------------------
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		
		/*
		  	POST 방식으로 넘겨온 데이터를 처리해주는 메소드가 doPost(request, response)인데
		  	넘겨받은 데이터가 한글일 경우 아래와 같이 해줘야만 안깨지고 잘나온다.
		  	중요한 것은 request.getParameter("name"); 이러한 명령보다 먼저 기술해야 한다.
		 */
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String color= request.getParameter("color");
		String[] foodArr = request.getParameterValues("food");
		String animal = request.getParameter("animal");
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>개인 취향 테스트 결과화면</title></head>");
		out.println("<body>");
		out.println("<h2>개인 취향 테스트 결과(POST)</h2>");
		out.printf("<span style='color:blue; font-weight: bold;'>%s</span>님의 개인취향은 <br/><br/>",name);
		out.printf("%s색을 좋아하고, %s 동물을 좋아합니다. <br/><br/>", color, animal);
		
		if(foodArr != null) {
			out.print("좋아하는 음식은 ");
			
			for(int i=0; i<foodArr.length; i++) {
				if(i==0) {
					out.printf("%s", foodArr[i]);
					
				}else {
					out.printf(", %s", foodArr[i]);
				}
			}// end of for------------------------------
			out.println("입니다.");
			
		}else {
			out.println("좋아하는 음식은 없습니다.");
		}

		out.println("</body>");
		out.println("</html>");
		
	}// end of doPost(request, response)------------------------------------------
	
	
}
