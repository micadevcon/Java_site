<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<link rel="stylesheet" type="text/css" href="/ProjectServer1/public/style.css">
<title>Меню</title>
</head>
<body>
 <header>
      <div class="main_menu">
          <a class="menu menu_position " href="/ProjectServer1/Registration">Регистрация</a>
          <a class="menu menu_position" href="/ProjectServer1/Catalog">Магазин</a>
          <a class="menu menu_position menu_now" href="/ProjectServer1/Autorization">Авторизация</a>
      <div align="center" class="main_menu">
      <%
	//if(GetCookie.GetCookie(request, "name") !=null)
	//	String user= (String) session.getAttribute("current_name");
	
    if(session.getAttribute("current_name") != null)
	  	out.println("<a class=\"menu \">"+"Пользователь: "+GetCookie.GetCookie(request, "name")+"</a>");
	else
		{%>
			"<a class=\"menu\">Неавторизованный пользователь</a>"
			<br><a href='http://localhost:8080/ProjectServer1/Autorization'>Войти\Зарегистрироваться</a>
		<%} %>
    
		</div>
      </div>

    </header>
<div align="right">

</div>
<h1 class="menu">Добро пожаловать на сайт</h1>

</html>