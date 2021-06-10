<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="/resources/css/login.css" />
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/login.js"></script>
	
	<script>
		<c:if test="${user != null}">
			location.href="/main";
		</c:if>
	</script>
</head>
<body>
	<div id="login_wrap">
		<div class="logo">
			<img src="https://img.cgv.co.kr/R2014/images/title/h1_cgv.png">
			<p>관리자 페이지</p>
		</div>
		<div class="login_area">
			<div class="id">
				<span>아이디 | </span>
				<input type="text" id="user_id"/>
			</div>
			<div class="pwd">
				<span>비밀번호 | </span>
				<input type="password" id="user_pwd"/>
			</div>
			<button id="login_btn">로그인</button>
		</div>
	</div>
</body>
</html>