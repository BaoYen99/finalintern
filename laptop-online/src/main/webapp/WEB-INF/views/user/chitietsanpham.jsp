<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@page import="com.baoyen.utils.SecurityUtils"%>

<head>
<title>Chi Tiết Sản Phẩm</title>
</head>
<body>

	<div class="container mb-1">
		<div class="row mt-5">
			
			<div class="col-9" style="height: 500px">
				<h2>${sanpham.teSanPham}</h2>
				<div class="row border">
					<div class="col-6  mt-3">
						<img src="/images/${sanpham.anhSanPham }"
							width="100%" height="95%;" alt="error">
					</div>


					<div class="col-6 " style="margin-left: -30px">
						<ul style="list-style-type: none;">
							<li><b>Cpu :</b> ${  sanpham.cpu}</li>
							<li><b>Đơn giá :</b> ${ 	sanpham.donGia}</li>
							<li><b>Số lượng bán :</b> ${  sanpham.soLuongBan}</li>
							<li><b>Số lượng kho:</b> ${  sanpham.soLuongKho}</li>
							<li><b>Dung lượng pin:</b> ${  sanpham.dungLuongPin}</li>
							<li><b>Hệ điều hành :</b> ${  sanpham.heDieuHanh}</li>
							<li><b>Màn hình : </b> ${  sanpham.manHinh}</li>
							<li><b>Ram :</b> ${  sanpham.ram}</li>
							<li><b>Thiết kế : </b> ${  sanpham.thietKe}</li>
							<li><b>Thông tin bảo hành : </b> ${  sanpham.thongTinBaoHanh}</li>
							<li><b>Thông tin chung :</b> ${  sanpham.thongTinchung}</li>


						</ul>
					</div>
					
				</div>
			</div>
			<div class="col-3">
				<h1>Lap top shop</h1>
				<div class="form-group ">
						<a href="trang-chu?page=1&limit=9" class=" btn form-control mb-2 btn-secondary text-light text-decoration-none">Trở
							về trang chủ</a>
							
							<c:if test="${sanpham.soLuongKho <= 0 }"> 
                  	  				<p style="text-align: center;color :red ;background-color:yellow; margin-top: 15px ;border: 1px solid black">Hết Hàng</p>
                  	  		</c:if>
						<security:authorize access="isAnonymous()">
							<a href="/dang-nhap" class="text-light text-decoration-none form-control mb-2 btn-secondary text-center"id="icon">Thêm vào giỏ hàng</a>
						</security:authorize>
						
						<security:authorize access = "isAuthenticated()">
						<% if(SecurityUtils.getAuthorities().contains("USER")){
										 %>
									<a href="gio-hang?id=${sanpham.id}" class="btn form-control mb-2 btn-secondary text-light text-decoration-none " id="icon" >Thêm vào giỏ hàng</a>
									<% } %>
						</security:authorize>
								
						<input  value="${sanpham.soLuongKho}" id="sl"  hidden/>
						
					
				</div>
			</div>
		

		</div>
	</div>
	<script src="/assets/js/trangchu-user.js"></script>
</body>
</html>