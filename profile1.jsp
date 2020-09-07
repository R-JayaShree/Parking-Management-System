<%@ page language="java" import="java.lang.*" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Bookings</title>
    <link rel="icon" href="park.png">
    <link rel="stylesheet" href="profile1css.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
<script>
function compare(){
 var str=document.getElementById("vehicleno").value;                                                           
 var pattern = /^[A-Z]{2}\s[0-9]{2}\s[A-Z]{1,2}\s[0-9]{4}$/;
 var result = str.match(pattern);                    
 if(result!=null){
   return true;
 }              
else{
  alert("Invalid Vehicle Number..Entry a Valid Number..!");
  return false;
}
}
</script>
<style>
label {
  width: 120px;
  border-radius: 10px;
  border: 1px solid black;
}

/* hide input */
input.radio:empty {
	margin-left: -999px;
}

/* style label */
input.radio:empty + label {
	position: relative;
	float: left;
	line-height: 2.0em;
	text-indent: 2.5em;
  font-size:15px;
	margin-top: 16em;
	margin-left: 0.5em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input.radio:empty + label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: ;
	content: '';
	width: 2em;
	background: #D1D3D4;
	border-radius: 10px 0 0 10px;
}

/* toggle hover */
input.radio:hover:not(:checked) + label:before {
	content:'\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

input.radio:hover:not(:checked) + label {
	color: #888;
}

/* toggle on */
input.radio:checked + label:before {
	content:'\2714';
	text-indent: .7em;
	color: #9CE2AE;
	background-color: #4DCB6D;
}

input.radio:checked + label {
	color: #777;
}

/* radio focus */
input.radio:focus + label:before {
	box-shadow: 0 0 0 3px #999;
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

<form id="myForm" name="myForm" action="bookingconnect.jsp" method="post" onsubmit="profile2.jsp">

<input type="text" placeholder="&nbsp;&nbsp;Vehicle No : TN 05 BP 4527" id="vehicleno" name="vehicleno" style="text-align:center;border:1px solid black;width:244px;
	color: black;height:35px;margin-left:-245px;margin-top:220px;border-radius:10px;"autocomplete="off"  />

 <!--<select  name="vehicletype" class="dpd" placeholder="&nbsp;&nbsp;vehicle Type"   style=" text-align:center;margin-top:20px;width:215px;height:35px;border:1px solid black;
  margin-left: 530px;color:black;border-radius: 10px;" >
	<option value="" selected disabled hidden required>Vehicle Type</option>
  <option type="radio" value="2-Wheeler">2-Wheeler</option>
  <option type="radio" value="4-Wheeler">4-Wheeler</option>
</select><br>-->

<input onclick="document.getElementById('custom').hidden = false; document.getElementById('charstype').hidden = true;" type="radio" name="radio" id="radio1" class="radio" value="2-Wheeler"  hidden/>
<label for="radio1" style="margin-left:510px;margin-top:280px;">2-Wheeler</label>




<input onclick="document.getElementById('custom').hidden = true; document.getElementById('charstype').hidden = false;" type="radio" name="radio" id="radio2" class="radio" value="4-Wheeler"   hidden/>
<label for="radio2" style="margin-top:280px;">4-Wheeler</label>
<br>
<br>

 <select name="fueltype" class="dpd" placeholder="&nbsp;&nbsp;Fuel Type"  style=" text-align:center;margin-top:65px;height:35px;border:1px solid black;
  margin-left: -245px;border-radius: 10px;width:120px;"  >
	<option value="" selected disabled hidden required>Fuel Type</option>
  <option value="Petrol">Petrol</option>
  <option value="Diesel">Diesel</option>
  <option value="Electric">Electric</option>
</select>

  <select name="transmission" class="dpd" placeholder="&nbsp;&nbsp;Transmission" style=" text-align:center;margin-top:60px;height:35px;border:1px solid black;
  margin-left: 5px;color:black;border-radius: 10px;width:115px;" >
	<option value="" selected disabled hidden required>Transmission</option>
  <option value="Automatic">Automatic</option>
  <option value="Manual">Manual</option>
</select>

<div class="con">
<h2 style="font-family:Numans;margin-top:-40px;margin-left:880px;">Payment Method :</h2>
<select name="payment" class="dpd" placeholder="&nbsp;&nbsp;Payment Method"style="width:215px;margin-top:25px;height:35px;border:1px solid black;
  margin-left: 920px;border-radius: 10px;" required >
	<option value="" selected disabled hidden required>&nbsp;&nbsp;Payment Method</option>
  <option value="Cash"><i class="fa fa-money" aria-hidden="true"></i>Cash</option>
  <option value="Paypal">Razorpay</option>
</select></div>


<select name="model"  id="custom" class="dpd" placeholder="&nbsp;&nbsp;Model & Brand" style="text-align:center;border:1px solid black;width:210px;
	color: black;height:35px;margin-left:512px;margin-top:-85px;border-radius:10px;width:246px;" autocomplete="off" >
	<option value="" selected disabled hidden required>Model & Brand</option>
  <option value="Activa">Activa</option>
  <option value="Aprilia">Aprilia</option>
  <option value="Aftek Motors">Aftek Motors</option>
  <option value="Bajaj">Bajaj</option>
  <option value="Benelli">Benelli</option>
  <option value="Bajaj Auto">Bajaj Auto</option>
  <option value="Bajaj Dominar">Bajaj Dominar</option>
  <option value="BMW">BMW</option>
 <option value="CF Moto">CF Moto</option>
<option value="Cleveland CycleWerks">Cleveland CycleWerks</option>
<option value="Dio">Dio</option>
<option value="Ducati">Ducati</option>
<option value="Emflux Motors">Emflux Motors</option>
 <option value="Harley Davidson">Harley Davidson</option>
  <option value="Hero MotorCycles">Hero MotorCycles</option>
 <option value="Honda">Honda</option>
   <option value="Husqvarna">Husqvarna</option>
 <option value="Hero Electric">Hero Electric</option>
<option value="Hero Splender">Hero Splender</option>
 <option value="Indus">Indus</option>
 <option value="Indian MotorCycles">Indian MotorCycles</option>
<option value="Jawa Moto">Jawa Moto</option>
 <option value="Kawasaki">Kawasaki</option>
<option value="KTM">KTM</option>
<option value="KR motors">KR motors</option>
 <option value="Lambretta">Lambretta</option>
 <option value="Lohia">Lohia</option>
<option value="Mahindra">Mahindra</option>
<option value="Moto Guzzi">Moto Guzzi</option>
 <option value="MV Agusta">MV Agusta</option>
 <option value="Norton">Norton</option>
<option value="Okinawa">Okinawa</option>
<option value="Palatino">Palatino</option>
<option value="Pulsar">Pulsar</option>
<option value="Royal Enfield">Royal Enfield</option>
<option value="Revolt">Revolt</option>
<option value="SWM">SWM</option>
<option value="Scooter">Scooter</option>
<option value="Suzuki Access">Suzuki Access</option>
<option value="Triumph">Triumph</option>
<option value="Tork">Tork</option>
<option value="TVS Apache">TVS Apache</option>
<option value="TVS Jupiter">TVS Jupiter</option>
<option value="Vespa">Vespa</option>   
<option value="Yamaha">Yamaha</option>   
<option value="22Kymco">22Kymco</option> 
</select>


<select name="model" class="dpd" id="charstype" placeholder="&nbsp;&nbsp;Model & Brand" style="text-align:center;border:1px solid black;width:210px;
	color: black;height:35px;margin-left:512px;margin-top:-85px;border-radius:10px;width:246px;overflow:scroll;"autocomplete="off" hidden>
	<option value="" selected disabled hidden required>Model & Brand</option>
  <option value="" disabled><b><i>Cars List<i><b></option>
  <option value="Abarth">Abarth</option>
  <option value="Acura">Acura</option>
  <option value="Alfa Romeo">Alfa Romeo</option>
  <option value="Aston Martin">Aston Martin</option>
  <option value="Audi">Audi</option>
  <option value="Bentley">Bentley</option>
  <option value="BMW">BMW</option>
  <option value="Buick">Buick</option>
  <option value="Cadillac">Cadillac</option>
  <option value="Chevrolet">Chevrolet</option>
  <option value="Chrysler">Chrysler</option>
  <option value="Citroen">Citroen</option>
  <option value="Dacia">Dacia</option>
  <option value="Dodge">Dodge</option>
  <option value="Ferrari">Ferrari</option>
  <option value="Fiat">Fiat</option>
  <option value="Ford">Ford</option>
  <option value="GMC">GMC</option>
  <option value="Honda">Honda</option>
  <option value="Hummer">Hummer</option>
  <option value="Hyundai">Hyundai</option>
  <option value="Infiniti">Infiniti</option>
  <option value="Isuzu">Isuzu</option>
  <option value="Jaguar">Jaguar</option>
  <option value="Jeep">Jeep</option>
  <option value="Kia">Kia</option>
  <option value="Lamborghini">Lamborghini</option>
  <option value="Lancia">Lancia</option>
  <option value="Land Rover">Land Rover</option>
  <option value="Lexus">Lexus</option>
  <option value="Lincoln">Lincoln</option>
  <option value="Lotus">Lotus</option>
  <option value="Maserati">Maserati</option>
  <option value="Mazda">Mazda</option>
  <option value="Mercedes-Benz">Mercedes-Benz</option>
  <option value="Mercury">Mercury</option>
  <option value="Mini">Mini</option>
  <option value="Mitsubishi">Mitsubishi</option>
  <option value="Nissan">Nissan</option>
  <option value="Opel">Opel</option>
  <option value="Peugeot">Peugeot</option>
  <option value="Pontiac">Pontiac</option>
  <option value="Porsche">Porsche</option>
  <option value="Ram">Ram</option>
  <option value="Renault">Renault</option>
  <option value="saab">saab</option>
  <option value="Saturn">Saturn</option>
  <option value="Scion">Scion</option>
  <option value="Seat">Seat</option>
  <option value="Skoda">Skoda</option>
  <option value="Smart">Smart</option>
  <option value="SsangYong">SsangYong</option>
  <option value="Subaru">Subaru</option>
  <option value="Suzuki">Suzuki</option>
  <option value="Tesla">Tesla</option>
  <option value="Toyota">Toyota</option>
  <option value="Volkswagen">Volkswagen</option>
  <option value="Volvo">Volvo</option>
  <option value="Wiesmann">Wiesmann</option>
  <option value="" disabled><b><i>Other List<i><b></option>
  <option value="Jeep">Jeep</option>
  <option value="Bus">Bus</option>
  <option value="Lorry">Lorry</option>
  <option value="Other Vehicle">Other Vehicle</option>
</select>

  <input type="text" placeholder="&nbsp;&nbsp;Give it a name(optional)" id="name" name="name" style="text-align:center;border:1px solid black;width:210px;
	color: black;height:35px;margin-left:512px;margin-top:19px;border-radius:10px;width:246px;"autocomplete="off"  />


<div class="sub"><a href="profile2.jsp">
<input type="submit" value="Next" class="login" onclick="return compare();" style="width:90px;padding:8px;font-family:Numans;border-radius:10px;font-size:20px;margin-top:-2%;margin-left:82%;border: 1px solid black;background-color:white;" />
</div>

</form>

  <div class="content">
<div class="div1" style=" border-radius:10px;">
 <h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Booking days :</h5>
<div class="x-box" style= border-radius:10px;>
<h4 style=font-family:Numans;margin-top:15px;color:black;margin-left:10px;>Entry date :</h5>
<h4 style=font-family:Numans;margin-top:10px;color:black;margin-left:3px;><%= session.getAttribute( "thedate" ) %></h5>
</div>
<div class="y-box"style=border-radius:10px;>
<h4 style=font-family:Numans;margin-top:15px;color:black;margin-left:10px;>Exit date :</h5>
<h4 style=font-family:Numans;margin-top:10px;color:black;margin-left:3px;><%= session.getAttribute( "thedate1" ) %></h5>
</div>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Booking period :</h5>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;color:darkblue;><%= session.getAttribute( "thediff" ) %> Days / <%= session.getAttribute( "thetimdiff" ) %> Hours</h5>
<h4 style=font-family:Numans;margin-top:-12px;color:black;margin-left:10px;>__________________</h5>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;>Location :</h5>
<h4 style=font-family:Numans;margin-top:20px;color:black;margin-left:10px;color:darkblue;><%= session.getAttribute( "thelocation" ) %></h5>
<h4 style=font-family:Numans;margin-top:-12px;color:black;margin-left:10px;>__________________</h5>
</div>
</div>
<div class="content">
<div class="div2" style= border-radius:10px;>

  <h1 style="font-family:Numans;font-size:40px;margin-top:20px;margin-left:1px;background: -webkit-linear-gradient(#1A2980,#26D0CE);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;">Vehicle Details</h1>
    <div class="lbox" style="height:330px;  width:300px; margin-left: 52px;">
    </div>
        <div class="co">
<h1 style="font-family:Numans;margin-top:35px;left:80px;">Total :</h1></div>
</div>
</div>
<div class="content">
<div class="vl"></div>
</div>
</div>
</div>
</div>

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