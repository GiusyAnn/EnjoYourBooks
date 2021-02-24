<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script src="JS/UserBooksJS.js"></script>
<link rel="stylesheet" href="css/UserCSS.css">
<link rel="stylesheet" href="css/BarNavCSS.css">
<link rel="stylesheet" href="css/TableCSS.css">
<link rel="icon" href="Img/libro-abierto.png">
<title>Profilo Personale</title>
</head>
<body>

<%@ include file="NavLJSP.jsp" %>

<div class="container" style="margin-bottom:90px;">

<%String intestazione;
Integer contatoreAccesso = (Integer)session.getAttribute("accessCount");

%>

    <div class="row align-items-center my-5">
      <div class="col-lg-7">
      <br><br><br>
        <img src="<%=user.getProfilo() %>" class="img-fluid rounded mb-4 mb-lg-0"  alt="immagine di profilo" style="width: 250px; height: 250px;">
      </div>
      
      <%
		
		if(contatoreAccesso==null){
			contatoreAccesso=0;
			intestazione="Benvenuto ";
		}else {
			contatoreAccesso++;
			intestazione = "Bentornato ";
		}
		
		session.setAttribute("accessCount", contatoreAccesso);
      %>
      
     
      <div class="col-lg-5" style="margin-top:90px;">
      	<h3 class="font-weight-light"><br><%=intestazione%></h3>
        <h2 class="font-weight-light"><%=user.getnome() %>  <%=user.getcognome() %></h2>
        <% if(user.getrole().equalsIgnoreCase("Utente")) {%>
        <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-footer">
            <a href="JSP/ImgprofiloJPS.jsp" class="submit">Modifica Immagine del Profilo</a>
          </div>
        </div>
      </div><%} %>
      </div>
    
     <!-- AMMINISTRATORE -->
     <% if(user.getrole().equalsIgnoreCase("Amministratore")) {%>
      
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="card-footer">
            <form action="hideServlet" method="post"><button class="submit">Libri Da Approvare</button></form>
          </div>
        </div>
     
      <!-- /.col-md-4 -->
     
        <div class="w3-col l3 m6 w3-margin-bottom">
         <div class="card-footer">
            <a href="JSP/NewBookJSP.jsp" class="submit">Aggiungi Libro </a>
          </div>
        </div>
      
      
      <!-- /.col-md-4 -->
      
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="card-footer">
            <form action="AllBServlet" method="post"><button class="submit">Modifica Libri</button></form>
          </div>
        </div>
      
      
      <!-- /.col-md-4 -->
     
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="card-footer">
            <form action="OrdiniServlet" method="post"><button class="submit">Visualizza Ordini</button></form>
          </div>
        </div>
     
      
      
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="card-footer">
            <a href="JSP/RangeDateJSP.jsp" ><button class="submit">Ordini Data Range</button></a>
          </div>
        </div>
     
      
      
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="card-footer">
            <form action="getUserServlet" method="post" ><button class="submit">Ordini Utene</button></form>
          </div>
        </div>
      
      <%} else { %>
      <div class="col-md-4 mb-5">
        <div class="card h-100">
         <div class="card-footer">
            <form action="OrdineUtenteServlet" method="post" ><button value="<%=user.getuser()%>" name="username"class="submit">I Miei Ordini</button></form>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-footer">
           <a href="JSP/PreferitiElencoJSP.jsp"></a><button value="<%=user.getuser()%>" name ="username" class="submit">Lista Desideri</button></<a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-4 mb-5">
        <div class="card h-100">
          <div class="card-footer">
            <a href="JSP/ModprofiloJPS.jsp" class="submit">Modifica Profilo</a>
          </div>
        </div>
      </div>
      
      
      <div class="rightcard" style="width: 100%;">
   	<!-- La classe accordion serve per definire lo stile dei bottni -->
		<button class="accordion" id="pub" name="User"> Libri Pubblicati </button>
		<!-- La classe panel definisce la scritta sotto. -->
		<div class="panel">
		  <p> Elenco dei Libri Pubblicati dall'utente come nel catalogo </p>
		  
		</div>
   </div>
      
      <br><br><br><br>
      
      <%} %>
      
    </div>
</div>


<%@ include file="footerLJSP.jsp" %>
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
</body>
</html>