<%@ page language="java" import="java.lang.*" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home-Page</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profile2css.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <style>
  body, html {
  height: 100%;
  margin: 0;

}

* {
  box-sizing: border-box;
}
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 50px 10px;

}
body{
background-image: url('w.jpg');
backdrop-filter: blur(7px);
  }
  
  </style>
  <body>


     
  <div class="bg-text">
  <h2 style="margin-top:-40px;margin-left:340px;font-family:poppins;font-size:30px;background: -webkit-linear-gradient(#2980B9,#6DD5FA,#FFFFFF);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;">Terms and Conditions</h2>
  <p style="margin-top:20px;margin-left:40px;font-family:Courier New;font-size:20px;"><i class="fas fa-arrow-right" style="font-size:15px;"></i>&nbsp;&nbsp;Booking the parking lot upfront 2 hours earlier</p>
  <p style="margin-top:20px;margin-left:40px;font-family:Courier New;font-size:20px;"><i class="fas fa-arrow-right" style="font-size:15px;"></i>&nbsp;&nbsp;Both current date/time and Entry date/time is equal on that time,you must check-in through website then only you should able to park your vehicle in the given slot.</p>
  <p style="margin-top:20px;margin-left:40px;font-family:Courier New;font-size:20px;"><i class="fas fa-arrow-right" style="font-size:15px;"></i>&nbsp;&nbsp;For check-out same as check-in process..And after completing your full payment you may able to check-out(you may able to get your vehicle out.!)</p>
  <p style="margin-top:20px;margin-left:40px;font-family:Courier New;font-size:20px;"><i class="fas fa-arrow-right" style="font-size:15px;"></i>&nbsp;&nbsp;If you are in waiting list means If there any slot is free in required location that slot will be given to you automatically and remain you, by sending a alert mail by system.</p>
  <p style="margin-top:20px;margin-left:40px;font-family:Courier New;font-size:20px;"><i class="fas fa-arrow-right" style="font-size:15px;"></i>&nbsp;&nbsp;If there is no slot for your time means,its automatically cancelled your booking and send the message to your mail.</p>
  
  <h5 style="margin-top:40px;margin-left:40px;font-family:Numans;font-size:20px;font-size:25px;background: -webkit-linear-gradient(#e52d27,#b31217);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;">For Emergency Purpose :&nbsp;&nbsp;<div style="background: -webkit-linear-gradient(#DBE6F6,#C5796D);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;margin-top:10px;"><i style="background: -webkit-linear-gradient(#f46b45,#eea849);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;margin-top:10px;">Contact No :</i> 8754916300&nbsp;
  <div style="background: -webkit-linear-gradient(#DBE6F6,#C5796D);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;margin-top:10px;"><i style="background: -webkit-linear-gradient(#f46b45,#eea849);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;margin-top:10px;">Email : </i>parkingallot@gmail.com</div></h5>
</div>
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
</section>
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
    </div>
  </body>
</html>