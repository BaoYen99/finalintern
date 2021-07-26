<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.baoyen.utils.SecurityUtils" %>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css">
</head>
<header>
	
<nav class="navbar navbar-expand-lg navbar-light bg-warning">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<a class="navbar-brand" href="#">Laptop</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="xem-don-hang"><i class="fas fa-home"></i></a>
      </li><li class="nav-item active">
        <a class="nav-link ml-5" href="xem-don-hang-da-chon">Đơn Hàng Đã Chọn</i></a>
      </li>
     
   
    </ul>
    <ul class="navbar-nav text-right">
    
		<security:authorize access = "isAuthenticated()">
		<li class="nav-item mt-2 mr-4">
		Xin chào Shipper, <b><%= SecurityUtils.getPrincipal().getFullName() %></b>
		</li>
			<div class="dropdown ml-3">
						<button type="button" class="btn btn-warning dropdown-toggle"
							data-toggle="dropdown">
							<i class="fas fa-user-circle"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							 <a class="dropdown-item" href="/thoat"><i class="fas fa-sign-out-alt"> Đăng xuất</i> </a>
							<a
								class="dropdown-item" href="/shipper/sua-thong-tin"><i
								class="fas fa-user-edit"> Sửa Thông Tin</i> </a>
						</div>
					</div>
		</security:authorize>
      
    </ul>
  </div>
</nav>
	
</header>
<script src="/assets/bootstrap/bootstrap.min.js"></script>
<script src="/assets/bootstrap/jquery.min.js"></script>


