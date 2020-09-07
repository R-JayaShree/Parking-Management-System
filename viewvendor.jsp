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
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
    *{
  margin: 0;
  padding: 0;
  list-style: none;
  text-decoration: none;
}

body{

  background-position: center;
  background-size: cover;
  height: 100vh;
  font-family: sans-serif;
  overflow: hidden;
  user-select: none;
}
nav .logo{
  color: white;
  font-size: 33px;
  font-weight: bold;
  line-height: 70px;
  padding-left: 110px;
}
nav{
  height: 70px;
  background: #434343;
  box-shadow: 0 3px 15px rgba(0,0,0,.4);
}
nav ul{
  float: right;
  margin-right: 30px;
}
nav ul li{
  display: inline-block;
}
nav ul li a{
  color: white;
  display: block;
  padding: 0 15px;
  line-height: 70px;
  font-size: 20px;
  background: #434343;
  transition: .5s;
}
nav ul li a:hover,
nav ul li a.active{
  color: #23dbdb;
}
nav ul ul{
  position: absolute;
  top: 85px;
  border-top: 3px solid #23dbdb;
  opacity: 0;
  visibility: hidden;
}
nav ul li:hover > ul{
  top: 70px;
  opacity: 1;
  visibility: visible;
  transition: .3s linear;
}
nav ul ul li{
  width: 150px;
  display: list-item;
  position: relative;
  border: 1px solid #042331;
  border-top: none;
}
nav ul ul li a{
  line-height: 50px;
}
nav ul ul ul{
  border-top: none;
}
nav ul ul ul li{
  position: relative;
  top: -70px;
  left: 150px;
}
nav ul ul li a i{
  margin-left: 45px;
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
html{
  overflow-x: scroll;
}
th{
  background-color:#BBD2C5;
}
</style>
<body>
 <nav>
      <label class="logo">Parking Allotment</label>
      <ul>
<li><a  href="adminform.jsp">Home</a></li>
<li><a href="bookadmin.jsp">Bookings</a></li>
<li><a href="#">Vendor
          <i class="fas fa-caret-down"></i>
        </a>
          <ul>
<li><a href="addvendor.jsp">Add</a></li>
<li><a href="viewvendor.jsp">view</a></li>
</ul>
</li>
<li><a href="#">Customers
          <i class="fas fa-caret-down"></i>
        </a>
          <ul>
<li><a href="customerdetails.jsp">Cus Details</li>
<li><a href="bookdetails.jsp">Booking List</a></li>
<li><a href="waitdetails.jsp">Waiting List</a></li>
</ul>
</li>
<li><a href="login.jsp">logout</a></li>
</ul>
</nav>

<h1 style="margin-left:35%;margin-top:2%;">Database for vendor list :</h1>
<table style="width:100%;margin-top:2%;">
<tr>
<th>Vendor Name</th>
<th>Vendor Id</th>
<th>Contact No</th>
<th>Location</th>
<th>Address</th>
<th>No of Slots</th>
<th>Two-wheeler</th>
<th>Prize-2Wheeler</th>
<th>Four-wheeler</th>
<th>Prize-4Wheeler</th>
<th>Actions</th>
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
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("noslots") %></td>
<td><%=resultSet.getString("wheeler2") %></td>
<td><%=resultSet.getString("prize-2") %></td>
<td><%=resultSet.getString("wheeler4") %></td>
<td><%=resultSet.getString("prize-4") %></td>
<td class="text-center">
<a href="editvendor.jsp?vendorid=<%=resultSet.getString("vendorid")%>" class="k">Edit</a>
<a href="deleteconnect.jsp?vendorid=<%=resultSet.getString("vendorid")%>" class="j">Delete</a></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>