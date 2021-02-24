<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Check out</title>
<link rel="stylesheet" href="../css/TableCSS.css">
<link rel="stylesheet" href="../css/styleCSS.css">
<link rel="stylesheet" href="../css/BarNavCSS.css">
<link rel="icon" href="../Img/libro-abierto.png">
</head>
<body>

<!-- Navbar  -->
<%@ include file="NavBarJSP.jsp" %>

    <form action="../CheckoutServlet" method="POST">
<div class="row" style="margin-top:60px; margin-bottom:60px;">
  <div class="col-75">
    <div class="container">
  
      
        <div class="row">
          <div class="col-50">
            <h3>Dati Utente</h3>
            <label for="fname"><i class="fa fa-user"></i> Nome </label>
            <input type="text" id="fname" name="nome" value="<%= user.getnome()%>">
            <label for="email"><i class="fa fa-user"></i> Cognome</label>
            <input type="text" id="email" name="cognome" value="<%=user.getcognome()%>">
            <label for="adr"><i class="fa fa-address-card-o"></i> E-mail </label>
            <input type="text" id="adr" name="email" value="<%=user.getEmail()%>">
           

            <div class="row">
              <div class="col-50">
                <label ></label>
                
              </div>
              <div class="col-50">
                <label></label>
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Pagamento</h3>
            <label for="fname">Carte Accettate</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="state"><i class="fa fa-user"></i> Nome Intestatario</label>
            <input type="text" id="cname" name="name" placeholder="<%=user.getnome()%> <%=user.getcognome()%>">
            <label for="state"><i class="fa fa-cc-mastercard"></i> Numero Carta Di Credito</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
           <label for="state"><i class="fa fa-cc-mastercard"></i> Mese e Anno di Scadenza</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="Settembre 2022">
            <div class="row">
              <div class="col-50">
                <label for="state"><i class="fa fa-cc-mastercard"></i> CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
        </label>
        <input type="submit" value=" Procedi al Pagamento " class="btn">
    
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Carrello <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%=dim %></b></span></h4>
     <%double tot=0; for(bookBean l:carr){ %>
      <p><form action="../bookServlet" methdo="POST"><button class="det" value="<%=l.getISBN()%>" name="ISBN"><%=l.getTitolo() %></button>
      </form><span class="price"><%=l.getPrezzo() %>&#8364;</span></p> <% tot= tot+l.getPrezzo();} %>
      <hr>
      <p>Totale <span class="price" style="color:black"><b><button  class="det"  value="<%=tot %>"  name="tot"><%=tot %>&#8364;</button></b></span></p>
    </div>
  </div>
</div>
  </form>
<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>