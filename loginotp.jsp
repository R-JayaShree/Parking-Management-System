<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="utf-8"/>
	<link rel="icon" href="park.png">
	<title>Parking-Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="logincss.css">
</head>
<style>

</style>
<body>
<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>
	  
<div class="container">

	<!--<div class="just" style="color:white;float:left;background-color: rgba(0,0,0,0.5) !important;
	width:100px;text-align: center;margin-top:1%;padding-top: 1%;margin-left: -11%;
	font-family: 'Numans', sans-serif;"><h3><a href="design.html" style=color:white;text-decoration:none;> HOME</h3></a></div>-->
	
	<div class="d-flex justify-content-center h-100">
		<div class="card" style="height:300px;">
			<div class="card-header">
				<h3>Sign In</h3>
				
			</div>
			<div class="card-body" style="padding:30px;"> 
				<form action="mailotp.jsp" method="post" ONSUBMIT="otpgene.jsp">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="ema"  autocomplete="off" class="form-control" placeholder="Email" required>
					</div>
					<div class="input-group form-group">
						<!--<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="password"  autocomplete="off" class="form-control" placeholder="OTP" required>-->
					</div>
					<div class="form-group" style="display: flex;align-items: center;justify-content: center;"><a href="otpgene.jsp">
						<input type="submit" value="Submit"  class="btn float-right login_btn"></a>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links" style="color:white;text-align:center;">
					Don't have an account?<a href="index.jsp" style="color:black ;text-align:center;width: 80px; background-color:grey; border: 0 !important ;border-radius:5px;";>Sign Up</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>