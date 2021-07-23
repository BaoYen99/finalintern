<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="Master-layout"/></title>
<link rel="stylesheet" href="/assets/css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css">
</head>
<body>
<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

	<decorator:body />
	
	<script src="/assets/bootstrap/bootstrap.min.js"></script>
  		<script src="/assets/bootstrap/jquery.min.js"></script>
  		<script src="/assets/paging/jquery.twbsPagination.min.js"></script>
</body>
</html>