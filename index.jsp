<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" type="text/css" href="register.css">
    <link rel="icon" href="park.png">
	<title>Parking-Registration</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<head>
</head>
<body>
<div class="videobg">
		<video autoplay loop muted>
		  <source src="video.mp4" type="video/mp4">
		</video>
	  </div>
<div class="container">
	<div class="header">
		<h2 style="margin-top: 6%;">Registration Form</h2>
	</div>
	<form class="form" onclick="return checkInputs()" action="connect.jsp" method="post" onsubmt="reg.jsp">
        <div class="form-control">
            <label for="name">          </label>
            <!--<span class="input-group-text"><i class="fas fa-user"></i></span>-->
			<input type="text" placeholder="Name" id="name" name="name" autocomplete="off" required pattern="[\sA-Za-z0-9]{3,20}" title="Ex:User" oninvalid="this.setCustomValidation('Please Enter valid Name')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		<div class="form-control">
            <label for="username">              </label>
            <!--<span class="input-group-text"><i class="fas fa-user-circle"></i></span>-->
			<input type="text" placeholder="Username" id="username" name="username" autocomplete="off" required pattern="[A-Z]{1}[a-z0-9]{3,20}" title="Ex:Username" oninvalid="this.setCustomValidation('Please Enter valid username')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
        </div>
        <div class="form-control">
            <label for="password">              </label>
            <!--<span class="input-group-text"><i class="fas fa-key"></i></span>-->
			<input type="password" placeholder="Password: User*/@123" id="password" name="password" autocomplete="off" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Ex:User*/@123" oninvalid="this.setCustomValidation('Please Enter valid Password')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="dob">       </label>
            <!--<span class="input-group-text"><i class="fas fa-calendar"></i></span>-->
			<input type="text" placeholder="DOB: DD/MM/YYYY" id="dob" name="dob" autocomplete="off" required pattern="^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$" title="DD/MM/YYYY" oninvalid="this.setCustomValidation('Please Enter valid Date Of Birth')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="address">               </label>
            <!--<span class="input-group-text"><i class="fas fa-address-book"></i></span>-->
			<textarea type="text" placeholder="Address" id="address" name="address" autocomplete="off" required pattern="[a-zA-Z]" title="Address..." oninvalid="this.setCustomValidation('Please Enter valid Address')" oninput="setCustomValidation('')"></textarea>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small class="t-area">Error message</small>
        </div>
        <div class="form-control">
            <label for="phone">                 </label>
            <!--<span class="input-group-text"><i class="fas fa-phone"></i></span>-->
			<input type="text" placeholder="Phone Number" id="phone" name="phone" autocomplete="off" required pattern="(\d{10})" title="9876543210" oninvalid="this.setCustomValidation('Please Enter valid PhoneNo')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
        <div class="form-control">
            <label for="username">          </label>
            <!--<span class="input-group-text"><i class="fas fa-envelope"></i></span>-->
			<input type="email" placeholder="E-Mail ID" id="email" name="email" autocomplete="off" required pattern="((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])" title="user@gmail.com" oninvalid="this.setCustomValidation('Please Enter valid Email')" oninput="setCustomValidation('')" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
        </div>
        <div class="form-control">
            <label for="adhar">                 </label>
            <!--<span class="input-group-text"><i class="fas fa-id-card"></i></span>-->
			<input type="text" placeholder="Aadhar Number" id="adhar" name="adhar" autocomplete="off" required pattern="(\d{4}\s\d{4}\s\d{4})" title="345324547894" oninvalid="this.setCustomValidation('Please Enter valid AadharNumber')" oninput="setCustomValidation('')"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		<button type="submit">submit</button>
        
    </form>
    <div class="d-flex justify-content-center links" style="margin-left:70px;color:white">
        Already Having an Account?&nbsp;&nbsp;<a href="login.jsp" style="color:black ; background-color:grey;text-align:center;width: 80px;text-decoration: none;border-radius:2px;";>Sign In</a>
    </div>
   
    <script>
        const form = document.getElementById('form');
        const username = document.getElementById('username');
        const name = document.getElementById('name');
        const address =document.getElementById('address');
        const email = document.getElementById('email');
        const password = document.getElementById('password');
        const dob = document.getElementById('dob');
        const phone = document.getElementById('phone');
        const adhar = document.getElementById('adhar');
         form.addEventListener("submit", (e) => {
            e.preventDefault();
            checkInputs();
        });
       
        
        function checkInputs() {
            const usernameValue = username.value.trim();
            const nameValue = name.value.trim();
            const addressValue = address.value.trim();
            const emailValue = email.value.trim();
            const passwordValue = password.value.trim();
            const dobValue = dob.value.trim();
            const phoneValue = phone.value.trim();
            const adharValue = adhar.value.trim();
            if(usernameValue === '') {
                setErrorFor(username, 'Username cannot be blank');
            } else {
                setSuccessFor(username);
            }
            if(nameValue === '') {
                setErrorFor(name, 'Name cannot be blank');
            } else {
                setSuccessFor(name);
            }
            if(passwordValue === '') {
                setErrorFor(password, 'Password cannot be blank');
            }else if(!(isPassword(passwordValue)))
            {
                setErrorFor(password,'Invalid Password')
            }
            else {
                setSuccessFor(password);
            }
            if(addressValue === '') {
                setErrorFor(address,'Address cannot be blank');
            } else {
                setSuccessFor(address);
            }
            if(emailValue === '') {
                setErrorFor(email, 'Email cannot be blank');
            } else if (!isEmail(emailValue)) {
                setErrorFor(email, 'Not a valid email');
            } else {
                setSuccessFor(email);
            }
		    if (dobValue === null || dobValue === "") {
            setErrorFor(dob, 'DOB cannot be blank');
		    } else if(!isDob(dobValue)){
            setErrorFor(dob, 'Not a valid DOB');
            }
            else{
            setSuccessFor(dob);
            }
            
            if (phoneValue === null || phoneValue === "") {
            setErrorFor(phone, 'Mobile Number cannot be blank');
		    } else if(!(isPhone(phoneValue))){
            setErrorFor(phone, 'Not a valid Mobile Number');
            }
            else{
            setSuccessFor(phone);
            }
            
            if(adharValue === null || adharValue === "")
            {
                setErrorFor(adhar, 'Aadhar Number cannot be blank');
            }
            else if(!isAdhar(adharValue)){
            setErrorFor(adhar, 'Not a valid Mobile Number');
            }
            else{
            setSuccessFor(adhar);
            }
        }
        
        function setErrorFor(input, message) {
            const formControl = input.parentElement;
            const small = formControl.querySelector('small');
            formControl.className = 'form-control error';
            small.innerText = message;
        }
        function setSuccessFor(input) {
            const formControl = input.parentElement;
            formControl.className = 'form-control success';
        }
        function isPassword(password) {
            return  /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/.test(password);
        }
        function isEmail(email) {
            return /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/.test(email);
        }
        function isDob(dob) {
            return /^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/.test(dob);
        }
        function isPhone(phone) {
            return /^(\d{10})$/.test(phone);
        }
        function isAdhar(adhar) {
            return /^(\d{4}\s\d{4}\s\d{4})$/.test(adhar);
        }
        </script>
</body>
</html>