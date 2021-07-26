<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Thông Tin</title>
</head>
<body>
<div class="container">
<h1 class="text-center mt-5">Thay đổi thông tin cá nhân</h1>

    <div class="form-group">
        <form action="sua" method="post">
            <label for="ten_user" style="color: red;"> Tên Khách Hàng</label>
            
            <input type="text" class="form-control mb-2" id="ten_user"  name="ten_user" value="${nguoidung.tenNguoiDung }"/>
        
            <label for=" diaChi"style="color: red;"> Địa chỉ</label>
            <input type="text" class="form-control mb-2" id=" diaChi" name="diaChi" value="${nguoidung.diaChi }"/>
        
            <label for="fullname" style="color: red;">Tên Đầy Đủ</label>
            <input type="text" class="form-control mb-2 " id="fullname" name="fullname" value="${nguoidung.fullName}" style="color: black;position: static;"/>
        
            <label for="pass" style="color: red;">Pass</label>
            <input type="text" class="form-control mb-2 " id="pass" name="pass" value="${nguoidung.pass }"/>
            
             <label for="sdt" style="color: red;">Sdt</label>
            <input type="text" class="form-control mb-4" id="sdt" name="sdt" value="${nguoidung.std }"/>
             
            <button type="submit" class="btn btn-danger" id="btn-submit">Submit</button>
            <a href="xem-don-hang" class="btn btn-warning text-decoration-none">Trở về trang chủ</a>
       
         </form>
        
	</div>
</div>
<script >
   var button = document.getElementById("btn-submit");
   button.onclick = function(){
   alert("Bạn Đã Update Thành Công");
   }
</script>
</body>
</html>