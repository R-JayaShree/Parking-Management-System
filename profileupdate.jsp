<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" type="text/css" href="register.css">
    <link rel="icon" href="park.png">
	<title>Update-Profile</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<head>
</head>
<style>
.container {
	background-color: rgba(0, 0, 0, 0.500);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width: 400px;
	height: 750px;
	max-width: 100%;
}
</style>
</head>
<!--<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>-->
<div class="container">
	<div class="header">
		<h2 style="margin-top: 6%;">Update-Details</h2>
	</div>
    <%
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";
Connection conn=null;
Statement stat=null;
ResultSet rs=null;
PreparedStatement stmt=null;
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url,userName,pass);
%>
	<form class="form"  action="" method="post">
    <% 
    stat = conn.createStatement();
	String u1=(String) session.getAttribute("theName");
	rs=stat.executeQuery("select * from customer where username='"+u1+"'");
    if(rs.next()){
        %>
        <div class="form-control">
            <label for="name">          </label>
			<input type="text" value="<%= rs.getString(2) %>" id="name" name="n" autocomplete="off" required pattern="[\sA-Za-z0-9]{3,20}" title="Ex:User" oninvalid="this.setCustomValidation('Please Enter valid Name')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		<div class="form-control">
            <label for="username">              </label>
            <!--<span class="input-group-text"><i class="fas fa-user-circle"></i></span>-->
			<input type="text" value="<%= session.getAttribute( "theName" ) %>" id="username" name="un" autocomplete="off" required pattern="[A-Z]{1}[a-z0-9]{3,20}" title="Ex:Username" oninvalid="this.setCustomValidation('Please Enter valid username')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
        </div>
        <div class="form-control">
            <label for="password">              </label>
            <!--<span class="input-group-text"><i class="fas fa-key"></i></span>-->
			<input type="password" value="<%= session.getAttribute( "thepwd" ) %>" id="password" name="p" autocomplete="off" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Ex:User*/@123" oninvalid="this.setCustomValidation('Please Enter valid Password')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="dob">       </label>
            <!--<span class="input-group-text"><i class="fas fa-calendar"></i></span>-->
			<input type="text" value="<%= rs.getString(5) %>" id="dob" name="dob" autocomplete="off" required pattern="^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$" title="DD/MM/YYYY" oninvalid="this.setCustomValidation('Please Enter valid Date Of Birth')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="address">               </label>
            <!--<span class="input-group-text"><i class="fas fa-address-book"></i></span>-->
			<input type="text" value="<%= rs.getString(6) %>" id="address" name="ad" autocomplete="off" required />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small class="t-area">Error message</small>
        </div>
        <div class="form-control">
            <label for="phone">                 </label>
            <!--<span class="input-group-text"><i class="fas fa-phone"></i></span>-->
			<input type="text" value="<%= rs.getString(7) %>" id="phone" name="ph" autocomplete="off" required pattern="(\d{10})" title="9876543210" oninvalid="this.setCustomValidation('Please Enter valid PhoneNo')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="username">          </label>
            <!--<span class="input-group-text"><i class="fas fa-envelope"></i></span>-->
			<input type="email" value="<%= rs.getString(8) %>" id="email" name="em" autocomplete="off" required pattern="((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])" title="user@gmail.com" oninvalid="this.setCustomValidation('Please Enter valid Email')" oninput="setCustomValidation('')" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
        </div>
        <div class="form-control">
            <label for="adhar">                 </label>
            <!--<span class="input-group-text"><i class="fas fa-id-card"></i></span>-->
			<input type="text" value="<%= rs.getString(9) %>" id="adhar" name="adh" autocomplete="off" required pattern="(\d{4}\s\d{4}\s\d{4})" title="345324547894" oninvalid="this.setCustomValidation('Please Enter valid AadharNumber')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <%
    }
    %>
        <div class="j" style="width:130px;margin-left:60%;">
		<button type="submit" >update</button>
        </div>
        <div class="j" style="width:80px;margin-top:-18%;">
        <button type="submit"><a href="myprofile.jsp" style="text-decoration:none;color:white;">Back</a></button></div>
    </form>
    </html>
    <%
    String a=request.getParameter("n");
    String b=request.getParameter("un");
    String c=request.getParameter("p");
    String d=request.getParameter("dob");
    String e=request.getParameter("ad");
    String f=request.getParameter("ph");
    String g=request.getParameter("em");
    String h=request.getParameter("adh");
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
        String query="update customer set name=?, username=?, password=?, dob=?, address=?, phone=?, email=?,adhar=? where username='"+b+"'";
        stmt = conn.prepareStatement(query);
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
        stmt.setString(5,e);
        stmt.setString(6,f);
        stmt.setString(7,g);
        stmt.setString(8,h);
        int x=stmt.executeUpdate();
        stmt.close();
        conn.close();
        response.sendRedirect("myprofile.jsp");
    }
    %>