/**
 * 
 */
$(document).ready(function () {
	
	$("#pub").click(books);
	
})

function books (){
		 	var isbn = document.getElementById("pub").value;

		    $.post("../getUserBookServlet", {ISBN: isbn})
		        
		    	.done(function (data) {
		    		$('#pub').after(data);
		    		$('#pub').unbind();
		    		$('#pub').click(ripristina);
		    })
		    .fail(function () {
		    	alert("error");
		    	
		    });
		
	}

function ripristina () {
	$("#elenco").remove();
	$('#pub').unbind();
	$('#pub').click(books);
}