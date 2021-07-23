<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>

    <div class="ml-3 mr-3 mt-3">
       
       <c:if test="${sanpham != null}">
       <h2 class="text-center mt-5">Danh Sách Search Sản Phẩm</h2>
        <table class="w-100 " border="1" >
            <thead>
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Ngày Đặt Hàng</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                  <c:forEach var="item" items="${sanpham}">
                  <tr>
                  <td>${ item.id}</td>
                  <td>${ item.teSanPham}</td>
                  <td>${ item.donGia}$</td>
                  <td>
                  	<c:if test="${item.soLuongKho > 0 }"> 
                    	<c:out value = "Còn Hàng" />
                    </c:if>
               		 <c:if test="${item.soLuongKho == 0 }"> 
                        <c:out value = "Hết Hàng"/>
                     </c:if>
                   </td>
                   
                  <td><a href="sua-san-pham?id=${item.id}&page1=1&limit1=12" class="d-inline-block mr-3 ml-5">Edit</a><a href="xoa-san-pham?id=${item.id}">Delete</a></td>
                  </tr>
                  
                  </c:forEach>
            </tbody>
            
        </table>
        </c:if> 
        <c:if test="${nguoidung != null  }">
        <h2 class="text-center mt-5">Danh Sách Search Người Dùng</h2>
       	 <table class="w-100 " border="1" >
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên</th>                      
                        <th>Địa chỉ</th>
                        <th>FullName</th>
                        <th>Số điện Thoại</th>

                    </tr>
                </thead>
                <tbody>
                  	<c:forEach var="item" items="${ nguoidung}">
                  	<tr>
                  	<td>${ item.id}</td>
                  	<td>${ item.tenNguoiDung}</td>
                  	<td>${ item.diaChi}</td>
                  	<td>${ item.fullName}</td>
                  	<td>${ item.std}</td>
                  	</tr>
                  	</c:forEach>
                </tbody>
                
            </table>
         </c:if>
         <c:if test="${donhang != null }">
         <h2 class="text-center mt-5">Danh Sách Search Đơn Hàng</h2>
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
					<td ><a href="xem-chi-tiet-don-hang?id_don_hang=${ item.id}&page1=1&limit1=12" class="mr-3">Xem Chi Tiet</a>
					 <c:if test="${ item.trangThaiThanhToan.id != 1 || item.trangThaiDonHang.id !=1}">
				    <a href="sua-don-hang?iddonhang=${item.id}&page1=1&limit1=12" class="mr-3" style="color: orange;">Sửa</a> 
				   </c:if>
					<%-- <a href="sua-don-hang?iddonhang=${ item.id}" class="mr-3">Sửa</a> --%>
				   <c:if test="${ item.trangThaiThanhToan.id == 1 && item.trangThaiDonHang.id ==1}">
				   <a href="xoa-don-hang?id=${ item.id}&page1=1&limit1=12" style="color: red;" class="mr-3">Xóa</a>
				   </c:if>
					 
					 
					  </td>
                  	</tr>
                  	</c:forEach>
                </tbody>
                
            </table></c:if>
   
    </div>
</body>
</html>