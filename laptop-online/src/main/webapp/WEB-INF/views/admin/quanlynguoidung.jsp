<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Người Dùng</title>
</head>
<body>

 <div class="container mt-5">
 <form action="quan-ly-nguoi-dung" id="formSubmit" method="get">
  		 <h3 class="text-center">Danh Sách Người Dùng</h3>
  		<a href="them-admin" class="btn btn-success">Thêm Admin</a>
        <div class="w-100 mt-4">
       
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
                  	<c:forEach var="item" items="${ nguoidung.listResult}">
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
            <div style="margin:  0 auto; width: 320px; height: 50px;"><ul class="pagination mt-2" id="pagination"></ul>	</div>
							<input type="hidden" value="" id="page" name="page"/>
					<input type="hidden" value="" id="limit" name="limit"/>
        </div>
        
     </form>
    </div>
  
	<script>
		var totalPages = ${nguoidung.totalPage};
		var currentPage = ${nguoidung.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 4,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(14);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	</script>

</body>
</html>