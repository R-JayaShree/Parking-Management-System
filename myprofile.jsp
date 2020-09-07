<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Myprofile</title>
    <link rel="icon" href="park.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<style>
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
</style>
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
</section>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">
						<div class="row header">
							<div class="cell" >
								<h3>My Profile</h3>
							</div>
							<%
							try{
							String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
							String driver = "com.mysql.jdbc.Driver";
							String userName ="root";
							String pass="";
							Connection con = null;
							Class.forName(driver);
							con = DriverManager.getConnection(url,userName,pass);
							Statement st=con.createStatement();
							String u1=(String) session.getAttribute("theName");
							ResultSet rs=st.executeQuery("select * from customer where username='"+u1+"'");
							if(rs.next()){
								%>
								
							<div class="cell">
								<div class="z" style="margin-left:40%;">
									<h3 ><a style="color:white;text-decoration:none;" href="profileupdate.jsp?username=<%=rs.getString(3)%>">Edit </a></h3>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Name
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(2) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								UserName
							</div>
							<div class="cell" data-title="Location">
								<%= session.getAttribute( "theName" ) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Password
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(4) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								DOB
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(5) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Address
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(6) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Phone
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(7) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Email
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(8) %>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								Aadhar Number
							</div>
							<div class="cell" data-title="Location">
								<%= rs.getString(9) %>
							</div>
						</div>
						
						<%
							}
							}
							catch(Exception e){

							}
						%>
					</div>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
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