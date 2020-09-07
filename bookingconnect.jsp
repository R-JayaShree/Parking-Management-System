<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String pass="";
String vehicleno=request.getParameter("vehicleno");
session.setAttribute( "thevehicleno", vehicleno );
int vehicleid=(int)session.getAttribute( "theid" );
String model=request.getParameter("model");
session.setAttribute( "themodel", model );
String fueltype=request.getParameter("fueltype");
session.setAttribute( "thefueltype", fueltype );
String transmission=request.getParameter("transmission");
session.setAttribute( "thetransmission", transmission );
String vehicletype=request.getParameter("radio");
session.setAttribute( "thevehicletype", vehicletype );
String name=request.getParameter("name");
session.setAttribute( "thename", name );
String payment=request.getParameter("payment");
session.setAttribute("thepayment",payment);
String username=(String)session.getAttribute( "theName" );
String loc=(String)session.getAttribute( "thelocation" );
String status="";
String slotno="";
int no1=(int)session.getAttribute("theid");
int fw=0;
con = DriverManager.getConnection(url,userName,pass);
Statement st1=con.createStatement();
ResultSet res=st1.executeQuery("select * from vendortable where vendorid="+no1);
if(res.next()){
        if(vehicletype.equals("2-Wheeler")){
                fw = res.getInt(10);
                fw+=1;
        }
        else if(vehicletype.equals("4-Wheeler")){
                fw=res.getInt(11);
                fw+=1;
        }
}
int Filled2wheeler = fw;
int Filled4wheeler = fw;
if(vehicletype.equals("2-Wheeler")){
con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled2wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled2wheeler);
        stmt.executeUpdate();
}
else if(vehicletype.equals("4-Wheeler")){
        con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled4wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled4wheeler);
        stmt.executeUpdate();
}

con = DriverManager.getConnection(url,userName,pass);
Statement st=con.createStatement();
ResultSet resultSet=st.executeQuery("select * from vendortable where vendorid="+no1);
if(resultSet.next()){
if(vehicletype.equals("2-Wheeler")){
        int a=(int)resultSet.getInt("wheeler2");
        int b=(int)resultSet.getInt("Filled2wheeler");
        if(a<b){
            status="Waiting List";
            slotno+="-";
            con = DriverManager.getConnection(url,userName,pass);
            Statement s1=con.createStatement();
            ResultSet re=s1.executeQuery("select * from vendortable where vendorid="+no1);
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
con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled2wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled2wheeler);
        stmt.executeUpdate();
}
else if(vehicletype.equals("4-Wheeler")){
con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled4wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled4wheeler);
        stmt.executeUpdate();
}
    }
    else{
            status="Booked";
            slotno+=loc.charAt(0);
            slotno+="2-";
            slotno+=Filled2wheeler;
    }
}
else{
        int a1=(int)resultSet.getInt("wheeler4");
        int b1=(int)resultSet.getInt("Filled4wheeler");
        if(a1<b1){
            status="Waiting List";
            slotno+="-";
            con = DriverManager.getConnection(url,userName,pass);
            Statement t1=con.createStatement();
            ResultSet es=t1.executeQuery("select * from vendortable where vendorid="+no1);
            if(es.next()){
                if(vehicletype.equals("2-Wheeler")){
                        fw = es.getInt(10);
                        fw-=1;
                }
            else if(vehicletype.equals("4-Wheeler")){
                fw=es.getInt(11);
                fw-=1;
                }
        }
Filled2wheeler=fw;
Filled4wheeler=fw;
if(vehicletype.equals("2-Wheeler")){
con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled2wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled2wheeler);
        stmt.executeUpdate();
}
else if(vehicletype.equals("4-Wheeler")){
        con = DriverManager.getConnection(url,userName,pass);
String s="update vendortable set Filled4wheeler=? where vendorid="+no1;
PreparedStatement stmt=null;
stmt = con.prepareStatement(s);
        stmt.setInt(1,Filled4wheeler);
        stmt.executeUpdate();
}
    }
    else{
            status="Booked";
            slotno+=loc.charAt(0);
            slotno+="4-";
            slotno+=Filled4wheeler;
    }
}
    }

session.setAttribute("thestatus",status);
session.setAttribute("theslotno",slotno);
session.setAttribute("thefilled2",Filled2wheeler);
session.setAttribute("thefilled4",Filled4wheeler);

//int nk=0;
//con=DriverManager.getConnection(url,userName,pass);
//Statement t2=con.createStatement();
//ResultSet eso=t2.executeQuery("select * from vehicletable");
//while(eso.next()){
//        if(eso.getString(12).equals(slotno)){
//                nk=eso.getInt(1);
//                break;
//        }
//}

String sss=status;
String ss=slotno;
con = DriverManager.getConnection(url,userName,pass);
PreparedStatement stt = con.prepareStatement("update datetable  set slotno1='"+ss+"',status1='"+sss+"' where username1='"+username+"'");
stt.executeUpdate();

int total=0;
int tl=(int)session.getAttribute("thetimdiff");
con=DriverManager.getConnection(url,userName,pass);
Statement t2=con.createStatement();
ResultSet eso=t2.executeQuery("select * from vendortable where vendorid='"+no1+"'");
if(eso.next()){
if(vehicletype.equals("2-Wheeler")){
        int a=eso.getInt(12);
        total=tl*a;
        String tll=Integer.toString(total);
        session.setAttribute("thetll",tll);
}
if(vehicletype.equals("4-Wheeler")){
        int a=eso.getInt(13);
        total=tl*a;
        String tll=Integer.toString(total);
        session.setAttribute("thetll",tll);
}
}
try {
Class.forName(driver);
con = DriverManager.getConnection(url,userName,pass);
String sql = "insert into vehicletable (vehicleno,vendorid,model,fueltype,transmission,vehicletype,name,payment,username,status,slotno,total) values(?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps=null;
ps=con.prepareStatement(sql);
    ps.setString(1,vehicleno);
    ps.setInt(2,vehicleid);
    ps.setString(3,model);
    ps.setString(4,fueltype);
    ps.setString(5,transmission);
    ps.setString(6,vehicletype);
    ps.setString(7,name);
    ps.setString(8,payment);
    ps.setString(9,username);
    ps.setString(10,status);
    ps.setString(11,slotno);
    ps.setInt(12,total);
    int x=ps.executeUpdate();
ps.close();
con.close();
response.sendRedirect("profile2.jsp");
}
catch(Exception e) {
out.println(e);
}
%>