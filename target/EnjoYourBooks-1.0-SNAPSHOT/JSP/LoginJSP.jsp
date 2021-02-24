<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="../JS/LoginJS.js"></script>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link type="text/css" rel="stylesheet" href="../css/LoginCSS.css" >
  <link type="text/css"  rel="stylesheet" href="../css/styleCSS.css">
  <link  type="text/css"  rel="stylesheet" href="../css/BarNavCSS.css">  
  <link rel="icon" href="../Img/libro-abierto.png">
</head>
<body>

<!-- Barra Navigazione -->
<%@ include file="NavBarJSP.jsp" %>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">


<!--  Tabella Accesso -->
<div class="table th  w3-auto w3-display-middle w3-center w3-margin-bottom  w3-hide-small" >
	

						<form name ="login" action ="../accessoServlet" method="POST" >

						

						<h1>Accedi</h1>
					
						<p id="error" style="color:red;"></p>
						
						<div class="tableRow ">
						 <div class="input-container">
    					<i class="fa fa-user icon"></i>
    					<input class="input-field" type="text" id="user1" placeholder="Username" name="Username">
  						</div>
						</div><br>
						
						<div class="tableRow ">
						<div class="input-container">
    					<i class="fa fa-key icon"></i>
    					<input class="input-field" type="password" placeholder="Password" name="Password" id="myInput">
 						 </div>
						</div>						
						<br>
						<input type="checkbox" onclick="myFunction()" class="center">Show Password
						<script>
						function myFunction() {
	  						var x = document.getElementById("myInput");
	  						if (x.type === "password") {
	    						x.type = "text";
	  						} else {
	    						x.type = "password";}}
						</script><br><br>
						
						
						<input type="submit" class="submit center"  value="Accedi">
						
						
						</form>
						<form >
							
								<p align="center" >Non Sei Registrato?</p><br>
								
								
									
									<a href="RegistrazioneJSP.jsp"><input type="button" class="submit center" value="Registrati" ></a>
								
										
							
						</form>
		</div>
</div>

		
<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>