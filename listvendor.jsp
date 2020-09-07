<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Bookings</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="listvendorcss.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
body{
  overflow-y: scroll;
}
</style>
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
<li><a href="termscond.jsp">Term & Conditions</a></li>
<li><a href="login.jsp">sign out</a></li>
</ul>
</nav>
</section>
<form  name="form1" action="listvendor.jsp" method="post">
<%
	String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String driver = "com.mysql.jdbc.Driver";
	String userName ="root";
	String pass="";
 int current = 1;
            if(request.getParameter("hidden") != null)
            {
                current = Integer.parseInt(request.getParameter("hidden"));
            }

	Connection con = null;
	Class.forName(driver);
	con = DriverManager.getConnection(url,userName,pass);
	  Statement st= con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
	ResultSet rs=st.executeQuery("select * from vendortable");
 if(current<1)
		{
			current=1;
		}
        rs.last();
		int rows=rs.getRow();
		if(current<=rows)
		{
			rs.absolute(current);
		}

  %>
  						
<div class="d" style="height:480px;margin-top:5%;background-color: #FFFFFF !important;">
<h1 style="font-family:Poppins;background: -webkit-linear-gradient(#283048,#859398);
  -webkit-background-clip: text;font-size:45px;
  -webkit-text-fill-color: transparent;text-align:center;"> <%=rs.getString(5)%> </h1>
  <% session.setAttribute("lcname",rs.getString(5)); %>
  <p style="text-align:center;font-size:15px;font-family:Poppins;background: -webkit-linear-gradient(#000000,#000000);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;"> <%=rs.getString(6)%> </p>
  <br>
  <hr>
    <div class="c" style=" border-left: 1px solid grey;height: 210px;margin-left:295px;"></div>
  <h4 style="margin-top:-190px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Vendor Name : <%=rs.getString(2)%></h4>
  <h4 style="margin-top:15px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Vendor ContactNo : <%=rs.getString(4)%></h4>
  <h4 style="margin-top:15px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">No of Slots : <%=rs.getString(7)%></h4>
   <h4 style="margin-top:15px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Prize for 2-wheeler : <%=rs.getString(12)%></h4>
   <h4 style="margin-top:15px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Prize for 4-wheeler : <%=rs.getString(13)%></h4>
  
    <h4 style="margin-top:-190px;margin-left:325px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">No of 2Wheelers &nbsp;: <%=rs.getString(8)%></h4>
    <h4 style="margin-top:15px;margin-left:325px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Filled 2Wheelers&nbsp;: <%=rs.getString(10)%></h4>
  <h4 style="margin-top:15px;margin-left:325px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">No of 4Wheelers : <%=rs.getString(9)%></h4>
  <h4 style="margin-top:15px;margin-left:325px;font-family:Poppins;background: -webkit-linear-gradient(#1e130c,#9a8478);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Filled 4Wheelers : <%=rs.getString(11)%></h4>
  <h5 style="margin-top:65px;margin-left:14px;font-family:Poppins;background: -webkit-linear-gradient(#333333,#dd1818);
  -webkit-background-clip: text;-webkit-text-fill-color: transparent;">Note : Booking the parking lot upfront 2 hours earlier.</h5>
  <% int as=rs.getInt(8);int bs=rs.getInt(10);int cs=rs.getInt(9);int ds=rs.getInt(11); 
  if(as == bs && cs == ds){ %>
<div class="s" >
<button type="submit" class="login" style="width:140px;font-family:Numans;border-radius:10px;font-size:20px;padding:8px;margin-top:5%;margin-left:35%;background-color:#A5CC82;border:none;"><a href="profile.jsp" style="text-decoration:none;color:black;">Waiting List</button></a>
</div>
<%
  }
  else{
    %>
    <div class="s">
<button type="submit"  class="login" style="width:140px;font-family:Numans;border-radius:10px;font-size:20px;padding:8px;margin-top:5%;margin-left:35%;background-color:#A5CC82;border:none;"><a href="profile.jsp" style="text-decoration:none;color:black;">Book</button></a>
</div>
<%
  }
  %>
</div>
   <INPUT TYPE="HIDDEN" NAME="hidden" VALUE="<%= current %>" />
            <div class="c" style="margin-top:-20%;"><a ONCLICK="moveNext()">
<i class='fas fa-chevron-right' style='font-size:36px;margin-left:80%;'></i></div></a>
 <div class="z" style="margin-top:-2.8%;"><a ONCLICK="movePrevious()">
<i class='fas fa-chevron-left' style='font-size:36px;margin-left:18%;'></i></div>
    </form>
<SCRIPT LANGUAGE="JavaScript">
            function moveNext()
            {
                var counter = 0
                counter = parseInt(document.form1.hidden.value) + 1
               
                document.form1.hidden.value = counter
                form1.submit()
            }    
            function movePrevious()
            {
                var counter = 0
                counter = parseInt(document.form1.hidden.value) - 1
                document.form1.hidden.value = counter
                form1.submit()
            }    

        </SCRIPT>
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