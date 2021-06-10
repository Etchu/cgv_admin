<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/side_menu.css" />
	
	<script>
		<c:if test="${user == null}">
			location.href="/";
		</c:if>
		
		$(function(){
			let menu_num = "${menu_num}";
			
			if(menu_num != "" && menu_num < 5) {
				$("#answer01").prop("checked", true);
				$("#answer02").prop("checked", false);
				$(".selMenu").eq(menu_num).addClass("current");
			}
			else if(menu_num != "" && menu_num > 4){
				$("#answer01").prop("checked", false);
				$("#answer02").prop("checked", true);
				$(".selMenu").eq(menu_num).addClass("current");
			}
		})
	</script>
</head>
<body>
		<div id="left_side_wrap">
			<div class="logo">
				<h1>
					<a href="/main" class="underline">
						<img src="https://img.cgv.co.kr/R2014/images/title/h1_cgv.png">
						관리자 페이지
					</a>
				</h1>
			</div>
			<c:if test="${user != null}">
				<div class="user_menu">
					<div class="profile">
						<img src="/resources/images/profile2.png" />
					</div>
					<span>${user}님</span>
					<button onclick="location.href='/logout'">로그아웃</button>
				</div>
			</c:if>
			
			<div class="menu_background">
				<div class="left_menu">
					<input type="checkbox" id="answer01">
					<label for="answer01">영화관리<em></em></label>
					<div class="menu01">
						<a href="/genre" class="underline selMenu">ㆍ 장르</a>
						<a href="/actor" class="underline selMenu">ㆍ 배우</a>
						<a href="/director" class="underline selMenu">ㆍ 감독</a>
						<a href="/movie" class="underline selMenu">ㆍ 영화정보</a>
						<a href="/schedule" class="underline selMenu">ㆍ 시간표</a>
					</div>
					
					<input type="checkbox" id="answer02">
					<label for="answer02">회원관리<em></em></label>
					<div class="menu02">
						<a href="/member" class="underline selMenu">ㆍ 회원정보</a>
					</div>
				
					<!-- <ul class="menu_items">
						<li>
							<a href="#" id="first" class="underline">영화관리
								<img src="/resources/images/.png" style="width: 15px; height: 15px; filter: invert(1); float:right; margin-left: 5px;">
							</a>
							<ul id="sub_menu" style="display:none;">
								<li>
									<a href="/genre" class="underline">장르</a>
								</li>
								<li>
									<a href="/actor" class="underline">배우</a>
								</li>
								<li>
									<a href="/director" class="underline">감독</a>
								</li>						
								<li>
									<a href="/movie" class="underline">영화</a>
								</li>
								<li>
									<a href="#" class="underline">시간표</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="/member" class="underline">회원관리</a>
						</li>
					</ul> -->
				</div>
			</div>
		</div>
</body>
</html>