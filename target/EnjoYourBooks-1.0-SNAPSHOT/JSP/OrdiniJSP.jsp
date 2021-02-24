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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleCSS.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/BarNavCSS.css">
  <link rel="icon" href="${pageContext.request.contextPath}/Img/libro-abierto.png">

</head>
<body>

<!-- ${pageContext.request.contextPath} -->
<!-- Barra Navigazione -->
<%@ include file="NavLJSP.jsp" %>


<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="projects">
    <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16" style="margin:0 70px 0 70px;" ></h2>
  </div>

<div class="w3-row-padding " >
<%
ArrayList<orderBean> ordini = (ArrayList<orderBean>) request.getAttribute("elenco");
if(ordini.size()== 0){ %>
<h2>Nessun ordine effettuato</h2> <% } else{ %>
<table >
	
 	<tr class="tabelenco" >
 	<th> Username </th>
 	<th> Codice Ordine </th>
 	<th> Prezzo </th>
 	<th> Data </th>
 	<%if(user.getrole().equalsIgnoreCase("Utente")) {%>
 	<th> Richiedi Fattura </th><%} %>	
 	</tr>
<%
	for(orderBean l:ordini) { 				
 %>

 	<tr class="tabelenco">
 	<td > <%= l.getUsername() %></td>
 	<td> <%= l.getCodiceOrdine() %> </td>
 	<td> <%= l.getPrezzoTotale()%>&#8364; </td>
 	<td> <%= l.getDataO() %> </td>
 	<%if(user.getrole().equalsIgnoreCase("Utente")) {%>
 	<td> <form action="fatturaServlet" method="post"><button style="width: 75px; height: 85px;" class="det" name="ordine" value="<%= l.getCodiceOrdine() %>" ><img src="Img/documento.png"></button></form> </td><%} %>
 	<td> <form action="dettagliServlet" method="post"><button name="ordine" value="<%= l.getCodiceOrdine() %>" class="submit">Visualizza Dettagli Ordine</button></form></td>
 	</tr> 	
 	<%}} %>

 </table><br><br><br><br>

	
</div>

</div>
<!-- Footer -->
<jsp:include page="footerLJSP.jsp"></jsp:include>

</body>
</html>