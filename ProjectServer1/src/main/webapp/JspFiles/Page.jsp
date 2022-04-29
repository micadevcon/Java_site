<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.SQLException, jakarta.servlet.http.Cookie , ru.classes.*, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<title>Товар</title>
</head>
<body>
<div align="center">
<%
request.setCharacterEncoding("Cp1251");
response.setCharacterEncoding("Cp1251");
	//if(GetCookie.GetCookie(request, "name") ==null)
    if(session.getAttribute("current_name") == null)
	  	{%>
		Неавторизованный пользователь
		<br><a href='http://localhost:8080/ProjectServer1/Registration'>Регистрация</a> или
		<a href='http://localhost:8080/ProjectServer1/Autorization'>Авторизация</a>
		
<%}
	else 
	
	 	{
			out.println("Пользователь: "+GetCookie.GetCookie(request, "name")+"\n");
%>		
<br>Секретная информация, доступная авторизированным пользователям
</div>
		<%} %>
	<div >
	<% 
			String id=request.getParameter("id");
			PrintWriter pw = response.getWriter();
			Connection connect=ConnectBase.GetConnection();
			Statement statement =ConnectBase.GetStatementBase(connect);
			ResultSet result = null;
			try {
		        	result = statement.executeQuery("select * FROM Notes where id="+id);
			 
		        	while (result.next())
		        	{%>
		        	
		        	<div  align="left" >
		        	
		        	<img src="/ProjectServer1/public/product/<%=result.getString("foto") %>" alt="<%=result.getString("name")%>" width="25%"><br>
		        	<div align="left">
		        	<p> Имя товара:<%= result.getString("name") %> </p>
		        	<p>цена:<%= result.getInt("price") %></p>
		        	<p>дата добавления:<%= result.getString("data") %></p>
		        	</div>
		        	<br>
		        	</div>
		        		
		        		
		        	<% } 
		        		
			}
        	
			
	        catch (SQLException throwables) 
	        {
				throwables.printStackTrace();
	        }
		        	
		        	
	%>
	</div>
	Последние комментарии:
	<%
	ResultSet resultComment = null;
			try {
				resultComment = statement.executeQuery("select * FROM Comments where Notes_id="+id);
			 
		        	while (resultComment.next())
		        	{%>
		        	
		        	<div  align="left" >
		        	
		        	<p><%= resultComment.getString("name") %></p>
		        	<p><%= resultComment.getString("comment") %></p>
		        	<p><%= resultComment.getString("date") %></p>
		        	<hr>
		        	</div>
		        		
		        		
		        	<% } 
		        		
			}
        	
			
	        catch (SQLException throwables) 
	        {
				throwables.printStackTrace();
	        }
			statement.close();
			connect.close();
			
			if(session.getAttribute("current_name") == null)
	  	{%>
		Писать комментарии могут только авторизированные пользователи
		<br><a href='http://localhost:8080/ProjectServer1/Autorization'>Войти\Зарегистрироваться</a>
		
<%}
	else { %>
			<form action="" method="post">
			<div> Комментарий: </div>
			<input type="text" name="comment" value="" + "size="30">
			<button type="submit">Send your message</button>
			</form>
			<%}%>
</body>
</html>