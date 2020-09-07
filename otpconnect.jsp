<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";	
String driver = "com.mysql.jdbc.Driver"; //this is the driver name
String userName ="root"; //this is mysql user name
String password=""; // this is mysql password
String o=request.getParameter("otp");
String to=(String)session.getAttribute("thema");
String name="";
Class.forName(driver);
con = DriverManager.getConnection(url,userName,password);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from customer where email='"+to+"'");
if(rs.next()){
    if(rs.getString(10).equals(o)){
        name+=rs.getString(3);
        response.sendRedirect("Homepage.jsp");
    }
    else{
        %>
    <script>
       alert("Invalid OTP..Please try again.");
    </script>
<%
    }
    session.setAttribute("theName",name);
}
%>
</body>
</html>