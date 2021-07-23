<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt hàng</title>
</head>
<body>
	<div class="container mt-4" style="margin-bottom: 47px;">
		<div class="row">
			<div class="col-8">
			<h3>Thông tin Sản Phẩm</h3>
			<hr/>
				<div class="row ml-1">
						<div class="col-2 border"
							style="padding-right: -10px; box-sizing: border-box;">Ảnh</div>
						<div class="col-5 border text-center">Tên sản phẩm</div>
						<div class="col-2 border text-center">Giá</div>
						<div class="col-2 border text-center">Số Lượng</div>
						
				</div>
				<%-- <c:set var = "total" value = "${0}"/>	 --%>		 
				<c:forEach var="item" items="${ sessionScope.cart}">	
				<c:set var="id_gio_hang" value="${item.value.gioHang.id }"/>
							
				<div class="row ml-1">
					<div class="col-2 border text-center" >
						<img src="/images/${item.value.sanPham.anhSanPham }" width="70px" height="70px" alt="error" style="display: block;margin-left: -15px;"> 
					</div>
					<div class="col-5 border text-center">${item.value.sanPham.teSanPham }</div>
					<div class="col-2 border text-center"> ${item.value.sanPham.donGia*item.value.soLuong}$</div>
					<div class="col-2 border text-center"> ${ item.value.soLuong}</div>
					
				</div>
				<%--  <c:set var = "tongtien" scope = "session" value = "${total=total+(item.value.sanPham.donGia*item.value.soLuong)}"/> --%>
				
				</c:forEach>
				<div class="total text-right text-danger" style="margin-right: 40px;">Tổng tiền: ${sessionScope.tongtien}$</div>
			</div>
			<div class="col-4">
			
				<form action="hoan-thanh-dat-hang"  method="post">
					<h3>Thông tin người mua</h3>
					<hr>
					<div class="mb-3">
						
						<label for="ten" class="form-label">Họ và tên người nhận</label>
						 <input type="text" class="form-control" name="ten" id="ten" aria-describedby="ten1" required="true">
						 <small id="err-ten"></small>

					</div>
					<div class="mb-3">
						<label for="sdt" class="form-label">Số điện thoại</label>
						 <input type="text" class="form-control" name="sdt" id="sdt"required="true">
						<small id="err-sdt"></small>
					</div>
					<div class="mb-3 "  >

						<label  for="diachi">Địa chỉ nhận hàng</label>
						<textarea name="diachi" id="diachi" cols="47" rows="5" required="true"></textarea>
						<small id="err-dc"></small>
					</div>
					<div class="mb-3 "  >
					<label for="thanhtoan" style="color: red;">Loại Hình Thanh Toán</label>
						 <select class="custom-select mb-2" name="thanhtoan" id="thanhtoan">
							<option value="1">Trực Tiếp</option>
							<option value="2">Ngân Hàng</option>
						</select>
					</div>
					<input name="id" value="${id_gio_hang}" hidden= "true"/>
					<c:if test="${id_gio_hang != null}">
						<button  class="btn btn-primary" id="btn-submit" type="submit">Submit</button>
					</c:if>				
				</form>	
			</div>
		</div>
	</div>
		
	<script src="/assets/js/donhang.js"></script>
</body>
</html>