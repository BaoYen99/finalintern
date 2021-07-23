<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>

</head>
<body>
<div class="container mt-5">
 <form action="quan-ly-san-pham" id="formSubmit" method="get">
    <a href="them-san-pham" class="btn btn-outline-primary btn-lg active" role="button" aria-pressed="true">Thêm sản phẩm</a>
  		 <div >
            <h3 class="text-center">Danh Sách Sản Phẩm</h3>
        </div>
        <div class="w-100 ">
       
            <table class="w-100 " border="1" >
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Trạng Thái</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                  	<c:forEach var="item" items="${ sanpham.listResult}">
                  	<tr>
                  	<td>${ item.id}</td>
                  	<td>${ item.teSanPham}</td>
                  	<td>${ item.donGia}$</td>
                  	<td><c:if test="${item.soLuongKho > 0 }"> 
                  	  <c:out value = "Còn Hàng" />
                  	  </c:if>
                    <c:if test="${item.soLuongKho == 0 }"> 
                  	 	 <c:out value = "Hết Hàng"/>
                  	   </c:if>
                  	 </td>
                  	<td><a href="sua-san-pham?id=${item.id}&page1=${sanpham.page}&limit1=${sanpham.limit}" class="d-inline-block mr-3 ml-5">Edit</a><a href="xoa-san-pham?id=${item.id}">Delete</a></td>
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
		var totalPages = ${sanpham.totalPage};
		var currentPage = ${sanpham.page};
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