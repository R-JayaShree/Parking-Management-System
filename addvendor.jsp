<!DOCTYPE html>
<html lang="en">
	 <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="addvendorcss.css">
    <link rel="icon" href="park.png">
	<title>Parking-Registration</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<head>

</head>
<body>

<!--<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>-->
	  
<div class="container" style="height:1100px;">
	<div class="header">
		<h2 style="margin-top: 6%;">Vendor Form</h2>
	</div>
	<form class="form"  action="vendorconnect.jsp" method="post" onsubmt="adminform.jsp">
        <div class="form-control">
            <label for="vendorname">Vendor Name :</label>
			<input type="text" placeholder="Vendor Name" id="vendorname" name="vendorname" autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="vendorid">Vendor Id :</label>
			<input type="text" placeholder="Vendor Id" id="vendorid" name="vendorid" autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="contactno">Vendor Contact No :  </label>
			<input type="text" placeholder="Contact No" id="contactno" name="contactno" autocomplete="off" required />
        </div>
        <div class="form-control">
            <label for="location">Location :   </label>
			<input type="text" placeholder="Location :" id="location" name="locations" autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="location">Address :   </label>
			<textarea type="text" placeholder="Address :" id="address" name="address" autocomplete="off" required ></textarea>
		</div>
        <div class="form-control">
            <label for="noslots">Total No of Slots :</label>
			<input type="text" placeholder="Total No of Slots" id="noslots" name="noslots" autocomplete="off" required />
		</div>
        <div class="form-control">
            <label for="wheeler2">Slots For Two-Wheelers :</label>
			<input type="text" placeholder="No of Slots For Two-Wheeler" id="wheeler2" name="wheeler2" autocomplete="off" required />
		</div>
		<div class="form-control">
            <label for="wheeler2">Price For Two-Wheelers :</label>
			<input type="text" placeholder="Price For 2-Wheeler per hour" id="wheeler2" name="prize2" autocomplete="off" required />
		</div>
        <div class="form-control">
            <label for="wheeler4">Slots For Four-Wheelers : </label>
			<input type="text" placeholder="No of Slots For Four-Wheeler" id="wheeler4" name="wheeler4" autocomplete="off" required />
        </div>
		<div class="form-control">
            <label for="wheeler2">Price For Four-Wheelers :</label>
			<input type="text" placeholder="Price For 4-Wheeler per hour" id="wheeler2" name="prize4" autocomplete="off" required />
		</div>
        <div class="j"><a href="adminform.jsp" style="text-decoration:none;color:white;">
		<button type="submit" >submit</button></a>
        
    </form>
    </body>
    </html>