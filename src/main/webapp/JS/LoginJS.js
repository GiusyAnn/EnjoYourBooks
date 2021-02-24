/**
 * 
 */
$(document).ready(() => {
	//Seleziono le due form: login e registrazione con jquery
    const formLogin = $("[name='login']");
    //Chiama l'evento onLoginSubmit o onSignUpSubmit quando viene fatto il submit della form
    formLogin.on('submit', onLoginSubmit);
})
const onLoginSubmit = event => {
    //Evita di fare il submit
    event.preventDefault();

    //Selezioniamo gli elementi del login
    var userInput = document.getElementById("user1").value;
    var userPassword = document.getElementById("myInput").value;
    /**/
    $.ajax({
        url: "../accessoServlet",
        method: 'POST',
        data: {
            Username: userInput,
            Password: userPassword
        }
    }).done(data => {
        const response = JSON.parse(data);

        if(response.ok == true){
        
        	 window.location.href="UserINJSP.jsp";       					
        }else {
        	const messageError = $("#error");
        	messageError.text(response.message);
        	messageError.css("opacity", "1");
            userInput.css("border","red");
            userPassword.style.border = "1px solid red";
            userInput.value = null;
            userPassword.value = null;       
        }       
    })
}