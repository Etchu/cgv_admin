$(function(){
	$("#add_actor").click(function(){
		//$(".actor_add_modal").addClass("open");
		$(".actor_add_modal").css("display", "block");
		$("#save").show();
		$("#modify").hide();
		$(".modal_content h1 span").html("배우 추가");
		//$(".category_add_modal").show();
	});
	
	$("#cancel").click(function(){
		//$(".actor_add_modal").removeClass("open");
		//$(".category_add_modal").hide();
		$(".actor_add_modal").css("display", "none");
		$("#actor_name").val("");
		$("#actor_contents").val("");
	})
})