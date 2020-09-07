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
<li><a href="myprofile.jsp">My Profile</a></li>
<li><a href="booking.jsp">My Bookings</a></li>
<li><a href="vendorlist.jsp">Vendor Details</a></li>
<li><a href="termscond.jsp">Terms & Conditions</a></li>
<li><a href="login.jsp">sign out</a></li>
</ul>
</nav>
</section>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
%>

<style>
body{
  overflow-y: scroll;
 
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
td{
    text-align:center;
}
.j{
  background-color: red;
	border: 1px solid red;
	border-radius: 4px;
	color: black;
	display: block;
	font-family: inherit;
	font-size: 16px;
  padding: 5px;
    margin-top:5px;
    height:20px;
    width:70px;
    text-decoration:none;
}
.k{
  background-color:yellow;
  	border: 1px solid yellow;
	border-radius: 4px;
	color: black;
	display: block;
  font-family: inherit;
  font-size: 16px;
   padding: 5px;
    margin-top:5px;
    height:20px;
    width:70px;
    text-decoration:none;
}
.j{
  background-color: red;
	border: 1px solid red;
	border-radius: 4px;
	color: black;
	display: block;
	font-family: inherit;
	font-size: 16px;
  padding: 5px;
    margin-top:5px;
    height:30px;
    width:70px;
    text-decoration:none;
}
th{
  background-color:#BBD2C5;
}
</style>
    <script>
function myFunction() {
  if (confirm("Do you want to cancel your bookings..!")) {
    return true;
  } else {
    return false;
  }
}
</script>
<body>

<h1 style="margin-top:3%;margin-left:40%;">Booking Details:</h1>
<table style="width:100%;margin-top:2%;"> 
<tr>
<th>UserName</th>
<th>Entry Date / Time</th>
<th>Exit Date / Time</th>
<th>VendorID / Location</th>
<th>Vehicle Details</th>
<th>Payment Option</th>
<th>Status</th>
<th>Slot Number</th>
<th>Total</th>
<th>Action</th>
</tr>
<%
try{
con = DriverManager.getConnection(url,userName,pass);
Statement st=con.createStatement();
String n=(String)session.getAttribute("theName");
ResultSet resultSet=st.executeQuery("select * from datetable,vehicletable");
while(resultSet.next()){
    if(resultSet.getString("username1").equals(n)&&resultSet.getString("username").equals(n)){
%>
<tr>
<td><%=resultSet.getString("username1") %>
<td><%=resultSet.getString("date") %> / <%=resultSet.getString("time") %></td>
<td><%=resultSet.getString("date1") %> / <%=resultSet.getString("time1") %></td>
<td><%=resultSet.getString("vendorid") %> / <%=resultSet.getString("location") %></td>
<td>vehicleNo : <%=resultSet.getString("vehicleno") %><br>
Vehiclemodel : <%=resultSet.getString("model") %><br>
Fueltype : <%=resultSet.getString("fueltype") %><br> 
Transmission : <%=resultSet.getString("transmission") %> <br>
Vehicletype : <%=resultSet.getString("vehicletype") %></td>
<td><%=resultSet.getString("payment") %></td>
<td><%=resultSet.getString("status") %></td>
<td><%=resultSet.getString("slotno") %></td>
<td><%=resultSet.getString("total") %></td>
<td class="text-center">
<a href="deletebooking.jsp?slotno=<%=resultSet.getString("slotno")%>" class="j" onclick="return myFunction(this)">Cancel</a></td>
</tr>
<%
}
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
</table>
<%
String Url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String Driver = "com.mysql.jdbc.Driver";
String UserName ="root";
String Pass="";
String name=(String)session.getAttribute( "theName" );
String e="";
 Connection cn=null;
    Class.forName(Driver);
    cn=DriverManager.getConnection(Url,UserName,Pass);
    Statement s=cn.createStatement();
    ResultSet r=s.executeQuery("select * from datetable where username1='"+name+"'");
    if(r.next()){
        e=r.getString(2);
    }
    session.setAttribute("theetime",e);
%>
 
<!--<hr color="black" size="1">
<div class="c" style=" border-left: 1px solid black;height: 320px;margin-left:695px;">
</div>
<hr color="black" size="1">-->
<div class="z" style=" background-color: white; width: 97%; border: 1px solid black; height: 280px; margin: 20px;">
<h1 style="margin-top:0.5%;margin-left:18px;font-family:Numans;background: -webkit-linear-gradient(#283048,#859398); -webkit-background-clip: text;font-size:35px;-webkit-text-fill-color: transparent;text-align:left;">Check In :</h1>
<br>
<h4 style="margin-left:5%;"> <i class="fas fa-arrow-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;Here is Check-In..If you not click check-in button means,your aren't able<br><br> to park your vehicle in your slot..</h4>
<br>
<h3 style="margin-left:10%;">Your CHECK-IN date : <%= session.getAttribute( "thecheckindate" )%>   , time : <%= session.getAttribute( "thecheckintime" )%></h3><br>
<p style="margin-left:16.5%;">Please click here to CHECK-IN..</p>
<div class="dd">
<form name="form1" action="checkconnect.jsp" method="post">
<input type="hidden" name="checkindate" id="todayDate" />
<input type="hidden" name="checkintime" id="time" />
<div class="s"><a href="">
<input type="submit" value="Check In" id="<%= session.getAttribute( "theetime" )%>" onclick="return validate(this);" name="sub1" class="lo" style="color:white;width:120px;padding:7px;font-family:Numans;border-radius:3px;font-size:20px;margin-top:1%;margin-left:20%;background-color:#3b8d99;border:none;" /></div></a>
</form>
</div>
    <script>
function validate(form1) {
  var d=form1.id;
  let [hr2, mi2] = d.split(":");
  var endDate = new Date(0, 0, 0, hr2, mi2, 0);
  var today = new Date();
  var time = today.getHours() + ":" + today.getMinutes()+":"+"00";
  let [hr1, mi1] = time.split(":");
  var startDate = new Date(0, 0, 0, hr1, mi1, 0);
  var diff =  startDate.getTime()-endDate.getTime();
  var minutes = Math.floor(diff / 1000 / 60);
    if(d=="null"){
      alert("You aren't book any bookings..!");
      return false;
    }
    else if(minutes>=0&& minutes<=15){
      return true;
    }
    else{
      alert("your CHECKIN time is invalid..your checkin time and entry time must equal..You haven't checkin before your ENTRY TIME..!");
      return false;
    }
    
}
</script>
<script type="text/javascript">
function getDate()
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    var hours = today.getHours();
    var mins = today.getMinutes();
    if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
    today = yyyy+"/"+mm+"/"+dd;
    document.getElementById("todayDate").value = today;
    document.getElementById("time").value = hours + ":" + mins;
}
getDate();
</script>
<%
%>
<div class="c" style=" border-left: 1px solid black;height: 279px;margin-top:-18.8%;margin-left:50%;">
</div>
<h1 style="margin-top:-20.8%;margin-left:51.5%;font-family:Numans;background: -webkit-linear-gradient(#283048,#859398); -webkit-background-clip: text;font-size:35px;-webkit-text-fill-color: transparent;text-align:left;">Check Out :</h1>
<br>
<h4 style="margin-left:55%;"> <i class="fas fa-arrow-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;Here is Check-OUT..Before you checkout "you must pay your payment",<br><br> After that checkout should enable and get you vehicle in slot.</h4>
<br>
<h3 style="margin-left:60%;">Your CHECK-OUT date : <%= session.getAttribute( "thecheckoutdate" )%> , time : <%= session.getAttribute( "thecheckouttime" )%></h3><br>
<p style="margin-left:66.5%;">Please click here to CHECK-OUT..</p>

<div class="d">
<form name="form2" action="checkconnect.jsp" method="post">
<input type="hidden" name="checkoutdate" id="outDate" />
<input type="hidden" name="checkouttime" id="outtime" />
<div class="get" style="margin-top:-28.3%;"><a href="paymentpage.jsp">
<input type="submit" value="Check Out" class="login" name="sub2" style="color:white;margin-top:2%;width:130px;padding:8px;font-family:Numans;border-radius:5px;font-size:20px;margin-left:61%;border: 1px solid black;background-color:#3b8d99;border:none;" /></a>
    <!--<div class="razorpay-embed-btn" data-url="https://pages.razorpay.com/pl_FT1MWs6aCQ9OHe/view" data-text="Check Out" data-color="#3b8d99" data-size="small" style="margin-left:57%;">
  <script>
    (function(){
      var d=document; var x=!d.getElementById('razorpay-embed-btn-js')
      if(x){ var s=d.createElement('script'); s.defer=!0;s.id='razorpay-embed-btn-js';
      s.src='https://cdn.razorpay.com/static/embed_btn/bundle.js';d.body.appendChild(s);} else{var rzp=window['__rzp__'];
      rzp && rzp.init && rzp.init()}})();
  </script>
</div>-->
<!--<div class="razorpay-embed-btn" data-url="https://pages.razorpay.com/pl_FT3rk7sF40FUC2/view" data-text="Check Out" data-color="#3b8d99" data-size="small" style="margin-left:57%;">
  <script>
    (function(){
      var d=document; var x=!d.getElementById('razorpay-embed-btn-js')
      if(x){ var s=d.createElement('script'); s.defer=!0;s.id='razorpay-embed-btn-js';
      s.src='https://cdn.razorpay.com/static/embed_btn/bundle.js';d.body.appendChild(s);} else{var rzp=window['__rzp__'];
      rzp && rzp.init && rzp.init()}})();
  </script>
</div>-->
    
    
</div>
</form>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</div>
<script type="text/javascript">
function getDate()
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    var hours = today.getHours();
    var mins = today.getMinutes();
    if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
    today = yyyy+"/"+mm+"/"+dd;
    document.getElementById("outDate").value = today;
    document.getElementById("outtime").value = hours + ":" + mins;
}
getDate();
</script>

</div>

<!--<div class="s" style="margin-top:-3%;"><a href="">
<input type="submit" value="Payment" class="login" style="width:160px;padding:8px;font-family:Numans;border-radius:10px;font-size:20px;margin-left:81%;border: 1px solid black;background-color:white;" /></a>
</div>
</div>-->

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