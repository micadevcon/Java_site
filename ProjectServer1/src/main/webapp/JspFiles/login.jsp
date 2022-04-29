<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="jakarta.servlet.http.Cookie , ru.classes.*" %>
<!DOCTYPE html>
<html lang="ru" >
  <head>
   <title>Авторизация</title>
    <link rel="stylesheet" type="text/css" href="/ProjectServer1/public/login.css">
    <link rel="stylesheet" type="text/css" href="/ProjectServer1/public/style.css">
  </head>
  <body>
    <header>
      <div class="main_menu">
      	<a href="/ProjectServer1/"><img width="50" height="50" src="/ProjectServer1/public/product/1.png"></a>
        <a class="" href="/ProjectServer1/Catalog">Магазин</a>
        <a class="" href="/ProjectServer1/">Помощь</a>
        <a class="" href="/ProjectServer1/Autorization">Авторизация</a>
      </div>
      <div class="vladmaxi-top">
        <a href="/ProjectServer1/" ><img width="50" height="50" src="/ProjectServer1/public/product/1.png"></a>
         <a href="/ProjectServer1/Catalog"> Магазин</a>
         <span class="center">
                <a href="/ProjectServer1/Catalog"> Авторизация</a></span>
        <span class="right">
                <a href="/ProjectServer1/Catalog"> Авторизация</a>
    </header>
    <div id="login_container">
    <div id="form_container"  >
      <form   action="/ProjectServer1/Autorization" method="post">
 <p class="login-text">Авторизация на сайте</p>
  <input class='text_input' type="" name="Email"id="Email" placeholder="логин">
  <input class='text_input' type="password" name="Password" id="Password" placeholder="Введите пароль" maxlength="30">
  <p class="login-text">Посчитайте пример:<a id="num1">1</a>+<a id="num2">2</a> </p> 
<input class='text_input'  name="ReturnSum" id="ReturnSum"  maxlength="30">
  <input class='text_input' class="create-account" type="submit" value="Отправить" onclick=" return checkForm()">
   <p class="login-text"><a  href="/ProjectServer1/Registration">Регистрация</a> </p> 
  
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
}
</script>
</html>
