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
ArrayList<dettagliBean> ordini = (ArrayList<dettagliBean>) request.getAttribute("elenco");
%>
<table >
	
 	<tr class="tabelenco" >
 	<th> Copertina </th>
 	<th> Titolo </th>
 	<th> Autore </th>
 	<th> ISBN </th>
 	<th> Codice Ordine </th>
 	<th> Prezzo </th>
 	<th> IVA </th>
 	<th> Quantita' </th> 		
 	</tr>
<%
	for(dettagliBean l:ordini) { 				
 %>

 	<tr class="tabelenco">
 	<td> <form action="bookServlet" method="post"><button class="det" value="<%=l.getISBN() %>" name="ISBN" ><img src="<%= l.getCopertina() %>" style="width: 65px; height: 90px;"></button> </td>
 	<td><button class="det" value="<%=l.getISBN() %>" name="ISBN" ><%=l.getTitolo() %></button></td>
 	<td><button class="det" value="<%=l.getISBN() %>" name="ISBN" > <%= l.getAutore() %></button></td>
 	<td > <button class="det" value="<%=l.getISBN() %>" name="ISBN" ><%= l.getISBN() %></button></form> </td>
 	<td> <%= l.getCodiceOrdine() %> </td>
 	<td> <%= l.getPrezzo() %>&#8364; </td>
 	<td> <%= l.getIVA() %> </td>
 	<td><%= l.getQuantita() %> </td>
 	<% if(user.getrole().equalsIgnoreCase("Utente")) { %>
 	<td> <form action="newRecensioneServlet" method="POST" >
 	<button class="submit" name="ISBN" value="<%=l.getISBN()%>">Inserisci Recensione</button></form><%} %>
 	</tr>
 	<%} %>

 </table><br><br><br><br>

	
</div>

</div>
<!-- Footer -->
<jsp:include page="footerLJSP.jsp"></jsp:include>

</body>
</html>