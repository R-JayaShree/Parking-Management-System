<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="utf-8"/>
    <link rel="icon" href="park.png">
	<title>Parking-ForgotPassword</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="forgotcss.css">
</head>
<body>
<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>FORGOT PASSWORD</h3>
                </div>
                <div class="card-body">
                    <form action="mailProcess.jsp" method="post">
                        <div class="input-group form-group">
                            <p class="aim">Please enter your email address below and we will send you information to change your password.</p>
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" name="mail" class="form-control" placeholder="Email" autocomplete="off" />
                        </div>
                        <div class="form-group">
                           <input  type="submit" value="Send" class="btn float-right login_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </div>
</body>
</html>    