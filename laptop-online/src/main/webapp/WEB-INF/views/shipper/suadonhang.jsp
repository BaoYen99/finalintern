<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Đơn Hàng</title>

</head>
<body>
<div class="container">
    
<h2 class="text-center mt-5">Thông Tin Đơn Hàng</h2>
    <div class="row">
        <table class="w-100 " border="1" >
                <thead>
                    <tr>
                        <th>Mã Đơn Hàng</th>
                        <th>Tên Người Đặt</th>
                        <th>Địa Chỉ Nhận</th>
                        <th>Số Điện Thoại</th>
                        <th>Mã Người Đặt</th>
                        <th>Trạng Thái Thanh Toán</th>
                        <th>Trạng Thái Đơn Hàng</th> 
                        <th>Loại Hình Thanh Toán</th> 
                        <th>Ngày Đặt Hàng</th>
						<th>Ngày Nhận Hàng</th>
						<th>Ngày Thanh Toán</th> 
                    </tr>
                </thead>
                <tbody>
                  	<tr>
                  	<td>${ donhang.id}</td>
                  	<td>${ donhang.nguoiDung.tenNguoiDung}</td>
                  	<td>${ donhang.diaChiNhan}</td>
                  	<td>${ donhang.sdt}</td>
                  	<td>${ donhang.nguoiDung.id}</td>
                  	<td style="color: rgb(190, 92, 12);">${ donhang.trangThaiThanhToan.tenTrangThai}</td>
                  	<td style="color: rgb(40, 158, 50);">${ donhang.trangThaiDonHang.tenTrangThai}</td>
                  	<td>${ donhang.phuongThucThanhToan.tenPhuongThucThanhToan}</td>
                  	<td>${ donhang.ngayDatHang}</td>
                  	<td>${ donhang.ngayNhanHang}</td>
                  	<td>${ donhang.ngayThanhToan}</td>
                  	</tr>
                </tbody>
                
            </table>
    </div>
<h2 class="text-center mt-5">Thông Tin Cần Thay Đổi</h2>
    <form action="sua-dh" method="post">
        <div class="row">
            <div class="col-12">
        	  <c:if test="${donhang.trangThaiDonHang.id != 1 }">
                <label for="id-ttdonhang" style="color: red;">Trạng Thái Đơn Hàng</label>
                <select class="custom-select mb-2" name="id-ttdonhang">
                        <option value="1">Đã Giao Hàng</option>	
                        <option value="2">Chưa Giao Hàng</option>	
                        <option value="3">Đang Giao Hàng</option>	
                        
                </select>
            </c:if>
            <c:if test="${donhang.trangThaiDonHang.id == 1 }">
                <label for="id-ttdonhang" style="color: red;">Trạng Thái Đơn Hàng</label>
                <select class="custom-select mb-2" name="id-ttdonhang">
                        <option value="1">Đã Giao Hàng</option>	      
                </select>
            </c:if>
            </div>
            <div class="col-12">
               <c:if test="${donhang.trangThaiThanhToan.id == 2 }">
                <label for="id-ttthanhtoan" style="color: red;">Trạng Thái Thanh Toán</label>
                <select class="custom-select mb-2" name="id-ttthanhtoan">
                        <option value="1">Đã Thanh Toán</option>
                        <option value="2" selected="true" >Chưa Thanh Toán</option>       
                </select>
                </c:if> 
                <c:if test="${donhang.trangThaiThanhToan.id == 1 }">
                <label for="id-ttthanhtoan" style="color: red;">Trạng Thái Thanh Toán</label>
                <select class="custom-select mb-2" name="id-ttthanhtoan">
                        <option value="1">Đã Thanh Toán</option>
                              
                </select>
                </c:if> 
                <input value="${page}" name="page1" hidden="true"/>
                  <input value="${limit}" name="limit1" hidden="true"/>
            </div>
            <input value="${donhang.id }" name ="id" hidden="true">
            <input value="${donhang.phuongThucThanhToan.id}" name ="idphuongthucthanhtoan" hidden="true"/>
           
        </div>
         <div class="col-12 mt-3" style="margin-left: -15px;">
             <button class="btn btn-danger" type="submit"> Submit</button> 
            <a href="xem-don-hang-da-chon" class="btn btn-warning" >Trở lại</a> 
            </div>
    </form>
    
</div>

 
		
</body>
</html>