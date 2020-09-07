<%@ page language="java" import="java.lang.*" import="java.text.SimpleDateFormat" import="java.util.Date" import="java.text.DecimalFormat" import="java.sql.*" %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String UserName ="root";
String pass="";
String sub1=request.getParameter("sub1");
session.setAttribute("thesub1",sub1);
String sub2=request.getParameter("sub2");
session.setAttribute("thesub2",sub2);
String username2=(String)session.getAttribute( "theName" );
String vehicleno="";
String vehiclemodel="";
String vehicletype="";
int vendorid=0;
String slotno="";
String fueltype="";
String transmission="";
Class.forName(driver);
Connection cs=null;
cs = DriverManager.getConnection(url,UserName,pass);
Statement stt1=cs.createStatement();
ResultSet ros=stt1.executeQuery("select * from vehicletable where username='"+username2+"'");
if(ros.next()){
    vehicleno=ros.getString(1);
    vehiclemodel=ros.getString(3);
    vehicletype=ros.getString(6);
    vendorid=ros.getInt(2);
    slotno=ros.getString(11);
    fueltype=ros.getString(4);
    transmission=ros.getString(5);
}
String phno="";
String email="";

Class.forName(driver);
Connection c=null;
c = DriverManager.getConnection(url,UserName,pass);
Statement st1=c.createStatement();
ResultSet res=st1.executeQuery("select * from customer where username='"+username2+"'");
if(res.next()){
    phno=res.getString(7);
    email=res.getString(8);
}

if(sub1!=null){
    String checkindate="";
    checkindate=request.getParameter("checkindate");
    session.setAttribute( "thecheckindate", checkindate );
    String checkintime="";
    checkintime=request.getParameter("checkintime");
    session.setAttribute( "thecheckintime", checkintime );
    try {
Class.forName(driver);
con = DriverManager.getConnection(url,UserName,pass);
String sql = "insert into bookingtable (checkindate,checkintime,vendorid,username2,vehicleno,vehiclemodel,Fueltype,transmission,slotno,vehicletype,phoneno,email) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
PreparedStatement ps=null;
ps=con.prepareStatement(sql);
    ps.setString(1,checkindate);
    ps.setString(2,checkintime);
    ps.setInt(3,vendorid);
    ps.setString(4,username2);
    ps.setString(5,vehicleno);
    ps.setString(6,vehiclemodel);
    ps.setString(7,fueltype);
    ps.setString(8,transmission);
    ps.setString(9,slotno);
    ps.setString(10,vehicletype);
    ps.setString(11,phno);
    ps.setString(12,email);
    int x=ps.executeUpdate();
ps.close();
con.close();
String checkin="Check-In";
con = DriverManager.getConnection(url,UserName,pass);
String ss4="update datetable set checkin=? where username1='"+username2+"'";
PreparedStatement stmt=null;
stmt = con.prepareStatement(ss4);
        stmt.setString(1,checkin);
        stmt.executeUpdate();
response.sendRedirect("booking.jsp");
}
catch(Exception e) {
out.println(e);
}
}
else if(sub2!=null){
    String checkoutdate=request.getParameter("checkoutdate");
    session.setAttribute("thecheckoutdate",checkoutdate);
    String checkouttime=request.getParameter("checkouttime");
    session.setAttribute("thecheckouttime",checkouttime);
    String date=(String)session.getAttribute("thecheckindate");
    String time=(String)session.getAttribute("thecheckintime");
    int total=0;
            String d1 = date;
			String t1 = time;
			String d2 = checkoutdate;
			String t2 = checkouttime;
			String format = "yyyy/MM/dd hh:mm";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			Date dateObj1 = sdf.parse(d1 + " " + t1);
			Date dateObj2 = sdf.parse(d2 + " " + t2);
			DecimalFormat crunchifyFormatter = new DecimalFormat("###,###");
			long diff = dateObj2.getTime() - dateObj1.getTime();
			int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			int diffhours = (int) (diff / (60 * 60 * 1000));
        
            int tl=diffhours;
            session.setAttribute("days",diffDays);
            session.setAttribute("hours",diffhours);
            total=tl*5;
            session.setAttribute("total",total);
    String statuss="paid";
    try {
Class.forName(driver);
con = DriverManager.getConnection(url,UserName,pass);
String s="update bookingtable set checkoutdate=?,checkouttime=?,total=?,statuss=? where username2='"+username2+"'";
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setString(1,checkoutdate);
        stmt.setString(2,checkouttime);
        stmt.setInt(3,total);
        stmt.setString(4,statuss);
        stmt.executeUpdate();
stmt.close();
con.close();
String checkout="Check-Out";
con = DriverManager.getConnection(url,UserName,pass);
String ss4="update datetable set checkout=? where username1='"+username2+"'";
PreparedStatement stt=null;
stt = con.prepareStatement(ss4);
        stt.setString(1,checkout);
        stt.executeUpdate();
response.sendRedirect("paymentpage.jsp");
}
catch(Exception e) {
out.println(e);
}

    String location=(String)session.getAttribute("lcname");
    Connection connect=null;
    Class.forName(driver);
    connect = DriverManager.getConnection(url,UserName,pass);
    String sql = "insert into waitgenerate (vendorid1,location1,vehicletype1,slotno2) values(?,?,?,?)";
    PreparedStatement ps=null;
    ps=connect.prepareStatement(sql);
    ps.setInt(1,vendorid);
    ps.setString(2,location);
    ps.setString(3,vehicletype);
    ps.setString(4,slotno);
    ps.executeUpdate();
    ps.close();
    connect.close();

//delete tha data in both the table
/*Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection(url,UserName,pass);
Statement st=conn.createStatement();
st.executeUpdate("DELETE datetable, vehicletable FROM datetable INNER JOIN vehicletable ON datetable.slotno1='"+slotno+"' and vehicletable.slotno='"+slotno+"'");


Connection con1=null;
int Filled2wheeler=0;
int Filled4wheeler=0;
int no1=vendorid;
int fw=0;
 con1 = DriverManager.getConnection(url,UserName,pass);
            Statement ss1=con1.createStatement();
            ResultSet re=ss1.executeQuery("select * from vendortable where vendorid="+no1);
            if(re.next()){
                if(vehicletype.equals("2-Wheeler")){
                        fw = re.getInt(10);
                        fw-=1;
                }
                else if(vehicletype.equals("4-Wheeler")){
                        fw=re.getInt(11);
                        fw-=1;
                }
        }
Filled2wheeler=fw;
Filled4wheeler=fw;
if(vehicletype.equals("2-Wheeler")){
con = DriverManager.getConnection(url,UserName,pass);
String ss2="update vendortable set Filled2wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(ss2);
        stmt.setInt(1,Filled2wheeler);
        stmt.executeUpdate();
}
else if(vehicletype.equals("4-Wheeler")){
        con = DriverManager.getConnection(url,UserName,pass);
String ss3="update vendortable set Filled4wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(ss3);
        stmt.setInt(1,Filled4wheeler);
        stmt.executeUpdate();
}*/
}
else{

}

%>