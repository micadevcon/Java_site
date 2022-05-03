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
    <div id="login_container">
    <div id="form_container"  >
      <form   action="/Store/Autorization" method="post">
 <p class="login-text">Авторизация на сайте</p>
  <input class='text_input' type="" name="Email"id="Email" placeholder="логин">
  <div class="password">
  <input class='text_input' type="password" name="Password" id="password-input" placeholder="Введите пароль" maxlength="30">
  <a href="#" class="password-control" onclick="return show_hide_password(this,1);"></a>
  </div>
  <p class="login-text">Посчитайте пример:<a id="num1">1</a>+<a id="num2">2</a> </p> 
<input class='text_input'  name="ReturnSum" id="ReturnSum"  maxlength="30">
  <input class='text_input' class="create-account" type="submit" value="Отправить" onclick=" return checkForm()">
   <p class="login-text"><a  href="/Store/Registration">Регистрация</a> </p> 
  
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
    else if (document.getElementById("password-input").value.trim() == '')
    {
    alert ('Заполните пароль');
    return false;
    }
    else if (document.getElementById("Email").value.trim() == '')
    {
    alert ('Заполните логин');
    return false;
    }
  }
  function show_hide_password(target,field)
  {
  if (field==1)
  {
        var input = document.getElementById('password-input');
  }

  else if (field==2)
  {
        var input = document.getElementById('RepeatPassword-input');
  }
    	if (input.getAttribute('type') == 'password') {
    		target.classList.add('view');
    		input.setAttribute('type', 'text');
    	} else {
    		target.classList.remove('view');
    		input.setAttribute('type', 'password');
    	}
    	return false;
  }
</script>
</html>
