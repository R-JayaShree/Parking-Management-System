<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";
String vendorname=request.getParameter("vendorname");
session.setAttribute( "thevendname", vendorname );
String vendorid=request.getParameter("vendorid");
session.setAttribute("theid",vendorid);
String contactno=request.getParameter("contactno");
session.setAttribute( "thecontact", contactno );
String locations=request.getParameter("locations");
session.setAttribute("thelocation",locations);
String address=request.getParameter("address");
session.setAttribute( "theaddress", address );
String noslots=request.getParameter("noslots");
session.setAttribute( "thenoslots", noslots );
String wheeler2=request.getParameter("wheeler2");
session.setAttribute( "thewheeler2", wheeler2 );
String wheeler4=request.getParameter("wheeler4");
session.setAttribute( "thewheeler4", wheeler4 );
String prize2=request.getParameter("prize2");
session.setAttribute( "theprize2", prize2 );
String prize4=request.getParameter("prize4");
session.setAttribute( "theprize4", prize4 );
int Filled2wheeler=0;
int Filled4wheeler=0;
try {
Class.forName(driver);
con = DriverManager.getConnection(url,userName,pass);
String sql = "insert into vendortable (vendorname,vendorid ,contactno ,locations ,address,noslots ,wheeler2 ,wheeler4 ,Filled2wheeler,Filled4wheeler,prize2,prize4) values(?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=null;
ps=con.prepareStatement(sql);
    ps.setString(1,vendorname);
    ps.setString(2,vendorid);
    ps.setString(3,contactno);
    ps.setString(4,locations);
    ps.setString(5,address);
    ps.setString(6,noslots);
    ps.setString(7,wheeler2);
    ps.setString(8,wheeler4);
    ps.setInt(9,Filled2wheeler);
    ps.setInt(10,Filled4wheeler);
    ps.setString(11,prize2);
    ps.setString(12,prize4);
int x=ps.executeUpdate();
ps.close();
con.close();
response.sendRedirect("adminform.jsp");
}
catch(Exception e) {
out.println(e);
}
%>