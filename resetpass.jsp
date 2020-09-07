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
<script type="text/javascript">

function checkPass()
{
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    var message = document.getElementById('confirmMessage');
    var goodColor = "green";
    var badColor = "red";
    var g="white";
    if(pass1.value == pass2.value){
        pass2.style.borderColor = goodColor;
        message.style.color = g;
        message.innerHTML = "Passwords Match"
        document.getElementById('submit').disabled = false;
    }else{
        pass2.style.borderColor = badColor;
        message.style.color = g;
        message.innerHTML = "Passwords Do Not Match!"
        document.getElementById('submit').disabled = true;
    }
} 
</script>
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
                    <h3>RESET PASSWORD</h3>
                </div>
                <div class="card-body">
                    <form action="" method="post" id="fileForm" role="form">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input required type="password"  name="password" type="password" class="form-control" minlength="4" maxlength="16"  id="pass1"  placeholder="Password" autofocus>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input required type="password"  class="form-control" placeholder="Confirm Password" name="password" minlength="4" maxlength="16"  id="pass2" onkeyup="checkPass(); return false;"autofocus>
                            <span id="confirmMessage" class="confirmMessage"></span>
                        </div>
                            <div class="form-group">
                           <input  type="submit" value="submit" class="btn float-right login_btn"id="submit" disabled>
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </div>
</body>
</html>    