<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home-Page</title>
    <link rel="icon" href="park.png">
   <!-- <link rel="stylesheet" href="style.css">-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
    *{
  margin: 0;
  padding: 0;
  list-style: none;
  text-decoration: none;
}
body{
  background: url("w.jpg");
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
    </style>
  </head>
  <body>
 
    <nav>
      <label class="logo">Parking Allotment</label>
      <ul>
<li><a class="active" href="#">Home</a></li>
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
  </body>
</html>
