<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Đơn Hàng</title>
</head>
<body>

 <div class="ml-3 mr-3 mt-5">
 <form action="quan-ly-don-hang" id="formSubmit" method="get">
  		 <div >
            <h3 class="text-center">Danh Sách Đơn Hàng</h3>
        </div>
        <div class="w-100 ">
       
            <table class="w-100 " border="1" >
                <thead>
                    <tr>
                        <th>Mã Đơn Hàng</th>
                        <th>Tên Người Đặt</th>
                        <th>Địa Chỉ Nhận</th>
                        <th>Số Điện Thoại</th>
                        <th>Mã Shipper Đảm Nhận</th>
                         <th>Ngày Đặt Hàng</th>
                         <th>Ngày Nhận Hàng</th>
                         <th>Ngày Thanh Toán</th>
                        <th>Trạng Thái Thanh Toán</th>
                        <th>Trạng Thái Đơn Hàng</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${donhang.listResult}">
                  	<tr>
                  	<td>${ item.id}</td>
                  	<td>${ item.nguoiDung.tenNguoiDung}</td>
                  	<td>${ item.diaChiNhan}</td>
                  	<td>${ item.sdt}</td>
                  	<td >${ item.idShipper}</td>
                  	<td>${ item.ngayDatHang}</td>
                  	<td>${ item.ngayNhanHang}</td>
                  	<td>${ item.ngayThanhToan}</td>
                  	<td style="color: rgb(190, 92, 12);">${ item.trangThaiThanhToan.tenTrangThai}</td>
                  	<td style="color: rgb(40, 158, 50);">${ item.trangThaiDonHang.tenTrangThai}</td>
                  	
					<td ><a href="xem-chi-tiet-don-hang?id_don_hang=${ item.id}&page1=${donhang.page}&limit1=${donhang.limit}" class="mr-3">Xem Chi Tiet</a>
					 <%-- <c:if test="${ item.trangThaiThanhToan.id != 1 || item.trangThaiDonHang.id !=1}">
				    <a href="sua-don-hang?iddonhang=${item.id}&page1=${donhang.page}&limit1=${donhang.limit}" class="mr-3" style="color: orange;">Sửa</a> 
				   </c:if> --%>
					<%-- <a href="sua-don-hang?iddonhang=${ item.id}" class="mr-3">Sửa</a> --%>
				   <c:if test="${ item.trangThaiThanhToan.id == 1 && item.trangThaiDonHang.id ==1}">
				   <a href="xoa-don-hang?id=${ item.id}&page1=${donhang.page}&limit1=${donhang.limit}" style="color: red;" class="mr-3">Xóa</a>
				   </c:if>
					 
					 
					  </td>
                  	</tr>
                  	</c:forEach>
                </tbody>
                
            </table>
        </div>
        <div style="margin:  0 auto; width: 320px; height: 50px;"><ul class="pagination mt-2" id="pagination"></ul>	</div>
							<input type="hidden" value="" id="page" name="page"/>
					<input type="hidden" value="" id="limit" name="limit"/>
     </form>
    </div>
    
	<script>
		var totalPages = ${donhang.totalPage};
		var currentPage = ${donhang.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 4,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(10);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	</script>
 
</body>
</html>