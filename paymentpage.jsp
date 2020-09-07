<%@ page language="java" import="java.lang.*" import="java.text.SimpleDateFormat" import="java.util.Date" import="java.text.DecimalFormat"  import="java.sql.*" %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profile2css.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
<li><a href="booking.jsp">My Bookings</a></li>
<li><a href="vendorlist.jsp">Vendor Details</a></li>
<li><a href="#">Emergency</a></li>
<li><a href="myprofile.jsp">My Profile</a></li>
<li><a href="login.jsp">sign out</a></li>
</ul>
</nav>
</section>
<%
							String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
							String driver = "com.mysql.jdbc.Driver";
							String userName ="root";
							String pass="";
							Connection con = null;
							Class.forName(driver);
							con = DriverManager.getConnection(url,userName,pass);
							Statement st=con.createStatement();
							String u1=(String) session.getAttribute("theName");
              SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
              Date date = new Date();
              String curdate=dateFormat.format(date);
							ResultSet rs=st.executeQuery("select * from bookingtable where username2='"+u1+"' and checkoutdate='"+curdate+"'");
							if(rs.next()){
								%>
							
<div class="box" style="background-color:white;width: 950px; border: 1px solid #3b8d99;padding: 50px;margin:20px; margin-left:230px;margin-top:70px;">
<div class="box" style="background-color:white;width: 230px; border: 1px solid #3b8d99;height:460px;padding: 40px;margin:20px; margin-left:-31px;margin-top:-32px;">
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:-15px;">Check-In Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </h1>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:-7px;text-align:center;><%= session.getAttribute("thecheckindate") %></h4>
<h4 style=font-family:Numans;margin-top:-10px;color:black;margin-left:-7px;>__________________</h4>
<h1 style="font-size:16px;margin-top:20px;font-family:Numans;font-size:18px;">Check-In Time &nbsp;&nbsp;&nbsp;&nbsp;: </h1>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:-7px;text-align:center;><%= session.getAttribute("thecheckintime") %></h4>
<h4 style=font-family:Numans;margin-top:-10px;color:black;margin-left:-7px;>__________________</h4>
<h1 style="font-size:16px;margin-top:20px;font-size:18px;font-family:Numans;text-align:center;">Check-Out Date &nbsp;&nbsp;: </h1>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:-7px;text-align:center;><%= session.getAttribute("thecheckoutdate") %></h4>
<h4 style=font-family:Numans;margin-top:-10px;color:black;margin-left:-7px;>__________________</h4>
<h1 style="font-size:16px;margin-top:20px;font-size:18px;font-family:Numans;">Check-Out Time &nbsp;: </h1>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:-7px;text-align:center;><%= session.getAttribute("thecheckouttime") %></h4>
<h4 style=font-family:Numans;margin-top:-10px;color:black;margin-left:-7px;>__________________</h4>
<h1 style="font-size:16px;margin-top:20px;font-size:18px;font-family:Numans;">Booking Period &nbsp;&nbsp;&nbsp;: </h1>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:-7px;text-align:center;><%= session.getAttribute("days") %> / <%= session.getAttribute("hours") %></h4>
<h4 style=font-family:Numans;margin-top:-10px;color:black;margin-left:-7px;>__________________</h4>
<div class="box" style="background-color:white;width: 670px; border: 1px solid #3b8d99;height:460px;padding: 40px;margin:20px; margin-left:200px;margin-top:-440px;">
  <h1 style="font-family:Numans;font-size:40px;margin-top:-30px;margin-left:230px;background: -webkit-linear-gradient(#1A2980,#26D0CE);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;"> Details</h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:10px;">Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute("theName") %></h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:15px;">Vehicle Reg No &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString(7) %> </h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:15px;">Vehicle Type  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=  rs.getString(9) %></h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:15px;">Model & Brand &nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=  rs.getString(8) %> </h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:15px;">Fuel Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute("thefueltype") %> </h1>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:15px;">Transmission &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute("thetransmission") %> </h1>
<div class="vl" style="border-left: 1px solid #3b8d99;height: 200px;margin-top:-200px;margin-left:360px;"></div>
<h4 style="font-family:Numans;margin-left:400px;margin-top:-151px;">SLOT NO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute( "theslotno" ) %></h4>
<h4 style="font-family:Numans;margin-left:400px;margin-top:30px;">TOTAL AMOUNT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</h4>
<div class="boxx" style="background-color:white;width: 110px; border: 1px solid #3b8d99;height:20px;padding: 20px;margin:20px; margin-left:450px;margin-top:20px;text-align:center;"><%= session.getAttribute("total") %></div>
<h1 style="font-size:16px;font-size:18px;font-family:Numans;margin-top:45px;">Note : After payed the full amount of payment given in the generated total amount then you can able to get your vehicle out .</h1>
<div class="razorpay-embed-btn" data-url="https://pages.razorpay.com/pl_FT3rk7sF40FUC2/view" data-text="Pay Here" data-color="#3b8d99" data-size="small" style="margin-left:37%;margin-top:20px;">
  <script>
    (function(){
      var d=document; var x=!d.getElementById('razorpay-embed-btn-js')
      if(x){ var s=d.createElement('script'); s.defer=!0;s.id='razorpay-embed-btn-js';
      s.src='https://cdn.razorpay.com/static/embed_btn/bundle.js';d.body.appendChild(s);} else{var rzp=window['__rzp__'];
      rzp && rzp.init && rzp.init()}})();
  </script>
</div>
<%
              }
              %>
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