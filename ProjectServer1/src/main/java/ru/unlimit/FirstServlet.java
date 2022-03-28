package ru.unlimit;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
	    pw.println("<html>");
	    pw.println("hello");
	        pw.println("<form action=\"\" method=\"post\">");
	        pw.println("<div> login: </div>");
	        pw.println("<input type=\"text\" name=\"login\" value=\"\"\n" + "size=\"30\"/>");
	        pw.println("<div> password: </div>");
	        pw.println("<input type=\"text\" name=\"password\" value=\"\"\n" + "size=\"30\"/>");
	        pw.println(" <button type=\"submit\">Send your message</button>");
	        pw.println("<form>");
	    pw.println("</html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter(); 
		pw.println("<html>");
	        pw.println("<head>");
	        pw.println("<title> MyServlet</title>");
	        pw.println("</head>");
	        pw.println("<body>");
	        pw.println("<h1>Reservation</h1>");
	        pw.println(request.getParameter("Name") + "'s You has been reserved.");
	        pw.println("<br>"+ request.getParameter("age") + "-age.");
	        pw.println("</body>");
	        pw.println("</html>");
		//doGet(request, response);
	}

}
