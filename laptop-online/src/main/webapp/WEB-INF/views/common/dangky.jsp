<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>register</title>
</head>

<body>
<div class="contanier" style="padding-top: 20px; padding-bottom:100px;box-sizing: border-box;">
    <div class="wrapper" style="padding-top: 20px;box-sizing: border-box;  margin:0 auto; width: 500px; height: 590px; background-color: rgb(131, 145, 145);">
        <h3 style="margin-left: 170px; margin-bottom:30px;color: burlywood;">Form Register</h3>
        
        <div class="form-group " style="margin:0 auto; width: 400px; ">
            <form action="/register" method="post">
            <small id="err-username"></small>
				<input type="text" class="form-control mb-4" name="ten" id="ten"
					placeholder="UserName" required="true"> 
					
				<small id="err-fullname"></small>
				<input type="text" class="form-control mb-4" name="fullname" id="fullname"
					placeholder="FullName"  required="true">
					
				<small id="err-dc"></small>	
				<input type="text" class="form-control mb-4" name="diachi" id="diachi"
					placeholder="DiaChi"  required="true">
					
					<small id="err-sdt"></small>
				<input type="text" class="form-control mb-4" name="sdt" id="sdt"
					placeholder="Sdt"  required="true">
					
					<small id="err-pass"></small>
				<input type="password"
					class="form-control mb-4 " name="pass" id="pass"
					placeholder="Password"  required="true">
					
					<small id="err-pass-confirm"></small>
				<input type="password"
					class="form-control mb-4 " name="pass-confirm" id="pass-confirm"
					placeholder="Confirm Password"  required="true">
					
				<button class="btn btn-danger w-50" style="margin-left: 90px;"
					type="submit" id="submit">Register
				</button>
				</form>
			
        </div>
    </div>
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="assets/js/dang-ky.js"></script>
</body>
</html>