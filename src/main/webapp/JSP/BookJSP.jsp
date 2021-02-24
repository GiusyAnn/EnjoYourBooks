<%@page import="model.DriverManagerConnectionPool"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="java.sql.*"
     %>
<%@ page 	import="dao.*"
 			import="model.*"
 			import="java.util.*" %>     
   
     
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BookCSS.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BarNavCSS.css">
 <link rel="icon" href="${pageContext.request.contextPath}/Img/libro-abierto.png">
 <script src="JS/RecensioniJS.js"></script>
<title>EnjoYourBooks</title>
</head>
<body>

<!-- Barra Navigazione -->
<jsp:include page="NavLJSP.jsp"></jsp:include>

<%
bookBean libro = new bookBean();
libro = (bookBean) request.getAttribute("libro");
%>
<%
userBean user = (userBean) session.getAttribute("user");
ArrayList<bookBean> preferiti = (ArrayList<bookBean>) session.getAttribute("preferiti");
boolean love=false ; 
	if(preferiti!=null){for(bookBean b:preferiti){
		if(b.getISBN().equalsIgnoreCase(libro.getISBN())){
			love = true; break;
		}
}}
%>
	<div class="row">
  <div class="column">

  
    <div class="leftcard">
       <!-- Copertina del libro -->
       <% if( libro.getUsername() == null) { %>
	      	<img id ="copertina" src="<%=libro.getCopertina() %>" alt="Copertina del libro"></img>
	      	
	    <%} else { %> 
	    	
		    <div id="copertina" class=" ut" >
		    <h1 class="titut"><%=libro.getTitolo() %></h1><h5 class="aut"><%=libro.getAutore()%></h5>
		    </div>
		 
	    <%} %>
    </div>
   
   <div class="leftcard">
   
   	<h2 class="titolo"><%=libro.getTitolo() %><br></h2>
   	
   	<p>Genere: <b><%=libro.getGenere()%></b></p>
   	
   	<p>Autore: <b><%=libro.getAutore()%></b></p>
   	
   	<p>Casa Editrice: <b><%= libro.getCasaEditrice()%></b></p>
   	
   	<h3>Prezzo: <b><%=libro.getPrezzo()%> &#8364;</b></h3>
   	
   	<%if(user!=null && user.getrole().equalsIgnoreCase("Utente")) { if(love){ %>
   	<button id="noLove" class="det" name="ISBN" value="<%=libro.getISBN()%>"><i class="fa fa-heart heart" style="color:#CD5656;" onclick ></i></button>
   <% } else {  %>
   <button id="Love" class="det" name="ISBN" value="<%=libro.getISBN()%>"><i class="fa fa-heart heart" style="color:#A8A8A8;"onclick ></i></button>
 <%} %>
	   <%	if(libro.getTipo().equalsIgnoreCase("CartaceoDigitale")){ %>
	   <p> Disponibile sia in formato cartaceo che digitale<br>
		   Ancora <b><%=libro.getQuantita()%> disponibili.</b></p>
	   <form action="aggiungiServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Digitale </button></form><br>
	   <form action="aggiungiServlet" method="post">Numero Copie  <input type="number" value="1" name="quantita" class="num" min="1" max="<%=libro.getQuantita() %>"><br><br>
		   <button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Cartaceo </button></form>
	   <!-- radio button per la scelta tra cartaceo o digitale -->
	   <% } else if(libro.getTipo().equalsIgnoreCase("Cartaceo")){ %>
	   <p> Disponibile solo in formato cartaceo <br>
		   Ancora <%=libro.getQuantita()%> disponibili.</p><br>
	   <form action="aggiungiServlet" method="post">Numero Copie  <input type="number" value="1" name="quantita" class="num" min="1" max="<%=libro.getQuantita() %>"><br><br>
		   <button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Cartaceo </button></form>
	   <%} else{%>
	   <p> Disponibile solo in formato digitale</p>
	   <form action="aggiungiServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Digitale </button></form>
	   <% } }%>
 <% if(user==null || user.getuser().equalsIgnoreCase("Utente")){ %>
   <%	if(libro.getTipo().equalsIgnoreCase("CartaceoDigitale")){ %>
   	<p> Disponibile sia in formato cartaceo che digitale<br>
   		Ancora <b><%=libro.getQuantita()%> disponibili.</b></p>
   		<form action="aggiungiServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Digitale </button></form><br>
   		<form action="aggiungiServlet" method="post">Numero Copie  <input type="number" value="1" name="quantita" class="num" min="1" max="<%=libro.getQuantita() %>"><br><br>
   		<button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Cartaceo </button></form>
   	<!-- radio button per la scelta tra cartaceo o digitale -->
   	<% } else if(libro.getTipo().equalsIgnoreCase("Cartaceo")){ %>
   	<p> Disponibile solo in formato cartaceo <br>
   		Ancora <%=libro.getQuantita()%> disponibili.</p><br>
   		<form action="aggiungiServlet" method="post">Numero Copie  <input type="number" value="1" name="quantita" class="num" min="1" max="<%=libro.getQuantita() %>"><br><br>
   		<button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Cartaceo </button></form>
   	<%} else{%>
   	<p> Disponibile solo in formato digitale</p>
   	<form action="aggiungiServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Acquista Libro Digitale </button></form>
   	<% } }%>
   	
   	</div>
   	 
   
   <div class="rightcard">
   	<!-- La classe accordion serve per definire lo stile dei bottni -->
		<button class="accordion"> Leggi la trama: </button>
		<!-- La classe panel definisce la scritta sotto. -->
		<div class="panel">
		  <p><%=libro.getTrama()%></p>
		</div>
   </div>
   
    <div class="rightcard" style="margin-bottom: 90px;">
   	<!-- La classe accordion serve per definire lo stile dei bottni -->
	
		<button class="accordion" id="recensione" value="<%=libro.getISBN() %>" name="ISBN">
		 Recensioni Libro </button>
		<!-- La classe panel definisce la scritta sotto. -->
		<div class="panel"> <br>
		  <%
			ArrayList<recensioneBean> elenco = (ArrayList<recensioneBean>) request.getAttribute("recensioni");
				if(elenco==null){ %>
			<h2 id="messageError"></h2> <% } else{ 
			for(recensioneBean r:elenco) {%>
				<div class="comment">
		 		 <img src="<%=r.getFoto()%>" class="imgProfil"><span><h4 ><%=r.getUsername() %> </h4></span>
		  		<h5> Voto : <b> <%=r.getVoto() %> </b>  </h5>
		  		<p><%=r.getCommento() %></p>
		  		</div><br>
		  <%}} %>
		</div>
   </div> 
  
  
  </div>
  </div>
    


<!-- Serve per chiudere e aprire la trama -->
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>

<jsp:include page="footerLJSP.jsp"></jsp:include>


</body>
</html>