<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ordini</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link type="text/css" rel="stylesheet" href="css/LoginCSS.css" >
  <link type="text/css"  rel="stylesheet" href="css/styleCSS.css">
  <link  type="text/css"  rel="stylesheet" href="css/BarNavCSS.css">
  <link type="text/css" rel="stylesheet" href="css/RegistrazioneCSS.css" >
  <link rel="icon" href="Img/libro-abierto.png">
</head>
<body>

<!-- Barra Navigazione -->
<%@ include file="NavLJSP.jsp" %>
<% ArrayList<String> utenti = (ArrayList<String>) request.getAttribute("nomi"); %>
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">


<!--  Tabella Accesso -->
<div class="table th  w3-auto w3-display-middle w3-center w3-margin-bottom  w3-hide-small" >
			<form action ="OrdineUtenteServlet" method="POST">
						
						<h1> Utente </h1>
						<br>
						<div class="tableRow ">
						 <div class="tab" ></div><br>
   							
   							<select name="username" id="selectStyle">    							
    							<% for(String l:utenti) { %>
    							<option value="<%= l%>"><%=l %></option>
    							<%} %>
    						</select>
						</div>						
						<br>
						<input type="submit" class="submit center" value="Visualizza Ordini">
						
						
						</form>
				</div>
				</div>
		
		<!-- Footer -->
<jsp:include page="footerLJSP.jsp"></jsp:include>

</body>
</html>