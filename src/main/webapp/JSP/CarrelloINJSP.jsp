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
<%@ include file="NavBarJSP.jsp" %>


<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="projects">
    <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16" style="margin:0 70px 0 70px;" ></h2>
  </div>

<div class="w3-row-padding " >
<%

if(carr==null){
	%> <h2>Non ci sono Libri nel Carrello</h2><% 
}else{
%>
<table >
	
 	<tr class="tabelenco" >
 	<th> Copertina </th>
 	<th> Titolo </th>
 	<th> Autore </th>
 	<th> ISBN </th>
 	<th> Prezzo </th>
 	<th> Quantita' </th>
 	<th></th>		
 	</tr>
<%	int c = 0;
	double sum = 0;
	for(bookBean l:carr){ 				
 %>
 	<tr class="tabelenco">
 	<td> <form action="../bookServlet" method="post"><button class="det" value="<%=l.getISBN() %>" name="ISBN" ><img src="<%= l.getCopertina() %>" style="width: 65px; height: 90px;"></button> </td>
 	<td><button class="det" value="<%=l.getISBN() %>" name="ISBN" ><%=l.getTitolo() %></button></td>
 	<td><button class="det" value="<%=l.getISBN() %>" name="ISBN" > <%= l.getAutore() %></button></td>
 	<td > <button class="det" value="<%=l.getISBN() %>" name="ISBN" ><%= l.getISBN() %></button></form> </td>
 	<td> <%= l.getPrezzo() %>&#8364; </td>
 	<td><%= l.getQuantita() %> </td>
 	<td><form action="../RemoveCartServlet" method="POST"><button class=" delsubmit " value="<%=l.getISBN() %>" name="ISBN">Rimuovi Articolo</button></form><td>
 	</tr>
 	<% sum = sum + l.getPrezzo(); 
 	if(l.getTipo().equalsIgnoreCase("Cartaceo")) c++; }%>
	<tr>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<th> Prezzo Totale : </th>
	<td><%=sum %>&#8364;</td></tr>
 </table>
 <% if(user!=null){ %>
<%if (c>0){ %><a href="ChecoutSJSP.jsp" class="submit">Procedi all'Acquisto</a><%} else { %>
	<a href="ChecoutJSP.jsp" class="submit">Procedi all'Acquisto</a><%}}
 else{ %> <p style="color:red">Effettuare l'accesso prima di proseguire con l'acquisto</p><a href="LoginJSP.jsp">Accedi</a><%}} %>
</div><br><br><br><br><br><br>
</div>

<!-- Footer -->
<jsp:include page="footerJSP.jsp"></jsp:include>

</body>
</html>