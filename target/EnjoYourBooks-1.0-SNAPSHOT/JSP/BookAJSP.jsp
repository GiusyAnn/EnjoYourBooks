<%@page import="model.DriverManagerConnectionPool"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" 
    import="java.sql.*"
     %>
<%@ page 	import="dao.*"
 			import="model.*"
 			import="java.util.*" %>     
   
     
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BookCSS.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BarNavCSS.css">
 <link rel="icon" href="${pageContext.request.contextPath}/Img/libro-abierto.png">
<title>EnjoYourBooks</title>
</head>
<body>

<!-- Barra Navigazione -->
<jsp:include page="NavLJSP.jsp"></jsp:include>

<%
bookBean libro = new bookBean();
libro = (bookBean) request.getAttribute("libro");
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
   	
   	    <form action="ApprovaServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN">Approva Libro</button></form><br>
   		<form action="DeleteBookServlet" method="post"><button class="submit" value="<%=libro.getISBN() %>" name="ISBN"> Rimuovi Libro </button></form>
   	
   
   	
   	</div>
   	 
   
   <div class="rightcard">
   	<!-- La classe accordion serve per definire lo stile dei bottni -->
		<button class="accordion"> Leggi la trama: </button>
		<!-- La classe panel definisce la scritta sotto. -->
		<div class="panel">
		  <p><%=libro.getTrama()%></p>
		</div>
   </div>
   
    <div class="leftcard">
      <h3></h3>
           <p><br><br><br> ... <br></p>
    </div>
  </div> 
 </div> 
  
  <!-- per far inserire un commento al libro -->
  
    


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