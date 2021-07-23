<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Sản Phẩm</title>
</head>
<body>
<div class="container">
<h1 class="text-center mt-5">Thêm sản phẩm</h1>

    <div class="form-group">
        <form action="them" method="post">
            <label for="ten_san_pham" style="color: red;"> Tên Sản Phẩm</label>
            <input type="text" class="form-control mb-2" id="ten_san_pham" value=""name="ten_san_pham" required="true"/>
        
            <label for=" don_gia"style="color: red;"> Đơn Giá</label>
            <input type="text" class="form-control mb-2" id="don_gia" name="don_gia" value="" required="true"/>
      	   <small id="err-dongia"></small>
            <label for="so_luong_ban" style="color: red;">Số Lượng Bán</label>
            <input type="text" class="form-control mb-2" id="so_luong_ban" name="so_luong_ban" value="0" required="true"/>
        
            <label for="so_luong_kho" style="color: red;">Số Lượng Kho</label>
            <input type="text" class="form-control mb-2" id="so_luong_kho" name="so_luong_kho" value="" required="true"/>
            <small id="err-slkho"></small>
              <label for="cpu" style="color: red;"> Cpu</label>
            <input type="text" class="form-control mb-2" id="cpu" name="cpu" value="" />
        
            <label for=" dung_luong_pin"style="color: red;"> Dung Lượng Pin</label>
            <input type="text" class="form-control mb-2" id="dung_luong_pin" name="dung_luong_pin" value=""/>
        
            <label for="he_dieu_hanh" style="color: red;">Hệ Điều Hành</label>
            <input type="text" class="form-control mb-2" id="he_dieu_hanh" name="he_dieu_hanh" value=""/>
        
            <label for="ram" style="color: red;">Ram</label>
            <input type="text" class="form-control mb-2" id="ram" name="ram" value=""/>
            
             <label for="man_hinh" style="color: red;"> Màn Hình</label>
            <input type="text" class="form-control mb-2" id="man_hinh" name="man_hinh" value=""/>
        
            <label for=" thiet_ke"style="color: red;"> Thiết Kế</label>
            <input type="text" class="form-control mb-2" id="thiet_ke" name="thiet_ke" value=""/>
        
            <label for="thong_tin_bao_hanh" style="color: red;">Thông Tin Bảo Hành</label>
            <input type="text" class="form-control mb-2" id="thong_tin_bao_hanh" name="thong_tin_bao_hanh" value="" />
        
            <label for="thong_tin_chung" style="color: red;">Thông Tin Chung</label>
            <input type="text" class="form-control mb-2" id="thong_tin_chung" name="thong_tin_chung" value=""/>
             
             
             <label for="anh_san_pham" style="color: red;">Ảnh Sản Phẩm</label>
            <input type="text" class="form-control mb-2" id="anh_san_pham" name="anh_san_pham" value="" required="true"/> 
            <small id="err-anh"></small>
             <label for="id-hang" style="color: red;">Hãng Sản Xuất</label>
            <select class="custom-select mb-2" name="id-hang">
					<option value="1">Mac</option>
					<option value="2">Asus</option>
					<option value="3">Acer</option>
					<option value="4">Dell</option>
					<option value="5">Hp</option>
					<option value="6">Lenovo</option>
			</select>
            
            <button type="submit" class="btn btn-danger" id="submit">Submit</button>
           <a href="quan-ly-san-pham?page=1&limit=15"   class="btn btn-warning text-decoration-none">Trở về trang chủ</a>
         </form>
        
</div>

</div>
<script src="/assets/js/themsanpham"></script>
</body>
</html>