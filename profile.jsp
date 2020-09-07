<%@ page language="java" import="java.lang.*" import="java.text.SimpleDateFormat" import="java.util.Date" import="java.text.DecimalFormat" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Bookings</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profilecss.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
<li><a href="myprofile.jsp">My Profile</a></li>
<li><a href="booking.jsp">My Bookings</a></li>
<li><a href="vendorlist.jsp">Vendor Details</a></li>
<li><a href="termscond.jsp">Terms & Conditions</a></li>
<li><a href="login.jsp">sign out</a></li>
</ul>
</nav>
    <div class="content">
      <div class="header">
<h4 style="font-family:Poppins;margin-top:-80px; margin-left:-180px;background: -webkit-linear-gradient(#1A2980,#26D0CE);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;">Bookings..</h4>
</div>
</div>
<form action="connectdate.jsp" method="post"  onsubmit="profile1.jsp">
     <input type="date"  id="txtDate" required="Required" class="form-control" style="margin-left:380px;margin-top:20.5%;border-radius:10px;padding: 5px 5px;padding-bottom: 10px;" name="date" />
<script type="text/javascript">
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("date")[0].setAttribute('min', today);
document.getElementsByName("date")[0].setAttribute('max', today);
</script>
<input type="date"  id="txtDate1" required="Required" class="form-control" style="margin-left: 210px;border-radius:10px;padding: 5px 5px;padding-bottom: 10px;" name="date1" />
<script type="text/javascript">
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("date1")[0].setAttribute('min', today);
</script>
<input  type="time" name="time" class="tim" id="tipd" required/>
<input  type="time" name="time1" class="tims" id="tipds" style="margin-left: 260px;" required/>
<input type="text" name="location" id="loca" class="location" value="<%= session.getAttribute( "lcname" ) %>"  style="width=5%;" />
<!--<select name="location" id="loca" class="location" required>
	<option value="" selected disabled hidden required>Choose here</option>
  <option value="Museum">Museum</option>
  <option value="CentralStation">CentralStation</option>
  <option value="Bazar">Bazar</option>
</select><br>-->
<div class="sub"><a href="profile1.jsp">
<input type="submit" value="Next" class="login" onclick="return CompareDate();" style="width:90px;padding:8px;font-family:Numans;border-radius:10px;font-size:20px;margin-top:4%;margin-left:88%;border: 1px solid black;background-color:white;" />
</div>
</form>

<div class="content" style="margin-left:20px;">

<div class="wrapper">
<h1 style="font-family:Numans;color:black;text-align:left;margin-left:70px;margin-top:50px;">Entry Date and Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Exit Date and Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Location</h1>

  <div class="box">
    <div class="content"></div>
    <h4 style="font-family:cursive;color:black;margin-top:50px;margin-left:-140px;">Enter date :</h4>
    <h4 style="font-family:cursive;color:black;margin-top:50px;margin-left:-140px;">Enter Time :</h4>
    <!--<h1 style="font-family:Numans;color:black;text-align:left;margin-left:272%;margin-top:-34px;text-decoration:none;font-size:20px;"><a href="Homepage.jsp" style="text-decoration:none;color:black;">Next</a></h1>-->
  <!--  <i style='font-size:18px;margin-left:283%;margin-top:-40px;color:black;' class='fas'>&#xf061;</i>-->
  </div>

  <div class="box">
    <div class="content"></div>
    <h4 style="font-family:cursive;color:black;margin-top:50px;margin-left:-140px;">Exit date :</h4>
    <h4 style="font-family:cursive;color:black;margin-top:50px;margin-left:-140px;">Exit Time :</h4>
  </div>
  <div class="box">
    <div class="content"></div>
    <h4 style="font-family:cursive;color:black;margin-top:70px;margin-left:-10px;">Select Locations : </h4>
  </div>

</div>
</div>
<script>
function CompareDate(){
      let [month, date, year]    = ( new Date() ).toLocaleDateString().split("/");
      let [hour, minute, second] = ( new Date() ).toLocaleTimeString().slice(0,7).split(":");
      var dates1 =document.getElementById("txtDate").value;
      let [y1, m1, d1] = dates1.split("-");
      var dates2 =document.getElementById("txtDate1").value;
      let [y2, m2, d2] = dates2.split("-");
      var a = new Date(year, month, date); 
      var b= new Date(y1, m1, d1);
      var c=new Date(y2, m2, d2);
      var today = new Date();
      var time = today.getHours() + ":" + today.getMinutes();
      var end = document.getElementById("tipd").value;
      var end1 = document.getElementById("tipds").value;
      let [hr1, mi1] = time.split(":");
      let [hr2, mi2] = end.split(":");
      let [hr3, mi3] = end1.split(":");
      var startDate = new Date(0, 0, 0, hr1, mi1, 0);
            var endDate = new Date(0, 0, 0, hr2, mi2, 0);
            var end1Date = new Date(0, 0, 0, hr3, mi3, 0);
            var diff = endDate.getTime() - startDate.getTime();
            var hours = Math.floor(diff / 1000 / 60 / 60);
            diff -= hours * 1000 * 60 * 60;
            var minutes = Math.floor(diff / 1000 / 60);
            var d=hours;
            var dif=end1Date.getTime()-endDate.getTime();
            var ho = Math.floor(dif / 1000 / 60 / 60);
            dif -= ho * 1000 * 60 * 60;
            var min = Math.floor(dif / 1000 / 60);
            var ds=ho;  
            if(d<2){
                alert("Please Booking the parking lot upfront 2 hours earlier");
                return false;
            }
            else if(a<c){
              return true;  
            }
            else if(a>=c&&ds<=0){
                alert("Entry time and Exit time is Same..please give validate time.!");
                return false;
            }
            else{
              return false;
            }
    }

</script>

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