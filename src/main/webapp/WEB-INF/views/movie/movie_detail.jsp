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
	<title>영화 상세</title>
	<link rel="stylesheet" href="/resources/css/movie_detail.css">
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/movie_detail.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/menu/side_menu.jsp" %>
	<div id="right_wrap">
		<div class="inside_wrap">
			<p>영화 상세정보</p>
			<p>영화 > 영화정보 관리 > 영화 상세정보 > ${list.cmi_name}</p>
			<div class="content_wrap">	
				<div class="image_area">
					<c:if test="${list.image_uri == null }">
						<img src="/resources/images/noimage.jpg" style="width: 259px; height: 364px;"/>
					</c:if>
					<c:if test="${list.image_uri != null }">
						<img src="${list.image_uri}" style="width: 259px; height: 364px;"/>
					</c:if>
				</div>
			
				<div class="title_area">
					<span>제목 </span>
					<div id="movie_title">${list.cmi_name}</div>
				</div>
				
				<div class="sub_title_area">
					<span>소 제목 </span>
					<div id="movie_sub_title">${list.cmi_sub_name}</div>
				</div>
			
				<div class="time_area">
					<span>상영시간 </span>
					<div id="movie_running">${list.cmi_runningtime}</div>
				</div>
			
				<div class="country_area">
					<span>제작나라 </span>
					<div id="make_country">${list.cmi_country}</div>
				</div>
			
				<div class="open_date">
					<span>개봉일 </span>
					<div id="open_expire_date">
						<fmt:formatDate value="${list.cmi_open_date}" pattern="yyyy-MM-dd"/>
					</div>
				</div>
			
				<div class="genre_area">
					<span>장르 </span>
					<div class="selected_genre">
						<c:if test="${empty genreList}">
							&nbsp;
						</c:if>
						<c:forEach items="${genreList}" var="genreList" varStatus="genre">
							<c:if test="${genre.last}">
								<span>${genreList.cmg_name}</span>
							</c:if>
							<c:if test="${!genre.last}">
								<span>${genreList.cmg_name}/</span>
							</c:if>
						</c:forEach>
					</div>
				</div>
			
				<div class="director_area">
					<span>감독 </span>
					<div class="selected_director">
						<c:if test="${empty directorList}">
							&nbsp;
						</c:if>
						<c:forEach items="${directorList}" var="directorList" varStatus="director">
							<c:if test="${director.last}">
								<span>${directorList.cmd_name}</span>
							</c:if>
							<c:if test="${!director.last}">
								<span>${directorList.cmd_name}, </span>
							</c:if>
						</c:forEach>
					</div>
				</div>
			
				<div class="actor_area">
					<span>배우 </span>
					<div class="selected_actor">
						<c:if test="${empty actorList}">
							&nbsp;
						</c:if>
						<c:forEach items="${actorList}" var="actorList" varStatus="actor">
							<c:if test="${actor.last}">
								<span>${actorList.cma_name}</span>
							</c:if>
							<c:if test="${!actor.last}">
								<span>${actorList.cma_name}, </span>
							</c:if>
						</c:forEach>
					</div>
				</div>
			
				<div class="content_area">
					<span>내용 </span>
					<div id="movie_content">${list.cmi_content}</div>
				</div>
			
				<div class="sel_movie_type select_area">
					<span>상영 타입</span>
					<div>
						<c:if test="${list.cmi_type == 0}">
							<input type="radio" name="sel_movie_type" class="sel_movie_type" id="show_movie" value="0" checked disabled/>
							<label for="show_movie" id="show_movie_text">상영중</label>
						</c:if>
						<c:if test="${list.cmi_type != 0}">
							<input type="radio" name="sel_movie_type" class="sel_movie_type" id="show_movie" value="0" disabled/>
							<label for="show_movie" id="show_movie_text">상영중</label>
						</c:if>
				
						<c:if test="${list.cmi_type == 1}">
							<input type="radio" name="sel_movie_type" class="sel_movie_type" id="notShow_movie" value="1" checked disabled/>
							<label for="notShow_movie_type" id="notShow_movie_text">상영예정</label>
						</c:if>
						<c:if test="${list.cmi_type != 1}">
							<input type="radio" name="sel_movie_type" class="sel_movie_type" id="notShow_movie" value="1" disabled/>
							<label for="notShow_movie_type" id="notShow_movie_text">상영예정</label>
						</c:if>					
					</div>
				</div>
			
				<div class="sel_movie_screen select_area">
					<span>스크린 종류</span>
					<div>
						<c:if test="${list.cmi_screen == 0}">
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_twoD" value="0" checked disabled/>
							<label for="screen_twoD" id="screen_twoD_text">2D</label>
						</c:if>
						<c:if test="${list.cmi_screen != 0}">
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_twoD" value="0" disabled/>
							<label for="screen_twoD" id="screen_twoD_text">2D</label>
						</c:if>
						
						<c:if test="${list.cmi_screen == 1}">
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_threeD" value="1" checked disabled/>
							<label for="screen_threeD" id="screen_threeD_text">3D</label>
						</c:if>
						<c:if test="${list.cmi_screen != 1}">
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_threeD" value="1" disabled/>
							<label for="screen_threeD" id="screen_threeD_text">3D</label>
						</c:if>
					
						<c:if test="${list.cmi_screen == 2}">	
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_fourD" value="2" checked disabled/>
							<label for="screen_fourD" id="screen_fourD_text">4D</label>	
						</c:if>
						<c:if test="${list.cmi_screen != 2}">
							<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_fourD" value="2" disabled/>
							<label for="screen_fourD" id="screen_fourD_text">4D</label>
						</c:if>
					</div>
				</div>
			
				<div class="sel_movie_grade select_area">
					<span>영화 등급</span>
					<div>
						<c:if test="${list.cmi_grade == 0}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_all" value="0" checked disabled/>
							<label for="grade_all" id="grade_all_text">전체 관람가</label>
						</c:if>
						<c:if test="${list.cmi_grade != 0}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_all" value="0" disabled/>
							<label for="grade_all" id="grade_all_text">전체 관람가</label>
						</c:if>
					
						<c:if test="${list.cmi_grade == 1}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_twelve" value="1" checked disabled/>
							<label for="grade_twelve" id="grade_twelve_text">12세 관람가</label>
						</c:if>
						<c:if test="${list.cmi_grade != 1}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_twelve" value="1" disabled/>
							<label for="grade_twelve" id="grade_twelve_text">12세 관람가</label>
						</c:if>
						
						<c:if test="${list.cmi_grade == 2}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_fifteen" value="2" checked disabled/>
							<label for="grade_fifteen" id="grade_fifteen_text">15세 관람가</label>
						</c:if>
						<c:if test="${list.cmi_grade != 2}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_fifteen" value="2" disabled/>
							<label for="grade_fifteen" id="grade_fifteen_text">15세 관람가</label>
						</c:if>
						
						<c:if test="${list.cmi_grade == 3}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_limit" value="3" checked disabled/>
							<label for="grade_limit" id="grade_limit_text">청소년 관람불가</label>	
						</c:if>
						<c:if test="${list.cmi_grade != 3}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_limit" value="3" disabled/>
							<label for="grade_limit" id="grade_limit_text">청소년 관람불가</label>
						</c:if>
					
						<c:if test="${list.cmi_grade == 4}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_undefined" value="4" checked disabled/>
							<label for="grade_undefined" id="grade_undefined_text">미정</label>
						</c:if>
						<c:if test="${list.cmi_grade != 4}">
							<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_undefined" value="4" disabled/>
							<label for="grade_undefined" id="grade_undefined_text">미정</label>
						</c:if>
					</div>
				</div>					
				
				<div class="btn_area">
        	   	 	<div id="movie_modify"><a href="/movie_modify?no=${list.cmi_seq}">수정</a></div>
        	   	 	<div id="movie_delete" data-value="${list.cmi_seq}">삭제</div>
        	    	<button id="movie_cancel" onclick="history.back()">목록</button>
        		</div>
			</div>
		</div>
	</div>
</body>
</html>