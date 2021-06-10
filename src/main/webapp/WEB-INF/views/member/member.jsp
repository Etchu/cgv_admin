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
	<title>회원</title>
	<link rel="stylesheet" href="/resources/css/member.css" />
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/menu/side_menu.jsp" %>
	<div id="right_wrap">
		<div class="inside_wrap">
			<div id="actor_btn">
				<p>회원정보 관리</p>
				<p>회원관리 > 회원정보 관리
 				<div class="searchbox">
					<input type="text"><img src="/resources/images/search.png" />
				</div>
			</div>
			<div class="row">
				<div id="title_area">
					<ul class="list_title">
						<li>번호</li>
						<li>ID</li>
						<li>이름</li>
						<li>상태</li>
						<li>가입일</li>
						<li>관리<li>
						
					</ul>
				</div>
				<div id="contents_area">
					<div>
						<ul class="list_content">
							<li class="list_seq">1</li>
							<li class="list_id">user1</li>
							<li class="list_name">홍길동</li>
							<li class="list_status">정상</li>
							<li class="list_reg_date">2021-04-10</li>
							<li style="color:white;">공백</li>
						</ul>
						<div class="item_modify">
							<button type="button" class="modify_btn">수정</button>
						</div>
						<div class="item_delete">
							<button type="button" class="delete_btn">삭제</button>
						</div>
					</div>
					<div>
						<ul class="list_content">
							<li class="list_seq">2</li>
							<li class="list_id">user2</li>
							<li class="list_name">심학규</li>
							<li class="list_status">정상</li>
							<li class="list_reg_date">2021-04-10</li>
							<li style="color:white;">공백</li>
						</ul>
						<div class="item_modify">
							<button type="button" class="modify_btn">수정</button>
						</div>
						<div class="item_delete">
							<button type="button" class="delete_btn">삭제</button>
						</div>
					</div>
					<div>
						<ul class="list_content">
							<li class="list_seq">3</li>
							<li class="list_id">user3</li>
							<li class="list_name">장화홍련</li>
							<li class="list_status">탈퇴대기</li>
							<li class="list_reg_date">2021-04-10</li>
							<li style="color:white;">공백</li>
						</ul>
						<div class="item_modify">
							<button type="button" class="modify_btn">수정</button>
						</div>
						<div class="item_delete">
							<button type="button" class="delete_btn">삭제</button>
						</div>
					</div>
					<%-- <c:forEach items="${list}" var="list">
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
					</c:forEach> --%>
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