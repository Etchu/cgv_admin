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
	<link rel="stylesheet" href="/resources/css/add_movie.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" />
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous"></script>
	<script src="/resources/js/movie_modify.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/menu/side_menu.jsp" %>
	<div id="right_wrap">
		<div class="inside_wrap">
			<p>영화정보 수정</p>
			<p>영화 > 영화정보 관리 > 영화정보 수정 > ${list.cmi_name}</p>
			<div class="content_wrap">
			<div id="cmi_seq" value="${list.cmi_seq}"></div>
			<div class="title_area">
				<span>제목</span>
				<input type="text" id="movie_title" value="${list.cmi_name}"/>
			</div>
			
			<div class="sub_title_area">
				<span>소 제목</span>
				<input type="text" id="movie_sub_title" value="${list.cmi_sub_name}"/>
			</div>
			
			<div class="open_date">
				<span class="item_title">개봉일</span>
				<input type="text" id="open_expire_date" value="${list.changeDate}"/>
			</div>
			
			<div class="time_area">
				<span>상영시간</span>
				<input type="text" id="movie_running" value="${list.cmi_runningtime}"/>
			</div>
			
			<div class="country_area">
				<span>제작나라</span>
				<input type="text" id="make_country" value="${list.cmi_country}"/>
			</div>
			
			<div class="genre_area">
				<span>장르</span>
				<button id="genre_add">+</button>
				<div class="selected_genre">
					<c:forEach items="${genreList}" var="genreList" varStatus="genre">
						<div id="genre" class="genre_count" value="${genreList.cmg_seq}">
							<div class="genre_name">${genreList.cmg_name}</div>
							<button id="del_genre_btn">X</button>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="director_area">
				<span>감독</span>
				<button id="director_add">+</button>
				<div class="selected_director">
					<c:forEach items="${directorList}" var="directorList" varStatus="director">
						<div id="director" class="director_count" value="${directorList.cmd_seq}">
							<div class="director_name">${directorList.cmd_name}</div>
							<button id="del_director_btn">X</button>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="actor_area ">
				<span>배우</span>
				<button id="actor_add">+</button>
				<div class="selected_actor">
					<c:forEach items="${actorList}" var="actorList" varStatus="actor">
						<div id="actor" class="actor_count" value="${actorList.cma_seq}">
							<div class="actor_name">${actorList.cma_name}</div>
							<button id="del_actor_btn">X</button>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="content_area">
				<span>내용</span>
				<textarea id="movie_content">${list.cmi_content}</textarea>
			</div>
			
			<div class="sel_movie_type select_area">
				<span>상영 타입</span>
				<div>
				<c:if test="${list.cmi_type == 0}">
					<input type="radio" name="sel_movie_type" class="sel_movie_type" id="show_movie" value="0" checked/>
					<label for="show_movie" id="show_movie_text">상영중</label>
				</c:if>
				<c:if test="${list.cmi_type != 0}">
					<input type="radio" name="sel_movie_type" class="sel_movie_type" id="show_movie" value="0"/>
					<label for="show_movie" id="show_movie_text">상영중</label>
				</c:if>
				
				<c:if test="${list.cmi_type == 1}">
					<input type="radio" name="sel_movie_type" class="sel_movie_type" id="notShow_movie" value="1" checked/>
					<label for="notShow_movie_type" id="notShow_movie_text">상영예정</label>
				</c:if>
				<c:if test="${list.cmi_type != 1}">
					<input type="radio" name="sel_movie_type" class="sel_movie_type" id="notShow_movie" value="1"/>
					<label for="notShow_movie_type" id="notShow_movie_text">상영예정</label>
				</c:if>
				</div>
			</div>
			
			<div class="sel_movie_screen select_area">
				<span>스크린 종류</span>
				<div>
				<c:if test="${list.cmi_screen == 0}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_twoD" value="0" checked/>
					<label for="screen_twoD" id="screen_twoD_text">2D</label>
				</c:if>
				<c:if test="${list.cmi_screen != 0}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_twoD" value="0"/>
					<label for="screen_twoD" id="screen_twoD_text">2D</label>
				</c:if>
				
				<c:if test="${list.cmi_screen == 1}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_threeD" value="1" checked/>
					<label for="screen_threeD" id="screen_threeD_text">3D</label>
				</c:if>
				<c:if test="${list.cmi_screen != 1}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_threeD" value="1"/>
					<label for="screen_threeD" id="screen_threeD_text">3D</label>
				</c:if>
				
				<c:if test="${list.cmi_screen == 2}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_fourD" value="2" checked/>
					<label for="screen_fourD" id="screen_fourD_text">4D</label>
				</c:if>
				<c:if test="${list.cmi_screen != 2}">
					<input type="radio" name="sel_movie_screen" class="sel_movie_screen" id="screen_fourD" value="2"/>
					<label for="screen_fourD" id="screen_fourD_text">4D</label>
				</c:if>
				</div>
			</div>
			
			<div class="sel_movie_grade select_area">
				<span>영화 등급</span>
				<div>
				<c:if test="${list.cmi_grade == 0}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_all" value="0" checked/>
					<label for="grade_all" id="grade_all_text">전체 관람가</label>
				</c:if>
				<c:if test="${list.cmi_grade != 0}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_all" value="0"/>
					<label for="grade_all" id="grade_all_text">전체 관람가</label>
				</c:if>
				
				<c:if test="${list.cmi_grade == 1}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_twelve" value="1" checked/>
					<label for="grade_twelve" id="grade_twelve_text">12세 관람가</label>
				</c:if>
				<c:if test="${list.cmi_grade != 1}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_twelve" value="1"/>
					<label for="grade_twelve" id="grade_twelve_text">12세 관람가</label>
				</c:if>
				
				<c:if test="${list.cmi_grade == 2}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_fifteen" value="2" checked/>
					<label for="grade_fifteen" id="grade_fifteen_text">15세 관람가</label>
				</c:if>
				<c:if test="${list.cmi_grade != 2}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_fifteen" value="2"/>
					<label for="grade_fifteen" id="grade_fifteen_text">15세 관람가</label>
				</c:if>
				
				<c:if test="${list.cmi_grade == 3}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_limit" value="3" checked/>
					<label for="grade_limit" id="grade_limit_text">청소년 관람불가</label>	
				</c:if>
				<c:if test="${list.cmi_grade != 3}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_limit" value="3"/>
					<label for="grade_limit" id="grade_limit_text">청소년 관람불가</label>
				</c:if>
				
				<c:if test="${list.cmi_grade == 4}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_undefined" value="4" checked/>
					<label for="grade_undefined" id="grade_undefined_text">미정</label>
				</c:if>
				<c:if test="${list.cmi_grade != 4}">
					<input type="radio" name="sel_movie_grade" class="sel_movie_grade" id="grade_undefined" value="4"/>
					<label for="grade_undefined" id="grade_undefined_text">미정</label>
				</c:if>
				</div>
			</div>
			
			<div class="img_area">
				<span>포스터 이미지</span>
				<form id="prod_img_form">
					<c:if test="${list.image_name == null}">
						<span class="prev_img">이미지 없음</span>
					</c:if>
					<span class="prev_img">현재 이미지: ${list.image_name}</span>
					<input type="file" name="file" accept=".jpg, .png, .jpeg"/>
				</form>
			</div>
			
			<div class="btn_area">
            	<button id="movie_save" data-value="${list.cmi_seq}">등록</button>
            	<button id="movie_cancel">취소</button>
        	</div>
		</div>
		
		<div class="movie_add_modal">
			<div class="movie_content">
				<h1><span>title</span></h1>
				<div class="search_area">
					<input type="text" id="search_keyword_popup" placeholder="이름 검색"/>
					<button id="search_btn">검색</button>
				</div>
				<div class="modal_prod_list">
					<div class="modal_prod_head">
						<div>
							<input type="checkbox" id="selectAll" disabled>
							<label for="selectAll"></label>
						</div>
						<div>번호</div>
						<div>이름</div>
					</div>
					<div class="modal_prod_item_wrap">
						<div class="modal_prod_item">
							<div>
								<input type="checkbox" class="modal_prod_item_sel" id="sel1">
								<label for="sel1"></label>
							</div>
							<div>1</div>
							<div>가족</div>
						</div>
					</div>
				</div>
				<div class="prod_modal_btn_area">
					<button id="save">저장</button>
					<button id="cancel">취소</button>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>