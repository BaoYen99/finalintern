<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.baoyen.utils.SecurityUtils" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css">
</head>
<header>
	
<nav class="navbar navbar-expand-lg navbar-light bg-warning" >
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<a class="navbar-brand" href="#">Laptop</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/user/trang-chu?page=1&limit=9"><i class="fas fa-home"></i></a>
      </li>
      <% if(SecurityUtils.getAuthorities().contains("ADMIN")){ %>
     <li class="nav-item active">
        <a class="nav-link ml-5" href="/admin/quan-ly-nguoi-dung?page=1&limit=14">Người Dùng</i></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/admin/quan-ly-san-pham?page=1&limit=14">Sản Phẩm</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/admin/quan-ly-don-hang?page=1&limit=10">Đơn Hàng</a>
      </li>
      <li>
      <form action="/admin/search" method="post">
			<select  style="margin-left: 110px;" name="luachon">
				<option value="1">Người Dùng</option>
				<option value="2">Sản Phẩm</option>
				<option value="3">Đơn Hàng</option>	
							
			</select> 
			<input type="search" class="search inline-block  mt-1" placeholder="search" style="margin-left: 5px;outline: none;" name="search">
				<!-- <button type="submit" id="search"><i class="fas fa-search"></i></button></li> -->
      </form>
      
      <%} %>
    </ul>
    <ul class="navbar-nav text-right">
      
      <security:authorize access = "isAnonymous()">
      <div class="dropdown ml-3">
						<button type="button" class="btn btn-warning dropdown-toggle"
							data-toggle="dropdown">
							<i class="fas fa-user-circle"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="/dang-nhap"><i class="fas fa-sign-in-alt"> Đăng nhập </i> </a> <a
								class="dropdown-item" href="/dang-ky"><i class="fas fa-registered"> Đăng Ký</i> </a>

						</div>
					</div>
		</security:authorize>
		<security:authorize access = "isAuthenticated()">
		<li class="nav-item mt-2 mr-4">
			<% if(SecurityUtils.getAuthorities().contains("USER")) {%>
					Xin chào , <b><%= SecurityUtils.getPrincipal().getFullName() %></b>
			<%} %>
			<% if(SecurityUtils.getAuthorities().contains("ADMIN")){ %>
					Xin chào Admin, <b><%= SecurityUtils.getPrincipal().getFullName() %></b>
			<%} %>
		</li>
			<% if(SecurityUtils.getAuthorities().contains("USER")) {%>
			<li class="nav-item"><a class="nav-link" href="xem-gio-hang"><i class="fas fa-cart-plus"></i></a></li>
			<%} %>
			
					<div class="dropdown ml-3">
						<button type="button" class="btn btn-warning dropdown-toggle"
							data-toggle="dropdown" ">
							<i class="fas fa-user-circle"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="/thoat"><i
								class="fas fa-sign-out-alt"> Đăng Xuất</i> </a>
							 <a
								class="dropdown-item" href="/user/sua-thong-tin"><i
								class="fas fa-user-edit"> Sửa Thông Tin</i> </a>
								<%-- <% if (SecurityUtils.getPrincipal().getUsername().equals("admin")==true){	
								%>
									<a class="dropdown-item" href="/admin/trang-chu"><i class="fas fa-home"> Quay lại Trang Admin</i> </a>
								<% 
								}
								%> --%>

						</div>
					</div>
				</security:authorize>
      
    </ul>
  </div>
</nav>
	
</header>
<script src="/assets/bootstrap/bootstrap.min.js"></script>
<script src="/assets/bootstrap/jquery.min.js"></script>
