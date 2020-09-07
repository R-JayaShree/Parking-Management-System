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
<!DOCTYPE html>
<html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Vendorlist</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profile2css.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
html{
  overflow-x: scroll;
  overflow-y: scroll;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th{
  background-color:#BBD2C5;
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
    width:80px;
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
    width:80px;
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
<h1 style="margin-top:3%;margin-left:35%;">Database for vendor list :</h1>
<table style="width:100%;margin-top:2%;">
<tr>
<th>Vendor Name</th>
<th>Vendor Id</th>
<th>Contact No</th>
<th>Location</th>
<th>No of Slots</th>
<th>Two-wheeler</th>
<th>Prize-2Wheeler</th>
<th>Four-wheeler</th>
<th>Prize-4Wheeler</th>
<th>Filled 2 Wheeler</th>
<th>Filled 4 Wheeler</th>
</tr>
<%
try{
con = DriverManager.getConnection(url,userName,pass);
Statement st=con.createStatement();
ResultSet resultSet=st.executeQuery("select * from vendortable");
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("vendorname") %></td>
<td><%=resultSet.getString("vendorid") %></td>
<td><%=resultSet.getString("contactno") %></td>
<td><%=resultSet.getString("locations") %></td>
<td><%=resultSet.getString("noslots") %></td>
<td><%=resultSet.getString("wheeler2") %></td>
<td><%=resultSet.getString("prize-2") %></td>
<td><%=resultSet.getString("wheeler4") %></td>
<td><%=resultSet.getString("prize-4") %></td>
<td><%=resultSet.getString("Filled2wheeler") %></td>
<td><%=resultSet.getString("Filled4wheeler") %></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
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