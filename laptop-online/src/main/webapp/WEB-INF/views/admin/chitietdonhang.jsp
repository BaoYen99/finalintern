<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiet Đơn Hàng</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-5">Chi Tiết Đơn Hàng</h1>

		<div class="w-100 ">

			<table class="w-100 " border="1">
				<thead>
					<tr>
						<th>Mã</th>
						<th>Đơn Giá</th>
						<th>Số Lượng</th>

						<th>Mã Đơn Hàng</th>
						<th>Mã Sản Phẩm</th>
						<th>Tên Người Mua</th>
						<th>Tên Sản Phẩm</th>
						<th>Phương Thức Thanh Toán</th>
						<th>Ngày Đặt Hàng</th>
						<th>Ngày Nhận Hàng</th>
						<th>Ngày Thanh Toán</th>


					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${chitietdonhang}">
						<c:set var="tongtien" value="${item.tongTien}" />
						<c:set var="trangthai" value="${item.donHang.trangThaiThanhToan.tenTrangThai}"/>
						<c:set var="trangthaidonhang" value="${item.donHang.trangThaiDonHang.tenTrangThai}"/>
						
						<tr>
							<td>${ item.id}</td>
							<td>${ item.donGia}</td>
							<td>${ item.soLuong}</td>

							<td>${ item.donHang.id}</td>
							<td>${ item.sanPham.id}</td>
							<td>${ item.donHang.nguoiDung.tenNguoiDung}</td>
							<td>${ item.sanPham.teSanPham}</td>
							<td>${ item.donHang.phuongThucThanhToan.tenPhuongThucThanhToan}</td>
							<td>${ item.donHang.ngayDatHang}</td>
							<td>${ item.donHang.ngayNhanHang}</td>
							<td>${ item.donHang.ngayThanhToan}</td>
						</tr>

					</c:forEach>
				</tbody>

			</table>
			<p class="mt-4 ">Tổng Tiền: ${tongtien}$    <b style="color: red; margin-right: 10px;margin-left: 10px;">${trangthai}</b>    <b style="color: orange ;">${trangthaidonhang}</b></p>
		</div>

		
			<a href="quan-ly-don-hang?page=${page}&limit=${limit}"  class=" btn btn-outline-secondary text-decoration-none text-dark">Trở Về</a>
		
	</div>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>