<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<% String isbn = (String) request.getAttribute("isbn"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recensione</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link type="text/css" rel="stylesheet" href="css/LoginCSS.css" >
   <link type="text/css" rel="stylesheet" href="css/TableCSS.css" >
  <link type="text/css"  rel="stylesheet" href="css/styleCSS.css">
  <link  type="text/css"  rel="stylesheet" href="css/BarNavCSS.css">
  <link type="text/css" rel="stylesheet" href="css/RegistrazioneCSS.css" >
  <link rel="icon" href="Img/libro-abierto.png">
</head>
<body>

<!-- Barra Navigazione -->
<%@ include file="NavLJSP.jsp" %>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">


<!--  Tabella Accesso -->
<div class="table th  w3-auto w3-display-middle w3-center w3-margin-bottom  w3-hide-small" >
			<form action ="WriteRecesioneServlet" method="POST">
						
						<h1> Recensione </h1>
						<div class="tableRow ">
   							<label for="fname"> </label>
            <input type="text" readOnly  name="ISBN" class="in" value="<%=isbn %>">
   							<label> Voto: <select name="Voto" id="selectStyle" style="width: 80px; margin-left:90px;">
   								<option value="0">0</option>
   								<option value="1">1</option>    							
    							<option value="2">2</option>
    							<option value="3">3</option>
    							<option value="4">4</option>
    							<option value="5">5</option>
    						</select> </label>
    						</div>
    						<div class="tableRow">
    						<textarea class="txtar" name="recensione" placeholder="Aggiungi Recensione"></textarea>
						</div>						
						<br>
						<input type="submit" class="submit center" value="Aggiungi Recensione">
						
						
						</form>
				</div>
				</div>
		
		<!-- Footer -->
<jsp:include page="footerLJSP.jsp"></jsp:include>

</body>
</html>