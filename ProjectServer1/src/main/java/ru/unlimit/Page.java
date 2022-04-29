package ru.unlimit;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.classes.ConnectBase;
import ru.classes.GetCookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class Page
 */
public class Page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//кодировка
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		//подключение jsp
		String path = "/JspFiles/Page.jsp";
        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(path);
        requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
//время
		Date date1 = new Date();
		SimpleDateFormat formatForDateNow = new SimpleDateFormat("dd.MM.yyyy");
		
		PrintWriter pw = response.getWriter();
		Connection connect=ConnectBase.GetConnection();
		Statement statement =ConnectBase.GetStatementBase(connect);
		ResultSet result = null;
        try {
        	
        	statement.execute("INSERT INTO 'Comments' ('Notes_id','comment','name','date')VALUES ( "
        			+ "'"+request.getParameter("id")+"', "
        			+"'"+request.getParameter("comment")+"', "
        			+"'"+GetCookie.GetCookie(request, "name")+"', "
        			+"'"+formatForDateNow.format(date1).toString()+"' "
        			+");");
    			
        			
    			statement.close();
    			connect.close();
        	}
        catch (SQLException throwables) 
        {
			throwables.printStackTrace();
        }
        response.setIntHeader("Refresh", 0);
		}

	}


