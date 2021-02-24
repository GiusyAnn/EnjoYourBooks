$(document).ready(() => {
	//Seleziono le due form: login e registrazione con jquery
    const formReg = $("[name='verifica']");
    //Chiama l'evento onLoginSubmit o onSignUpSubmit quando viene fatto il submit della form
    formLogin.on('submit', onRegSubmit);
})

function onRegSubmit(){
	event.preventDefault();
    //Selezioniamo gli elementi del login
    var userInput = document.getElementById("user").value;
    var userPassword = document.getElementById("myInput").value;
    /**/
    $.ajax({
    	url:"../verificaRegServlet",
    	method: 'POST',
    	data:{ Username: userInput, Password: userPassword}
    })
    .done(data => {
        const response = JSON.parse(data);

        if(response.ok == false){
        	const messageError = $("#error");
        	messageError.text(response.message);
        	messageError.css("opacity", "1");
            userInput.style.border = "1px solid red";
            userPassword.style.border = "1px solid red";
            userInput.value = null;
            userPassword.value = null;       
        }       
    })
}