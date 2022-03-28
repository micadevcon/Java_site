package ru.unlimit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.classes.*;
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Registration() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{			
		//кодировка
			request.setCharacterEncoding("Cp1251");
			response.setCharacterEncoding("Cp1251");
				
		
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		pw.println("<html>");

		
		//Подключение БД
//		Connection connect=ConnectBase.GetConnection();
//		Statement statement =ConnectBase.GetStatementBase(connect);
//		ResultSet result = null;
//		//Выолнение запроса
//        try {
//        	result = statement.executeQuery("select * from Autorization;");
//    			while (result.next())
//              {
//    			pw.println("Данные:\n");
//    				for(int i=1;i<10;i++)
//                  pw.println(result.getString(i)+"\n");
//              }
//    			statement.close();
//    			connect.close();
//        	}
//        catch (SQLException throwables) 
//        {
//			throwables.printStackTrace();
//        }
//      pw.println("Данныеxxxxxx:\n"+user);
		
        
        if(session.getAttribute("current_name") != null)
        {
        	
        	pw.println("Регистрация уже завершена ");
        	pw.println("</html>");
        }
        else {
        	
       
       
        pw.println("<form action=\"\" method=\"post\">");
        
        pw.println("<div> почта: </div>");
        pw.println("<input type=\"text\" name=\"Email\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> пароль: </div>");
        pw.println("<input type=\"text\" name=\"Password\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Имя: </div>");
        pw.println("<input type=\"text\" name=\"Name\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Фамилия: </div>");
        pw.println("<input type=\"text\" name=\"Fname\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Отчество: </div>");
        pw.println("<input type=\"text\" name=\"Oname\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Пол: </div>");
        pw.println("<input type=\"text\" name=\"Gender\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Организация: </div>");
        pw.println("<input type=\"text\" name=\"Organization\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Номер телефона: </div>");
        pw.println("<input type=\"text\" name=\"Number\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Страна: </div>");
        pw.println("<input type=\"text\" name=\"Country\" value=\"\"\n" + "size=\"30\"/>");
        
        pw.println("<div> Город: </div>");
        pw.println("<input type=\"text\" name=\"Town\" value=\"\"\n" + "size=\"30\"/>");
        pw.println(" <button type=\"submit\">Send your message</button>");
        pw.println("</form>");
    pw.println("</html>");
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");

		PrintWriter pw = response.getWriter();
		pw.println("<html>");
		Connection connect=ConnectBase.GetConnection();
		Statement statement =ConnectBase.GetStatementBase(connect);
		ResultSet result = null;
        try {
        	
        	
        	statement.execute("INSERT INTO 'Autorization' ('email','пароль','имя','фамилия','отчество',"
        			+ "'пол','организация','номер_телефона','страна','город')"
        			+ "VALUES ( '"+request.getParameter("Email")+"', "
        			+"'"+request.getParameter("Password")+"', "
        			+"'"+request.getParameter("Name")+"', "
        			+"'"+request.getParameter("Fname")+"', "
        			+"'"+request.getParameter("Oname")+"', "        			
        			+"'"+request.getParameter("Gender")+"', "
        			+"'"+request.getParameter("Organization")+"', "        					
        			+"'"+request.getParameter("Number")+"', "
        			+"'"+request.getParameter("Country")+"', "
        			+"'"+request.getParameter("Town")+"' "		
        			+");");
    			
        			
    			statement.close();
    			connect.close();
        	}
        catch (SQLException throwables) 
        {
			throwables.printStackTrace();
        }
        pw.println("Данные занесены!");
        pw.println(request.getParameter("Name"));
        pw.println("</html>");
		}

}
