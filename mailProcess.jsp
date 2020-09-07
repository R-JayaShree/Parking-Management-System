<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<%
    String result;
    final String to = request.getParameter("mail");
    final String subject = "Reset Password";
     String messg="Use this password to login :";
    final String from = "parkingallot@gmail.com";
    final String pass = "parkingallot@123";

    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtps");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
    try{
    String url = "jdbc:mysql://localhost:3306/parking allot?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String driver = "com.mysql.jdbc.Driver";
	String userName ="root";
	String pas="";
    String p="";
    Connection con = null;
	Class.forName(driver);
	con = DriverManager.getConnection(url,userName,pas);
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from customer");
    while(rs.next()){
        if(rs.getString(8).equals(to)){
            p=rs.getString(4);
            break;
        }
    }
    session.setAttribute("thep",p);
    messg+=p;
    }
    catch(Exception e){}
    try {
        MimeMessage message = new MimeMessage(mailSession);

        message.setFrom(new InternetAddress(from));

        message.addRecipient(Message.RecipientType.TO , new InternetAddress(to));
        

        
         message.setSubject(subject);
         message.setText(messg);
       //message.setContent("<!DOCTYPE html><html lang='en' xmlns='http://www.w3.org/1999/xhtml' xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'><head><meta charset='utf-8'><meta name='viewport' content='width=device-width'><meta http-equiv='X-UA-Compatible' content='IE=edge'><meta name='x-apple-disable-message-reformatting'><title></title><link href='https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700' rel='stylesheet'><style>html,body{margin: 0 auto !important;padding: 0 !important;height: 100% !important;width: 100% !important;background: #f1f1f1;}* {-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;}div[style*='margin: 16px 0'] {margin: 0 !important;}table,td {mso-table-lspace: 0pt !important;mso-table-rspace: 0pt !important;}table {border-spacing: 0 !important;border-collapse: collapse !important;table-layout: fixed !important;margin: 0 auto !important;}img {-ms-interpolation-mode:bicubic;}a {text-decoration: none;}*[x-apple-data-detectors],.unstyle-auto-detected-links *,.aBn {border-bottom: 0 !important;cursor: default !important;color: inherit !important;text-decoration: none !important;font-size: inherit !important;font-family: inherit !important;font-weight: inherit !important;line-height: inherit !important;}.a6S {display: none !important;opacity: 0.01 !important;}.im {color: inherit !important;}img.g-img + div {display: none !important;}@media only screen and (min-device-width: 320px) and (max-device-width: 374px) {u ~ div .email-container {min-width: 320px !important;}}@media only screen and (min-device-width: 375px) and (max-device-width: 413px) {u ~ div .email-container {min-width: 375px !important;}}@media only screen and (min-device-width: 414px) {u ~ div .email-container {min-width: 414px !important;}}</style><style>.primary{background: #17bebb;}.bg_white{background: #ffffff;}.bg_light{background: #f7fafa;}.bg_black{background: #000000;}.bg_dark{background: rgba(0,0,0,.8);}.email-section{padding:2.5em;}.btn{padding: 10px 15px;display: inline-block;}.btn.btn-primary{border-radius: 5px;background: #17bebb;color: #ffffff;}.btn.btn-white{border-radius: 5px;background: #ffffff;color: #000000;}.btn.btn-white-outline{border-radius: 5px;background: transparent;border: 1px solid #fff;color: #fff;}.btn.btn-black-outline{border-radius: 0px;background: transparent;border: 2px solid #000;color: #000;font-weight: 700;}.btn-custom{color: rgba(0,0,0,.3);text-decoration: underline;}h1,h2,h3,h4,h5,h6{font-family: 'Poppins', sans-serif;color: #000000;margin-top: 0;font-weight: 400;}body{font-family: 'Poppins', sans-serif;font-weight: 400;font-size: 15px;line-height: 1.8;color: rgba(0,0,0,.4);}a{color: #17bebb;}table{}.logo h1{margin: 0;}.logo h1 a{color: #17bebb;font-size: 24px;font-weight: 700;font-family: 'Poppins', sans-serif;}.hero{position: relative;z-index: 0;}.hero .text{color: rgba(0,0,0,.3);}.hero .text h2{color: #000;font-size: 34px;margin-bottom: 0;font-weight: 200;line-height: 1.4;}.hero .text h3{font-size: 24px;font-weight: 300;}.hero .text h2 span{font-weight: 600;color: #000;}.text-author{border: 1px solid rgba(0,0,0,.05);max-width: 50%;margin: 0 auto;padding: 2em;}.text-author img{border-radius: 50%;padding-bottom: 20px;}.text-author h3{margin-bottom: 0;}ul.social{padding: 0;}ul.social li{display: inline-block;margin-right: 10px;}.footer{border-top: 1px solid rgba(0,0,0,.05);color: rgba(0,0,0,.5);}.footer .heading{color: #000;font-size: 20px;}.footer ul{margin: 0;padding: 0;}.footer ul li{list-style: none;margin-bottom: 10px;}.footer ul li a{color: rgba(0,0,0,1);}.hov-link:hover {color: #17bebb;}@media screen and (max-width: 500px) {}</style></head><body width='100%' style='margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #f1f1f1;'><center style='width: 100%; background-color: #f1f1f1;'><div style='display: none; font-size: 1px;max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;'>&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;</div><div style='max-width: 600px; margin: 0 auto;' class='email-container'><table align='center' role='presentation' cellspacing='0' cellpadding='0' border='0' width='100%' style='margin: auto;'><tr><td valign='top' class='bg_white' style='padding: 1em 2.5em 0 2.5em;'><table role='presentation' border='0' cellpadding='0' cellspacing='0' width='100%'><tr><td class='logo' style='text-align: center;'><h1><a href='#'>Reset Password</a></h1></td></tr></table></td></tr><tr><td valign='middle' class='hero bg_white' style='padding: 2em 0 4em 0;'><table role='presentation' border='0' cellpadding='0' cellspacing='0' width='100%'><tr><td style='padding: 0 2.5em; text-align: center; padding-bottom: 3em;'><div class='text'><h2>We help to remember your password below is your password use this and login.</h2></div></td></tr><tr><td style='text-align: center;'><div class='text-author'><b>Jaisri</b> </div></td></tr></table></td></tr></table><table align='center' role='presentation' cellspacing='0' cellpadding='0' border='0' width='100%' style='margin: auto;'><tr><td valign='middle' class='bg_light footer email-section'><table><tr><td valign='top' width='33.333%' style='padding-top: 20px;'><table role='presentation' cellspacing='0' cellpadding='0' border='0' width='100%'><tr><td style='text-align: left; padding-left: 5px; padding-right: 5px;'><h3 class='heading'>Contact Info</h3><ul><li><span class='text'>203 Fairlands,<br>Salem,<br>TamilNadu -636001</span></li><li><span class='text'>+91 98745 6123</span></a></li></ul></td></tr></table></td><td valign='top' width='33.333%' style='padding-top: 20px;'><table role='presentation' cellspacing='0' cellpadding='0' border='0' width='100%'><tr><td style='text-align: left; padding-left: 10px;'><h3 class='heading'>Check US Out</h3><ul><li><a class='hov-link' href='#'>Home</a></li><li><a class='hov-link' href='#'>About</a></li><li><a class='hov-link' href='#'>Services</a></li></ul></td></tr></table></td></tr></table></td></tr></table></div></center></body></html>", "text/html");
      

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        out.println(mex);

        result = "Error: unable to send mail....";

    }
%>

<title>Sending Mail in JSP</title>

<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

<b><center><font color="green"><% out.println(result);%></b>