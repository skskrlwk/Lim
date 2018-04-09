package servletTest.chap2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPersonServlet3 extends HttpServlet {

	private static final long serialVersionUID = 8568774659621592335L;
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
	
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
		
		
		
	}
	
}
