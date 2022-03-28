<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<title>Меню</title>
</head>
<body>
<div align="right">
<%
	//if(GetCookie.GetCookie(request, "name") !=null)
	//	String user= (String) session.getAttribute("current_name");

    if(session.getAttribute("current_name") != null)
	  	out.println("Пользователь: "+GetCookie.GetCookie(request, "name")+"\n");
	else
		{
			out.println("Неавторизованный пользователь");
			out.println("<br><a href='http://localhost:8080/ProjectServer1/Registration'>Регистрация</a> или");
			out.println("<a href='http://localhost:8080/ProjectServer1/Autorization'>Авторизация</a>");
		}
%>		
</div>
<h1>Добро пожаловать на сайт</h1>


<p> <a href="http://localhost:8080/ProjectServer1/Registration">Регистрация</a> </p>
<p> <a href="http://localhost:8080/ProjectServer1/Autorization">Авторизация</a> </p>
<p> <a href="http://localhost:8080/ProjectServer1/Data">Личные данные</a> </p>
</body>
</html>