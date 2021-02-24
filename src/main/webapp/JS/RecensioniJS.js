
$(document).ready(function () {
	
	$("#recensione").click(prova);
	$("#noLove").click(remove);
	$("#Love").click(aggiungi);
	
})

function prova (){
		 	var isbn = document.getElementById("recensione").value;

		    $.post("getRecensioneServlet", {ISBN: isbn})
		        
		    	.done(function (data) {
		    		$('#recensione').after(data);
		    		$('#recensione').unbind();
		    		$('#recensione').click(ripristina);
		    })
		    .fail(function () {
		    	alert("error");
		    	const messageError = $("#messageError");
		    	messageError.text(response.message);
		    	messageError.css("opacity", "1");
		    });
		
	}

function ripristina () {
	$("#content-recenzione").remove();
	$('#recensione').unbind();
	$('#recensione').click(prova);
}


function remove (){
		 	var isbn = document.getElementById("noLove").value;

		    $.post("RemoveLoveServlet", {ISBN: isbn})
		        
		    	.done(function (data) {
		    		window.location.reload();
		    })
		    .fail(function () {
		    	alert("error");
		    });
		
	}

function aggiungi (){
 	var isbn = document.getElementById("Love").value;

    $.post("AddLoveServlet", {ISBN: isbn})
        
    	.done(function (data) {
    		window.location.reload();
    })
    .fail(function () {
    	alert("error");
    });

}