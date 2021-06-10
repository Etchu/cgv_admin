<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="/resources/css/movie_list.css" />
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/movie_list.js"></script>
</head>
<body>
 	<%@include file="/WEB-INF/views/menu/side_menu.jsp" %>
	<div id="right_wrap">
		<div class="inside_wrap">
			<div id="actor_btn">
				<p>영화정보 관리</p>
				<p>영화관리 > 영화정보 관리
 				<div class="searchbox">
					<input type="text"><img src="/resources/images/search.png" />
 					<button id="add_actor" onclick="location.href='/add_movie'">추가</button>
				</div>
			</div>
			<div class="row">
				<div id="title_area">
					<ul class="list_title">
						<li>번호</li>
						<li>이름</li>
						<li>작성일</li>
						<li>관리<li>
						
					</ul>
				</div>
				<div id="contents_area">
					<c:forEach items="${list}" var="list">
						<div>
							<ul class="list_content">
								<li class="list_seq">${list.cmi_seq}</li>
								<li class="list_name"><a href="/movie_detail?no=${list.cmi_seq}">${list.cmi_name}</a></li>
								<li class="list_reg_date"><fmt:formatDate value="${list.cmi_reg_date}" pattern="yyyy-MM-dd HH:mm"/></li>
								<li style="color:white;">공백</li>
							</ul>
							<div class="item_modify">
								<button type="button" class="modify_btn">수정</button>
							</div>
							<div class="item_delete">
								<button type="button" class="delete_btn">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="pager_area">
           			<button id="prev_10">&lt;&lt;</button>
            		<button id="prev_page">&lt;</button>
           			<div class="pagers">
           				1 2 3
           			</div>
            		<button id="next_page">&gt;</button>
            		<button id="next_10">&gt;&gt;</button>
        		</div>
			</div>
		</div>
	</div>
</body>
</html>