$(function(){
	
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
	
	$("#open_expire_date").datepicker();
	
	$("#genre_add").click(function(){
		
		type = "genre";
		selGenre = $(".genre_count").length;
		
		$(".movie_add_modal").show();
		$(".movie_content h1 span").html("장르 추가");
		
		$.ajax({
			url:"/genre_list",
			type:"get",
			success:function(data) {
				$(".modal_prod_item_wrap").html(""); // 안쪽의 내용을 삭제

				for(let i=0; i<data.length; i++) {
					let template = 
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel'+i+'" value="'+data[i].cmg_seq+'">'+
								'<label for="sel'+i+'"></label>'+
							'</div>'+
							'<div>'+data[i].cmg_seq+'</div>'+
							'<div>'+data[i].cmg_name+'</div>'+
						'</div>';
					$(".modal_prod_item_wrap").append(template);
				}
			}
		});
		
		$("#search_btn").click(function(){
			getGenres();
		})
			
		$("#search_keyword_popup").keydown(function(e){
			if(e.keyCode == 13) {
				getGenres();
			}
		})
		
	});

	$("#director_add").click(function(){
		
		type = "director";
		
		selDirector = $(".director_count").length;
		
		$(".movie_add_modal").show();
		$(".movie_content h1 span").html("감독 추가");
		
		$.ajax({
			url:"/director_list",
			type:"get",
			success:function(data) {
				$(".modal_prod_item_wrap").html(""); // 안쪽의 내용을 삭제

				for(let i=0; i<data.length; i++) {
					let template = 
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel'+i+'" value="'+data[i].cmd_seq+'">'+
								'<label for="sel'+i+'"></label>'+
								'</div>'+
							'<div>'+data[i].cmd_seq+'</div>'+
							'<div>'+data[i].cmd_name+'</div>'+
						'</div>';
					$(".modal_prod_item_wrap").append(template);
				}
			}
		});
		
		$("#search_btn").click(function(){
			getDirectors();
		})
			
		$("#search_keyword_popup").keydown(function(e){
			if(e.keyCode == 13) {
				getDirectors();
			}
		})
		
	});
	
	$("#actor_add").click(function(){
		
		type = "actor";
		selActor = $(".actor_count").length;
		
		$(".movie_add_modal").show();
		$(".movie_content h1 span").html("배우 추가");
		
		$.ajax({
			url:"/actor_list",
			type:"get",
			success:function(data) {
				$(".modal_prod_item_wrap").html(""); // 안쪽의 내용을 삭제

				for(let i=0; i<data.length; i++) {
					let template =
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel"'+i+' value="'+data[i].cma_seq+'">'+
								'<label for="sel'+i+'"></label>'+
								'</div>'+
							'<div>'+data[i].cma_seq+'</div>'+
							'<div>'+data[i].cma_name+'</div>'+
						'</div>';
					$(".modal_prod_item_wrap").append(template);
				}
			}
		});
		
		$("#search_btn").click(function(){
			getActors();
		})
			
		$("#search_keyword_popup").keydown(function(e){
			if(e.keyCode == 13) {
				getActors();
			}
		})
	});
	
	$("#save").click(function(){
		
		if($(".modal_prod_item_sel:checked").length == 0) {
			alert("선택된 내용이 없습니다.");
			return;
		}

		let selected = $(".modal_prod_item_sel:checked");
		
		if(type == "actor") {
			
			for(let i = 0; i < selected.length; i++) {
				let value = selected.eq(i).val();
				console.log(value);
			
				$.ajax({
					url:"/sel_actor_list/"+value,
					data:"get",
					async : false,
					success:function(data) {
						let template = 
							'<div id="actor" class="actor_count" value="'+data.cma_seq+'">'+
								'<div class="actor_name">'+data.cma_name+'</div>'+
								'<button id="del_actor_btn">X</button>'+
							'</div>';
						$(".selected_actor").append(template);
						$(".movie_add_modal").hide();
					}
				})
			}
		}
		else if(type == "director") {
			
			for(let i = 0; i < selected.length; i++) {
				let value = selected.eq(i).val();
				console.log(value);
					
				$.ajax({
					url:"/sel_director_list/"+value,
					data:"get",
					async : false,
					success:function(data) {
						let template = 
							'<div id="director" class="director_count" value="'+data.cmd_seq+'">'+
								'<div class="director_name">'+data.cmd_name+'</div>'+
								'<button id="del_director_btn">X</button>'+
							'</div>';
							$(".selected_director").append(template);
							$(".movie_add_modal").hide();
					}
				})
			}
		}
		
		else if(type == "genre") {
			
			for(let i = 0; i < selected.length; i++) {
				
				let value = selected.eq(i).val();
				console.log(value);
					
				$.ajax({
					url:"/sel_genre_list/"+value,
					data:"get",
					async : false,
					success:function(data) {
						let template = 
							'<div id="genre" class="genre_count" value="'+data.cmg_seq+'">'+
								'<div class="genre_name">'+data.cmg_name+'</div>'+
								'<button id="del_genre_btn">X</button>'+
							'</div>';
							$(".selected_genre").append(template);
							$(".movie_add_modal").hide();
					}
				})
			}
		}
	});
	
	$("#cancel").click(function(){
		$(".movie_add_modal").hide();
	});
	
	$(document).on("click","#del_actor_btn",function(){
		
		$(this).parent().detach();
	});
	$(document).on("click","#del_director_btn",function(){
		
		$(this).parent().detach();
	});
	$(document).on("click","#del_genre_btn",function(){
	
		$(this).parent().detach();
	});
	
	$("#movie_save").click(function(){
		
		if(confirm("수정하시겠습니까?") == false)
			return;
		
		let data = {
				"cmi_seq" : $("#cmi_seq").attr("value"),
				"cmi_name" : $("#movie_title").val(),
				"cmi_sub_name" : $("#movie_sub_title").val(),
				"cmi_content" : $("#movie_content").val(),
				"cmi_country" : $("#make_country").val(),
				"cmi_runningtime" : $("#movie_running").val(),
				"cmi_type" : $(".sel_movie_type:checked").val(),
				"cmi_open_date" : $("#open_expire_date").val(),
				"cmi_screen" : $(".sel_movie_screen:checked").val(),
				"cmi_grade" : $(".sel_movie_grade:checked").val()
		}
		
		let cmi_seq = $("#cmi_seq").attr("value");
		let form = $("#prod_img_form");
		let formData = new FormData(form[0]);
		
		if(formData != null){
			$.ajax({
				url:"/movie_img/"+cmi_seq+"?name="+$("#movie_title").val(),
				type:"put",
				data:formData,
				contentType:false,
				processData:false,
				success:function(){
					alert("저장됨");
				}
			})
		}
		
		$.ajax({
			url:"/movie_modify",
			type:"patch",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(data){
				alert(data.message);
				
				$.ajax({
					url:"/del_movieActor?seq="+cmi_seq,
					type:"delete",
					success:function(data){
						console.log(data.message);
					}
				})

				$.ajax({
					url:"/del_movieDirector?seq="+cmi_seq,
					type:"delete",
					success:function(data){
						console.log(data.message);
					}
				})

				$.ajax({
					url:"/del_movieGenre?seq="+cmi_seq,
					type:"delete",
					success:function(data){
						console.log(data.message);
					}
				})
				
				for(let i = 0; i < $(".actor_count").length; i++) {
					
					let data = {
						"cmia_info_seq" : cmi_seq,
						"cmia_actor_seq" : $(".selected_actor").find(".actor_count").eq(i).attr("value")
					}

					$.ajax({
						url:"/actor_in_movie",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify(data),
						async : false,
						success:function(data){},
					})
				}
				
				for(let i = 0; i < $(".genre_count").length; i++) {
					
					let data = {
						"cmig_info_seq" : cmi_seq,
						"cmig_genre_seq" : $(".selected_genre").find(".genre_count").eq(i).attr("value")
					}

					$.ajax({
						url:"/genre_in_movie",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify(data),
						async : false,
						success:function(data){},
					})
				}
				
				for(let i = 0; i < $(".director_count").length; i++) {
					
					let data = {
						"cmid_info_seq" : cmi_seq,
						"cmid_director_seq" : $(".selected_director").find(".director_count").eq(i).attr("value")
					}

					$.ajax({
						url:"/director_in_movie",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify(data),
						async : false,
						success:function(data){},
					})
				}
				
				location.reload();
			},
			error:function(e) {
				alert("실패");
			}
		})
	});
	
	$("#movie_cancel").click(function(){
		history.back();
	})
	
	function getActors() {
		
		let keyword = $("#search_keyword_popup").val();
		console.log(keyword);
		
		$.ajax({
			url:"/sel_actor_list?keyword="+keyword,
			type:"post",
			success:function(data){
				console.log(data);
				$(".modal_prod_item_wrap").html("");
				for(let i = 0; i < data.length; i++) {
					let template = 
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel'+i+'" value="'+data[i].cma_seq+'">'+
								'<label for="sel'+i+'"></label>'+	
							'</div>'+
							'<div>'+data[i].cma_seq+'</div>'+
							'<div>'+data[i].cma_name+'</div>'+
						'</div>';
				$(".modal_prod_item_wrap").append(template);
				}
			}
		});
	}
	
	function getDirectors() {
		
		let keyword = $("#search_keyword_popup").val();
		console.log(keyword);
		
		$.ajax({
			url:"/sel_director_list?keyword="+keyword,
			type:"post",
			success:function(data){
				console.log(data);
				$(".modal_prod_item_wrap").html("");
				for(let i = 0; i < data.length; i++) {
					let template = 
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel'+i+'" value="'+data[i].cmd_seq+'">'+
								'<label for="sel'+i+'"></label>'+	
							'</div>'+
							'<div>'+data[i].cmd_seq+'</div>'+
							'<div>'+data[i].cmd_name+'</div>'+
						'</div>';
				$(".modal_prod_item_wrap").append(template);
				}
			}
		});
	}
	
	function getGenres() {
		
		let keyword = $("#search_keyword_popup").val();
		console.log(keyword);
		
		$.ajax({
			url:"/sel_genre_list?keyword="+keyword,
			type:"post",
			success:function(data){
				console.log(data);
				$(".modal_prod_item_wrap").html("");
				for(let i = 0; i < data.length; i++) {
					let template = 
						'<div class="modal_prod_item">'+
							'<div>'+
								'<input type="checkbox" class="modal_prod_item_sel" id="sel'+i+'" value="'+data[i].cmg_seq+'">'+
								'<label for="sel'+i+'"></label>'+	
							'</div>'+
							'<div>'+data[i].cmg_seq+'</div>'+
							'<div>'+data[i].cmg_name+'</div>'+
						'</div>';
				$(".modal_prod_item_wrap").append(template);
				}
			}
		});
	}
})