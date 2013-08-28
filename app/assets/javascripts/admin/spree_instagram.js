//= require admin/spree_backend

$(document).ready(function(){
	
	$(".instagram-photo a").on("click", function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).data("url"),
		}).done(function(data){
			if (data.status === "success"){
				changeState(e);
			}
		})
	});
	
	function changeState(e){
		var photo = $(e.target).parent();
		var link = $(e.target);
		if (photo.hasClass("approved")){
			photo.removeClass("approved").addClass("awaiting-approval");
			link.data("url", link.data("url").replace(/revoke/, "approve"));
			link.html("Approve");
		} else {
			photo.removeClass("awaiting-approval").addClass("approved");
			link.data("url", link.data("url").replace(/approve/, "revoke"));
			link.html("Remove");
		}
	}
	
});