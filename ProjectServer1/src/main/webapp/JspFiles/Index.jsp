<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<link rel="stylesheet" type="text/css" href="/Store/public/style.css">
<title>Меню</title>
</head>
<body>
	<header>
		 <div class="header-top">
		        <a href="/Store/" >главная</a>
		        <a href="/Store/Catalog"> Магазин</a></span>
		               <a href="/Store/Report"> Связаться с нами</a>
		        <div class="header-right">
			        <% if(session.getAttribute("current_name") == null)
				  	{%>
					<a href="/Store/Autorization"> Авторизация\Регистрация</a>
					
					<%} 
			        else{%>
			        Пользователь:<%= GetCookie.GetCookie(request, "name")%>
			        <form method="POST" action="/Store/Autorization">
			        <input  type="submit" value="Выйти из аккаунта" name="kill">
			        </form>
			        <%}%>
		         </div>
	      </div>
    </header>
<div >

</div>
<h1 >Добро пожаловать на сайт компании</h1>
<div align="justify" class="page-title">Под нашим брендом выпускаются стильные высокотехнологичные смартфоны и телевизоры,  оригинальные мобильные телефоны и планшеты, а также многофункциональная бытовая техника.
<br><br><h3>КАК МЫ СОЗДАЕМ ПРОДУКТЫ?</h2>
<br>
Наши инженеры, дизайнеры и проектировщики на ежедневной основе тщательно отслеживают самые последние тренды в сфере техники и электроники, чтобы мы могли производить по-настоящему качественную и высокотехнологичную продукцию, которая делает вашу жизнь проще и комфортнее.
</div>
<br>
<div  align="center">
<img  src="/Store/public/1.jpg" alt="Логотип" width="300px"><br>
</div>

</html>