<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.SQLException, jakarta.servlet.http.Cookie , ru.classes.*, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<title>Личный кабинет</title>
 <link rel="stylesheet" type="text/css" href="/ProjectServer1/public/style.css">
</head>
<body>
<div align="center">
<%
	//if(GetCookie.GetCookie(request, "name") ==null)
    if(session.getAttribute("current_name") == null)
	  	{%>	
    	Неавторизованный пользователь
		<br><a href='http://localhost:8080/ProjectServer1/Autorization'>Войти\Зарегистрироваться</a>
		
<%}
	else 
	
	 	{
			out.println("Пользователь: "+GetCookie.GetCookie(request, "name")+"\n");
%>		
<br>Секретная информация, доступная авторизированным пользователям
</div>
		<%} %>
		<div>
		<%if (request.getParameter("usersearch")==null || request.getParameter("usersearch").trim().length()==0)
		{%>
			<form action="/ProjectServer1/Catalog?note=">
    <input type="text" name="usersearch" id="usersearch" value = "" />
    <button>Искать</button>
		<%}
		else
		{%>
			<form action="/ProjectServer1/Catalog?note=<%=request.getParameter("usersearch").trim()%>">
    <input type="text" name="usersearch" id="usersearch" value = "<%=request.getParameter("usersearch").trim()%>" />
    <button>Искать</button>
		<%}
			
			%>
			   
    </form>
			
		</div>
	<div class=".catalog">
	
	<% 
			
			PrintWriter pw = response.getWriter();
			Connection connect=ConnectBase.GetConnection();
			Statement statement =ConnectBase.GetStatementBase(connect);
			ResultSet result = null;
			
			try {
				if(request.getParameter("usersearch")==null || request.getParameter("usersearch").trim().isEmpty()    )
				{
		        	result = statement.executeQuery("select * FROM Notes");
			 
		        	while (result.next())
		        	{%>
		        	
		        	<div class=cen >
		        	<img object-fit="cover" height="170" width="170" src="/ProjectServer1/public/product/<%=result.getString("foto") %>" alt="<%=result.getString("name")%>" width="25%"><br>
		        	<a href="/ProjectServer1/Pages?id=<%=result.getInt("id")%>"> Имя товара:<%= result.getString("name") %> </a>
		        	<p>цена:<%= result.getInt("price") %></p>
		        	<p>дата добавления:<%= result.getString("data") %></p>
		        	<br>
		        	</div>
		        		
		        		
		        	<% } 
			}
			else
			{	String usersearch= request.getParameter("usersearch").trim();
				result = statement.executeQuery("select * FROM Notes where name LIKE '%"+usersearch+"%'   ");
				if (!result.next())
	        	{%>
	        	<div>По данному запросу записи не найдены</div>
	        	
	        	<% } 
				result = statement.executeQuery("select * FROM Notes where name LIKE '%"+usersearch+"%'   ");
	        	while (result.next())
	        	{%>
	        	
	        	<div  align="left" >
	        	<img src="/ProjectServer1/public/product/<%=result.getString("foto") %>" alt="<%=result.getString("name")%>" width="25%"><br>
	        	<a href="/ProjectServer1/Pages?id=<%=result.getInt("id")%>"> Имя товара:<%= result.getString("name") %> </a>
	        	<p>цена:<%= result.getInt("price") %></p>
	        	<p>дата добавления:<%= result.getString("data") %></p>
	        	<br>
	        	</div>
	        		
	        		
	        	<% } 
			}
				}
			
			
	        catch (SQLException throwables) 
	        {
				throwables.printStackTrace();
	        }
		        	
			statement.close();
			connect.close();	
	%>
	</div>
</body>
</html>