//= require admin/spree_backend

$(document).ready(function(){
	
	$(".instagram-photo .approve-or-remove").on("click", function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).data("url"),
		}).done(function(data){
			if (data.status === "success"){
				changeState(e);
			}
		})
	});
	
	$(".instagram-photo .reject-photo").on("click", function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).data("url"),
		}).done(function(data){
			if (data.status === "success"){
				$(e.target).parents(".instagram-photo").hide();
			}
		})
	});
	
	$(".instagram-photo .undo-reject-photo").on("click", function(e){
		e.preventDefault();
		$.ajax({
			url: $(this).data("url"),
		}).done(function(data){
			if (data.status === "success"){
				$(e.target).parents(".instagram-photo").hide();
			}
		})
	});
	
	$(".instagram-photo").on("mouseenter", function(){
		$(this).children(".instagram-tag").show();
	});
	$(".instagram-photo").on("mouseleave", function(){
		$(this).children(".instagram-tag").hide();
	});
	
	function changeState(e){
		var photo = $(e.target).parents(".instagram-photo");
		var link = $(e.target);
		console.log(photo);
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