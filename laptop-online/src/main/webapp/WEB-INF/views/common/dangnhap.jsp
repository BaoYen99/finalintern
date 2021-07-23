<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>login</title>


</head>


<body>
	<div class="contanier"
		style="padding-top: 100px; padding-bottom: 100px; box-sizing: border-box;">
		<div class="wrapper"
			style="padding-top: 20px; box-sizing: border-box; margin: 0 auto; width: 500px; height: 300px; background-color: rgb(131, 145, 145);">
			<h3
				style="margin-left: 170px; margin-bottom: 30px; color: burlywood;">Form
				Log In</h3>
			<div class="form-group " style="margin: 0 auto; width: 400px;">
			<form action="<c:url value='j_spring_security_check' />" method="post">
			
				<input type="text" class="form-control mb-3" name="username" id="username"
					placeholder="User Name"> 
					<input type="password"
					class="form-control mb-3 mt-2" name="password" id="pass"
					placeholder="Password">
				<div class="row">
					<div class="col-6"><a href="/user/trang-chu?page=1&limit=9" style="color: rgb(6, 66, 68);text-decoration: none;">Trang chủ</a></div>
					<div class="col-6 text-right"><a href="/dang-ky" style="color: rgb(6, 66, 68);text-decoration: none;">Đăng ký</a></div>
				</div>
				<button class="btn btn-danger w-50" style="margin-left: 90px;"
					type="submit">Login</a>
				</button>
				</form>
			</div>
		</div>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>