$(function(){
	
	$("#movie_delete").click(function(){
		
		if(confirm("삭제하시겠습니까?") == false)
			return;
		
		let cmi_seq = $("#movie_delete").attr("data-value");
		
		$.ajax({
			url:"/movie_delete?seq="+cmi_seq,
			type:"delete",
			success:function(data){
				
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
				
				alert(data.message);
			},
			error:function(){
				alert("에러");
			}
		})
	})
})