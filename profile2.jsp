<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Bookings</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profile2css.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
function validate(form) {
    if(form.id=="Waiting List"){
        alert("You are in waiting list..It takes sometime to Book your order..Is it Ok you may SUBMIT");
        window.location.href = "successbook.jsp";
    }
    else{
      window.location.href = "successbook.jsp";
    }
    
}
</script>
  </head>
  <body>
 <!--<div class="videobg">
		<video autoplay loop muted>
		  <source src="car2.mp4" type="video/mp4">
		</video>
	  </div>-->
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

<div class="box">
<div class="box1">

<h1 style="font-family:Numans;margin-left:260px;margin-top:10px;">Vehicle Details :</h1>

<h4 style="font-family:Numans;margin-left:20px;margin-top:22px;">Vendor Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "theid" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Vehicle Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thevehicletype" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Vehicle register No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thevehicleno" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Model & Brand &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "themodel" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Fuel Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thefueltype" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Transmission&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thetransmission" ) %></h4>
<h4 style="font-family:Numans;margin-left:20px;margin-top:15px;">Name of your vehicle&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thename" ) %></h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:-151px;">STATUS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thestatus" ) %></h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:30px;">SLOT NO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "theslotno" ) %></h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:15px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:15px;">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</h4>
<h3 style="font-family:Numans;margin-top:-20px;margin-left:19px;text-decoration:underline;">Order Summary :</h3>

<div class="co">
<h1 style="font-family:Numans;margin-top:20px;margin-left:19px;">Total : &nbsp;&nbsp;<i style="font-size:20px;" class="fas fa-rupee-sign"></i> <%= session.getAttribute("thetll") %></h1></div>

<div class="sub">
<input type="submit" id="<%= session.getAttribute( "thestatus" )%>" value="Submit" class="login" onclick="return validate(this);" style="height:40px;width:100px;font-family:Numans;border-radius:10px;font-size:20px;margin-top:-1%;margin-left:83.5%;border: 1px solid black;background-color:white;" />
</div>

<div class="con">
<h2 style="font-family:Numans;margin-top:-20px;margin-left:20px;">Payment Method :&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "thepayment" ) %></h2>
</div>

  <div class="content">
<div class="div1" style=" border-radius:10px;">
 <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Booking days :</h5>
<div class="x-box" style= border-radius:10px;>
<h4 style=font-family:Numans;margin-top:15px;color:black;margin-left:10px;>Entry date :</h5>
<h4 style=font-family:Numans;margin-top:10px;color:black;margin-left:3px;><%= session.getAttribute( "thedate" ) %></h5>
</div>
<div class="y-box"style=border-radius:10px;>
<h4 style=font-family:Numans;margin-top:15px;color:black;margin-left:10px;>Exit date :</h5>
<h4 style=font-family:Numans;margin-top:10px;color:black;margin-left:3px;><%= session.getAttribute( "thedate1" ) %></h5>
</div>
  <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Booking period :</h5>
  <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;color:darkblue;><%= session.getAttribute( "thediff" ) %> Days / <%= session.getAttribute( "thetimdiff" ) %> Hours</h5>
  <h4 style=font-family:Numans;margin-top:-12px;color:black;margin-left:10px;>__________________</h5>
   <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Location :</h5>
   <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;color:darkblue;><%= session.getAttribute( "thelocation" ) %></h5>
  <h4 style=font-family:Numans;margin-top:-12px;color:black;margin-left:10px;>__________________</h5>
</div>
</div>
<div class="content">
<div class="vl" style="height:229px;"></div>

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
     
  </body>
</html>