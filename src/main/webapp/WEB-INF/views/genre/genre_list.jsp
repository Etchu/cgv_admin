<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="/resources/css/actor_list.css" />
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/genre.js"></script>
</head>
<body>
 	<%@include file="/WEB-INF/views/menu/side_menu.jsp" %>
	<div id="right_wrap">
		<div class="inside_wrap">
			<div id="actor_btn">
				<p>장르 관리</p>
				<p>영화관리 > 장르관리</p>
				<div class="searchbox">
					<input type="text"><img src="/resources/images/search.png" />
 					<button id="add_actor">추가</button>
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
								<li class="list_seq">${list.cmg_seq}</li>
								<li class="list_name">${list.cmg_name}</li>
								<li class="list_reg_date"><fmt:formatDate value="${list.cmg_reg_date}" pattern="yyyy-MM-dd HH:mm"/></li>
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
			
			<div class="actor_add_modal">
				<div class="modal_content">
					<h1><span>장르 추가</span></h1>
					<div class="input_row">
						<p>이름</p>
						<input type="text" id="actor_name" placeholder="장르 명을 입력하세요"/>
<!-- 						<p>내용</p>
						<input type="text" id="actor_content" placeholder="내용을 입력하세요"/> -->
					</div>
					<div class="input_row">
						<button id="save">저장</button>
						<button id="modify">수정</button>
						<button id="cancel">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>