package ru.unlimit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.classes.ConnectBase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Autorization extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Autorization() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//кодировка
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
			
		PrintWriter pw = response.getWriter();
		pw.println("<html>");
		
		pw.println("<form action=\"\" method=\"post\">");
		
		pw.println("<div> почта: </div>");
	    pw.println("<input type=\"text\" name=\"Email\" value=\"\"\n" + "size=\"30\"/>");
        
	    pw.println("<div> пароль: </div>");
        pw.println("<input type=\"text\" name=\"Password\" value=\"\"\n" + "size=\"30\"/>");
       
        pw.println(" <button type=\"submit\">Send your message</button>");
        pw.println("</form>");
        pw.println("</html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//кодировка
				request.setCharacterEncoding("Cp1251");
				response.setCharacterEncoding("Cp1251");
				PrintWriter pw = response.getWriter();
				pw.println("<html>");
				Connection connect=ConnectBase.GetConnection();
				Statement statement =ConnectBase.GetStatementBase(connect);
				ResultSet result = null;
				 try {
			        	result = statement.executeQuery("select имя from Autorization where "
			        			+ "email= '"+ request.getParameter("Email")+"' and "
			        			+ "пароль= '"+ request.getParameter("Password")
			        			+ "' ;");
			        
			        	if (result.next())
			        	{ 
			        		//за проверку
			        		HttpSession session = request.getSession();
			        		session.setAttribute("current_name",(int) 1);
			        		session.setMaxInactiveInterval(-1);
			        		// за выдачу имени
			        		Cookie cookie = new Cookie("name",result.getString(1));
				    			pw.println("Добрый день:\n");
				    			cookie.setMaxAge(60);
				    			response.addCookie(cookie);
				                pw.println(result.getString(1)+"\n");
				           
				    			statement.close();
				    			connect.close();
				        }
			        	else
			        		pw.println("Неверные данные\n");
			        	}
			    			
			        catch (SQLException throwables) 
			        {
						throwables.printStackTrace();
			        }
	}

}
