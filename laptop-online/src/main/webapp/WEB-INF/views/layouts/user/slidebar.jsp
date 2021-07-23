<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

	<div class="col-3">
		<div class="row mt-3">
			<div class="col-12  border text-center" style="height: 100px;">
				<form action="">
					<h2 class="text-center col-10 col-sm-12">Search</h2>
					<input type="search" class="search inline-block col-6 col-md-12 w-75" placeholder="search">
					<button type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<div class="col-12  border  mt-3 " style="height: 100%;">
				<h1 class="text-center">Danh Mục</h1>
				<div class="danh-muc">
					<ul style="list-style-type: none; padding-left: 15%;box-sizing:border-box; ">
						<c:forEach var="item" items="${danhmuc}">
							<li>
									<a href="danh-muc?id=${item.id}&page=1&limit=3" style="text-decoration: none;width: 85%;"class="btn btn-outline-success mb-2">${item.tenHang}</a>
							
								
						</c:forEach>

					</ul>
				</div>
					
			</div>
		</div>	
		
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	