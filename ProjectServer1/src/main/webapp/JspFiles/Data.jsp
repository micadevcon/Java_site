<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<title>Личный кабинет</title>
</head>
<body>
<div align="center">
<%
	//if(GetCookie.GetCookie(request, "name") ==null)
    if(session.getAttribute("current_name") == null)
	  	{
		out.println("Неавторизованный пользователь");
		out.println("<br><a href='http://localhost:8080/ProjectServer1/Registration'>Регистрация</a> или");
		out.println("<a href='http://localhost:8080/ProjectServer1/Autorization'>Авторизация</a>");
%>			
<%}
	else 
	
	 	{out.println("Пользователь: "+GetCookie.GetCookie(request, "name")+"\n");
%>		
<br>Секретная информация, доступная авторизированным пользователям
</div>
<%} %>
</body>
</html>