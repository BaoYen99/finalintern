<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Sản Phẩm</title>
</head>
<body>
<div class="container">
<h1 class="text-center mt-5">Thay đổi thông tin sản phẩm</h1>

    <div class="form-group">
        <form action="sua" method="post">
            <label for="ten_san_pham" style="color: red;"> Tên Sản Phẩm</label>
            <input type="text" class="form-control mb-2" id="id"  name="id" value="${sanpham.id}" hidden="true"/>
            <input type="text" class="form-control mb-2" id="ten_san_pham"  name="ten_san_pham" value="${sanpham.teSanPham }" disabled="disabled"/>
        
            <label for=" don_gia"style="color: red;"> Đơn Giá</label>
            <input type="text" class="form-control mb-2" id="don_gia" name="don_gia" value="${sanpham.donGia }"/>
            <small id="err-dongia" class="d-block"></small>
        
            <label for="so_luong_kho" style="color: red;">Số Lượng Kho</label>
            <input type="text" class="form-control mb-2" id="so_luong_kho" name="so_luong_kho" value="${sanpham.soLuongKho }"/>
            <small id="err-slkho" class="d-block mb-2"></small>
			<input value="${page}" name="page1" hidden="true"/>
             <input value="${limit}" name="limit1" hidden="true"/>
            <button type="submit" class="btn btn-danger" id="btn-submit">Submit</button>
            <a href="quan-ly-san-pham?page=${page}&limit=${limit}"  class="btn btn-warning text-decoration-none">Trở về</a>
         </form>
        
</div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/assets/js/suathongtinsanpham.js"></script>
</body>
</html>