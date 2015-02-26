$(function() {
	
	// $("#new_article").on("ajax:success", (e, data, status, xhr) ->
 //    $("#new_article").append xhr.responseText
 //  ).on "ajax:error", (e, xhr, status, error) ->
 //    $("#new_article").append "<p>ERROR</p>"

 // #REVIEW JQUERY .ON
 	$("#new_url").on("ajax:success", function(e, data, status, xhr){

 		$('.container').first().append(xhr.responseText);
 	});


});
