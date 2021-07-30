<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>


<title>Gio hang</title>
</head>

<main>
	<div class="container " style="margin-bottom: 295px;">
	
		<div class="row mt-5">
			<div class="col-9 ">
			<h1 class="mb-3 ">Thông Tin Giỏ Hàng</h1>
			<div class="row border  ">
			
					<div class="col-1 border" style="padding-right: -10px;box-sizing: border-box;" >
						Ảnh
					</div>
					<div class="col-6 border text-center"> Tên sản phẩm</div>
					<div class="col-2 border text-center"> Giá</div>
					<div class="col-2 border text-center"> Số Lượng </div>
					<div class="col-1 border text-center"> Xóa</div>
				</div>
			<%-- <c:set var = "total" value = "${0}"/>		 --%>	 
			<c:forEach var="item" items="${ sessionScope.cart}">	
			<c:set var="id_gio_hang" value="${item.value.gioHang.id }"/>		
				<div class="row border ">
					<div class="col-1 border text-center" >
						<img src="/images/${item.value.sanPham.anhSanPham }" width="70px" height="70px" alt="error" style="display: block;margin-left: -15px;"> 
					</div>
					<div class="col-6 border text-center">${item.value.sanPham.teSanPham }</div>
					<div class="col-2 border text-center" id="dongia"> ${item.value.sanPham.donGia*item.value.soLuong}$</div>
					<div class="col-2 border">${ item.value.soLuong} </div>
					<div class="col-1 border text-center"><a href="gio-hang-remove?id=${item.value.sanPham.id}"><i class="fas fa-trash-alt"></i></a></div>
				</div>
				 <%-- <c:set var = "tongtien" scope = "session" value = "${total=total+(item.value.sanPham.donGia*item.value.soLuong)}"/> --%>
				</c:forEach>
				<div class="total text-right text-danger">Tổng tiền: ${sessionScope.tongtien}$</div>
				
				
				
			</div>
			<div class="col-3">
				<h1>Lap top shop</h1>
				<div class="form-group">
						<a href="trang-chu?page=1&limit=9" class=" form-control btn btn-secondary mt-2 text-light text-decoration-none">Tiếp tục shopping</a>
				
						<a href="gio-hang-remove-all?id_gio_hang=${id_gio_hang}" class="form-control btn btn-secondary mt-2 mb-2 text-light text-decoration-none">Xóa hết sản phẩm</a>

						<a href="don-hang" class="form-control btn btn-secondary text-light text-decoration-none">Đặt Hàng</a>
						
				</div>
			</div>
		</div>
		<div>${alert }</div>
	</div>
</main>

