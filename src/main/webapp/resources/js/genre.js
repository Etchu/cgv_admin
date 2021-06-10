$(function(){
	$("#add_actor").click(function(){
		//$(".actor_add_modal").addClass("open");
		$(".actor_add_modal").css("display", "block");
		$("#save").show();
		$("#modify").hide();
		$(".modal_content h1 span").html("장르 추가");
		//$(".category_add_modal").show();
	});
	$("#save").click(function(){
		if($("#actor_name").val() == '') {
			return;
		}
		
		// $(".category_add_modal").removeClass("open");
		// $("#category_name").val("");
		// ajax 호출
		$.ajax({
			url:"/api/insert_genre?name="+$("#actor_name").val(),
			type:"post",
			success:function(data) {
				alert(data.message);
				if(data.status == 'success'){
					$(".actor_add_modal").removeClass("open");
					$("#actor_name").val("");
					$("#actor_content").val("");
					location.reload();
				}
			}
		})
	})
	
	$("#cancel").click(function(){
		//$(".actor_add_modal").removeClass("open");
		//$(".category_add_modal").hide();
		$(".actor_add_modal").css("display", "none");
		$("#actor_name").val("");
		$("#actor_contents").val("");
	})
	
	$(".delete_btn").click(function(){
		let name = $(this).parent().parent().find(".list_name").html();
		let seq = $(this).parent().parent().find(".list_seq").html();
		
		/*alert(seq+":"+name);*/
		
		if(confirm("이름 : " + name +"을(를) 삭제하시겠습니까?") == false)
			return;
			 
		$.ajax({
			url:"/genre?seq="+seq,
			type:"delete",
			success:function(data){
				alert(data.message);
				location.reload();
			}
		})
	})
	
	$(".modify_btn").click(function(){
		window.modify_seq = $(this).parent().parent().find(".list_seq").html();
		let name = $(this).parent().parent().find(".list_name").html();
		
		$("#modify").prop("disabled", true);
		$(".actor_add_modal").css("display", "block");
		$("#save").hide();
		$("#modify").show();
		$("#actor_name").val(name);
		$(".modal_content h1 span").html("장르 수정");
	})
	
	$("#modify").click(function(){
		if(confirm("수정하시겠습니까?") == false)
			return;
		
		$.ajax({
			url:"/genre/"+window.modify_seq+"?name="+$("#actor_name").val(),
			type:"patch",
			success:function(data){
				alert(data.message);
				if(data.status == 'success') {
					location.reload();
				}
			},
			error:function(){
				alert("에러");
			}
		})
	})
	
	$("#actor_name").on("input", function(){
		if(window.originalName == $("#actor_name").val() || $("#actor_name").val() == ''){
			$("#modify").prop("disabled", true);
		}
		else {
			$("#modify").prop("disabled", false);
		}
	})
})