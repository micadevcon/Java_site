<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html lang="ru" >
  <head>
   <title>Авторизация</title>
    <link rel="stylesheet" type="text/css" href="/Store/public/login.css">
    <link rel="stylesheet" type="text/css" href="/Store/public/style.css">
  </head>
  <body>
    <header>
      <div class="header-top">
        <a href="/Store/" >главная</a>
        <a href="/Store/Catalog"> Магазин</a>
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
    <div id="registration_container">
    <div id="form_container"  >
      <form   action="" method="post">
 <p class="login-text">Регистрация на сайте</p>
  <input class='text_input' type="" name="Email" id="Email" placeholder="почта">
  <input class='text_input' type="" name="Password"id="Password" placeholder="пароль">
  <input class='text_input' type="" name="Name" id="Name" placeholder="имя">
  <input class='text_input' type="" name="Fname" id="Fname" placeholder="фамилия">
  <input class='text_input' type="" name="Oname" id="Oname" placeholder="отчество">
  <input class='text_input' type="" name="Gender" id="Gender" placeholder="пол">
  <input class='text_input' type="" name="Organization" id="Organization" placeholder="организация">
  <input class='text_input' type="" name="Number" id="Number" placeholder="номер телефона">
  <input class='text_input' type="" name="Country" id="Country" placeholder="Страна">
  <input class='text_input' type="" name="Town" id="Town" placeholder="Город">
  
  <p class="login-text">Посчитайте пример:<a id="num1">1</a>+<a id="num2">2</a> </p> 
<input class='text_input'  name="ReturnSum" id="ReturnSum"  maxlength="30">
  <input class='text_input' class="create-account" type="submit" value="Отправить" onclick=" return checkForm()">
  
  </form>
  </div>
</div>
      
  </body>
<script>
let num1=Math.round(Math.random()*100+1);
let num2=Math.round(Math.random()*100+1);
sum=num1+num2;
document.getElementById("num1").innerHTML =num1;
document.getElementById("num2").innerHTML =num2;
  function checkForm()
  {

    if (document.getElementById("ReturnSum").value != sum)
  {
    alert ('Капча решена неверно!');
    return false;
  }
    else if (document.getElementById("Email").value.trim() == '')
    {
        alert ('Заполните почта');
        return false;
        }
    else if (document.getElementById("Password").value.trim() == '')
    {
    alert ('Заполните поле пароль');
    return false;
    }
    else if (document.getElementById("Name").value.trim() == '')
    {
    alert ('Заполните поле имя');
    }
    else if (document.getElementById("Fname").value.trim() == '')
    {
    alert ('Заполните поле фамилия');
    return false;
    }
    else if (document.getElementById("Oname").value.trim() == '')
    {
    alert ('Заполните поле отчество');
    return false;
    }
    else if (document.getElementById("Gender").value.trim() == '')
    {
    alert ('Заполните поле пол');
    return false;
    }
    else if (document.getElementById("Organization").value.trim() == '')
    {
    alert ('Заполните поле организация');
    return false;
    }
    else if (document.getElementById("Number").value.trim() == '')
    {
    alert ('Заполните поле номер телефона');
    return false;
    }
    else if (document.getElementById("Country").value.trim() == '')
    {
    alert ('Заполните поле страна');
    return false;
    }
    else if (document.getElementById("Town").value.trim() == '')
    {
    alert ('Заполнитеполе город');
    return false;
    }

    
}
</script>
</html>
