<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home-Page</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="homepagecss.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>

  <section>
    <div class="btn">
      <span class="fas fa-bars"></span>
    </div>
<nav class="sidebar">
<img src="i.jpg" alt="Avatar" class="avatar">
      <div class="text" style=font-family:Numans;><%= session.getAttribute( "theName" ) %>
 </div>
<ul>
<li class="active"><a href="Homepage.jsp">Home</a></li>
<li><a href="myprofile.jsp">My Profile</a></li>
<li><a href="booking.jsp">My Bookings</a></li>
<li><a href="vendorlist.jsp">Vendor Details</a></li>
<li><a href="termscond.jsp">Terms & Conditions</a></li>
<li><a href="login.jsp">sign out</a></li>
</ul>
</nav>
    <div class="content">
      <div class="header">
<h1 style="font-family:Numans; margin-left:-120px;">Parking..</h1>
<h5 style=font-family:Numans;margin-left:-80px;>The Leader in professional Parking System.</h5></div>
<h1 style="font-family:Poppins;margin-top:50px; margin-left:-120px;   background: -webkit-linear-gradient(#1E9600,#FFF200,#FF0000);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;">Enter Site..</h1>
<div class="bg-image"></div>
</div>
<script>
    $('.btn').click(function(){
      $(this).toggleClass("click");
      $('.sidebar').toggleClass("show");
    });
      $('.feat-btn').click(function(){
        $('nav ul .feat-show').toggleClass("show");
        $('nav ul .first').toggleClass("rotate");
      });
      $('.serv-btn').click(function(){
        $('nav ul .serv-show').toggleClass("show1");
        $('nav ul .second').toggleClass("rotate");
      });
      $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
      });
    </script>
     <div class="arrow bounce" ><a href="listvendor.jsp"><i class="fa fa-angle-down angle-black" style="color:white;font-size:50px;"></i></a></div>
     
  </body>
</html>
