<%@page import="com.baoyen.utils.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<head>
<title>Danh Muc</title>
</head>
<body>
	<main>
	<form action="danh-muc" id="formSubmit" method="get">
		<div class="container-fluid" style="margin-bottom: 15px;">
			<div class="row ml-2 mt-2">
				<%@include file="/WEB-INF/views/layouts/user/slidebar.jsp"%>
				<div class="col-9">
					<div class="row mt-3">
						<c:forEach var="item" items="${sanpham.listResult}">
						<c:set var="id" scope = "session" value = "${item.danhMuc.id}"/>
						<div class="col-4 " style="width: 100%; height: 450px;">
							<div class="card" style="width: 100%; height: 400px;">
								<img src="/images/${item.anhSanPham}" class="card-img-top"
									alt="..." height="180px">
								<div class="card-body">
									<h5 class="card-title">${item.teSanPham}</h5>
									<p class="card-text " style="
									overflow: hidden;
									text-overflow: ellipsis;
									-webkit-line-clamp: 3;
									display: -webkit-box;
									-webkit-box-orient: vertical;">${item.thongTinchung}
									</p>
									<div class="card-body">
    									<c:if test="${item.soLuongKho == 0 }"> 
                  	  							<p style="color :red ;margin-bottom: 2px; margin-top: -15px">Hết Hàng</p>
                  	  					</c:if>
    								<security:authorize access = "isAnonymous()">
										
										<p  style="display: inline-block;" id="icon">	<a href="/dang-nhap" class="d-inline-block mr-5 " ><i class="fas fa-cart-plus"></i></a></p>
									</security:authorize>
									<security:authorize access = "isAuthenticated()">
									<% if (SecurityUtils.getAuthorities().contains("USER")){
										 %>
										<c:if test="${item.soLuongKho == 0}">
									 	<p  style="display: none;" >	<a href="gio-hang?id=${item.id}" class="d-inline-block mr-5 " ><i class="fas fa-cart-plus"></i></a></p>
									 	</c:if>
									 	<c:if test="${item.soLuongKho != 0}">
									 	<p  style="display: inline-block;" >	<a href="gio-hang?id=${item.id}" class="d-inline-block mr-5 " ><i class="fas fa-cart-plus"></i></a></p>
									 	</c:if>
									<%} %>		 
										</security:authorize>
    									<a href="chi-tiet?id=${item.id }" class="card-link d-inline-block  mr-5" >Details</a>
    									<p class="card-text d-inline-block" >${item.donGia}$</p>
    									
  									</div>
									
								</div>
							</div>
						</div>
					</c:forEach>
					
					</div>	
			</div>
			<div style="margin:  0 auto; width: 320px; height: 50px;"><ul class="pagination" id="pagination"></ul>	</div>
					<input type="hidden" value="" id="page" name="page"/>
					<input type="hidden" value="" id="limit" name="limit"/>	
					
			</div>
						
		</div>
		</form>
		
	</main>

	<script>
		var totalPages = ${sanpham.totalPage};
		var currentPage = ${sanpham.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 2,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(3);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	</script>
</body>




