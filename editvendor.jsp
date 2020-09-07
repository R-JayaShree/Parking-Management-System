<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" type="text/css" href="addvendorcss.css">
    <link rel="icon" href="park.png">
	<title>Update-Vendor</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<head>
<style>

</style>
</head>
<!--<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>-->
<div class="container">
	<div class="header">
		<h2 style="margin-top: 6%;">Update-Vendor</h2>
	</div>
    <%
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";
Connection conn=null;
Statement stat=null;
ResultSet res=null;
PreparedStatement stmt=null;
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url,userName,pass);
%>
	<form class="form"  action="" method="post">
    <% 
    stat = conn.createStatement();
    String vendorid=request.getParameter("vendorid");
    int no=Integer.parseInt(vendorid);
    String data="select * from vendortable where vendorid='"+no+"'";
    res=stat.executeQuery(data);
    while(res.next()){
        %>
        
        <div class="form-control">
            <label for="vendorname">Vendor Name :</label>
			<input type="text" value="<%= res.getString("vendorname") %>" id="vendorname" name="vn" autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="vendorid">Vendor Id :</label>
			<input type="text" value="<%= res.getString("vendorid") %>" id="vendorid" name="vd"  autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="contactno">Vendor Contact No :  </label>
			<input type="text" value="<%= res.getString("contactno") %>" id="contactno" name="cn" autocomplete="off" required />
        </div>
        <div class="form-control">
            <label for="location">Location :   </label>
			<input type="text" value="<%= res.getString("locations") %>" id="location" name="lc" autocomplete="off" required />
		</div>
        <div class="form-control">
            <label for="location">Address :   </label>
			<textarea type="text" value="<%= res.getString("address") %>" id="address" name="ad" autocomplete="off" required ></textarea>
		</div>
        <div class="form-control">
            <label for="noslots">Total No of Slots :</label>
			<input type="text" value="<%= res.getString("noslots") %>" id="noslots" name="ns" autocomplete="off" required />
		</div>
        <div class="form-control">
            <label for="wheeler2">Slots For Two-Wheelers :</label>
			<input type="text" value="<%= res.getString("wheeler2") %>" id="wheeler2" name="w2" autocomplete="off" required />
		</div>
        <div class="form-control">
            <label for="wheeler4">Slots For Four-Wheelers : </label>
			<input type="text" value="<%= res.getString("wheeler4") %>" id="wheeler4" name="w4" autocomplete="off" required />
        </div>
        <%
    }
    %>
        <div class="j" style="width:130px;margin-left:60%;">
		<button type="submit" >update</button>
        </div>
        <div class="j" style="width:80px;margin-top:-23%;">
        <button type="submit"><a href="viewvendor.jsp" style="text-decoration:none;color:white;">Back</a></button></div>
    </form>
    </html>
    <%
    String a=request.getParameter("vn");
    String b=request.getParameter("vd");
    String c=request.getParameter("cn");
    String d=request.getParameter("lc");
    String h=request.getParameter("ad");
    String e=request.getParameter("ns");
    String f=request.getParameter("w2");
    String g=request.getParameter("w4");
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
        String query="update vendortable set vendorname=?,vendorid=?, contactno=?, locations=?,address=?, noslots=?, wheeler2=?, wheeler4=? where vendorid='"+b+"'";
        stmt = conn.prepareStatement(query);
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
        stmt.setString(5,h);
        stmt.setString(6,e);
        stmt.setString(7,f);
        stmt.setString(8,g);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
        response.sendRedirect("viewvendor.jsp");
    }
    %>