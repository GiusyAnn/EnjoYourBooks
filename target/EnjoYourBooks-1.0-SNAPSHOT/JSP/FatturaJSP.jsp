<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/FatturaCSS.css">
  <link rel="icon" href="Img/libro-abierto.png">
<title>Fattura</title>
</head>
<body>
	
<%	userBean user = (userBean) session.getAttribute("user");
	ArrayList<fatturaBean> fattura = (ArrayList<fatturaBean>) request.getAttribute("fattura");
if(fattura.isEmpty()) System.out.println("fattura is empty");%>

	<!-- Div iniziale per i dati del cliente generali -->
	
	<div>
	<h2>Fattura</h2>
	<img src="Img/Logot.png">
	  <p class="end">
	   	<b>Ditta:</b> "<i>EnjoYourBooks</i>"
	   	<br>
	   	<b>Data di emisione della fattura:</b>
	  	<br>
	  	<%=fattura.get(0).getDataorder() %>
	  	<br><br>
	  	<b>Numero fattura:</b>
	  	<br>
	  	<%=fattura.get(0).getNumordine() %>
	  </p>	
	  <p class="start">	
	  	<b>Intestatario della fattura:</b>
	  	<br>
	  	Nome: <%=user.getnome() %>
	  	<br>
	  	Cognome: <%=user.getcognome() %>
	  	<br>
	  	E-mail: <%=user.getEmail() %>
	  	<br>
	  	Via: <%=user.getVia() %>
	  	<br>
	  	CAP: <%=user.getCap() %>
	  	<br>
	  	Citta': <%=user.getCitta() %>
	  	<br><br>
	 </p>
	</div>
	
	<div class="responsive">
	<table>
	  <tr>
	    <th>ISBN</th>
	    <th>Titolo</th>
	    <th>Quantita'</th>
	    <th>Prezzo</th>
	    <th>IVA</th>
	    <th></th>
	    <th>TOTALE<th>
	  </tr>
	  
	  
	  <!-- Per ogni libro che sta nel carrello: -->
	  <%for(fatturaBean f:fattura){ %>
	  <tr>
	    <td><%=f.getIsbn() %></td>
	    <td><%=f.getTitolo() %></td>
	    <td><%=f.getQuantita() %></td>
	    <td><%=f.getPrezzo() %></td>
	    <td><%=f.getIva() %></td>
	    
	   </tr>
	  <%} %>
	  <tr>
	    <td></td>
	    <td></td>
	    <td></td>
	    <td></td>
	    <td></td>
	    <td></td>
	  	<td class="right"><%=fattura.get(0).getTotale() %></td>
	  </tr>
	  <!-- Fine ciclo. -->

	</table>
	</div>
	


</body>
</html>