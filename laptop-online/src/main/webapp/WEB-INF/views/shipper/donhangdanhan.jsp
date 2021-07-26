<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn Hàng Đã Nhận</title>

</head>
<body>
	<div class="mr-3 ml-3 mt-5" style="margin-bottom: 50px;" >            
	<h3 class="text-center">Danh Sách Đơn Hàng Bạn Phụ Trách</h3>
	
       
        <div class="w-100 ">
       
            <table class="w-100 " border="1" >
                <thead>
                    <tr>
                        <th>Mã Đơn Hàng</th>
                        <th>Tên Người Đặt</th>
                        <th>Địa Chỉ Nhận</th>
                        <th>Số Điện Thoại</th>
                        <th>Mã Người Đặt</th>
                         <th>Ngày Đặt Hàng</th>
                         <th>Ngày Nhận Hàng</th>
                         <th>Ngày Thanh Toán</th>
                        <th>Trạng Thái Thanh Toán</th>
                        <th>Trạng Thái Đơn Hàng</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${donhang}">
                  	<tr>
                  	<td>${ item.id}</td>
                  	<td>${ item.nguoiDung.tenNguoiDung}</td>
                  	<td>${ item.diaChiNhan}</td>
                  	<td>${ item.sdt}</td>
                  	<td >${ item.nguoiDung.id}</td>
                  	<td>${ item.ngayDatHang}</td>
                  	<td>${ item.ngayNhanHang}</td>
                  	<td>${ item.ngayThanhToan}</td>
                  	<td style="color: rgb(190, 92, 12);">${ item.trangThaiThanhToan.tenTrangThai}</td>
                  	<td style="color: rgb(40, 158, 50);">${ item.trangThaiDonHang.tenTrangThai}</td>
                  	
					<td ><a href="xem-chi-tiet-don-hang?id_don_hang=${ item.id}&xemdonhang=${xemdonhang}" class="mr-3">Xem Chi Tiet</a>
					 <c:if test="${ item.trangThaiThanhToan.id != 1 || item.trangThaiDonHang.id !=1}">
				    <a href="sua-don-hang?iddonhang=${item.id}" class="mr-3" style="color: orange;">Sửa</a> 
				    <a href="xoa-khoi-chon?iddonhang=${item.id}" class="mr-3" style="color: purple;">Xóa</a> 
				   </c:if>
				   <c:if test="${ item.trangThaiThanhToan.id == 1 && item.trangThaiDonHang.id ==1}">
				     <div class="text-danger">Đã giao Hàng</div>
				   </c:if>
					
				   
					 
					 
					  </td>
                  	</tr>
                  	</c:forEach>
                </tbody>
                
            </table>
        </div>
        </div>
        
		
</body>

</html>