<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Modifica</title>
<link rel="stylesheet" href="css/TableCSS.css">
<link rel="stylesheet" href="css/styleCSS.css">
<link rel="stylesheet" href="css/BarNavCSS.css">
<link rel="icon" href="Img/libro-abierto.png">
</head>
<body>
<!-- Navbar  -->
<%@ include file="NavLJSP.jsp" %>
 <form action="ModBookServlet" method="post">
<%
bookBean libro = new bookBean();
libro = (bookBean) request.getAttribute("libro");
%>
 <div class="row" style="margin-top:55px;">

          <div class="col-50">
            <h3>Libro</h3>
            <label for="fname"><i class="fa fa-book"></i> ISBN </label>
            <input type="text" readOnly id="fname" name="ISBN" class="in" value="<%=libro.getISBN()%>">
            <label for="email"><i class="fa fa-book"></i> Titolo</label>
            <input type="text" id="email" name="Titolo" value="<%=libro.getTitolo()%>">
            <label for="adr"><i class="fa fa-user"></i> Autore</label>
            <input type="text" id="adr" name="Autore" value="<%=libro.getAutore()%>">
            <label for="city"><i class="fa fa-star"></i> Genere</label>
            	<select name="genere" id="selectStyle" class="inpt"> 
         <option value="<%=libro.getGenere() %>"><%=libro.getGenere() %></option>
    	<option value="fan-fiction">Fanfiction</option>
		<option value="Fantasy">Fantasy</option>
		<option value="Horror">Horror</option> 
		<option value="Istruzione">Istruzione</option>
		<option value="Umorismo">Umorismo</option>
		<option value="YoungAdult">Young Adult</option>
	</select>
	

            <div class="row">
              <div class="col-50">
                <label for="state"><i class="fa fa-money"></i> Prezzo</label>
                <input type="text" id="state" name="prezzo" value="<%=libro.getPrezzo() %>">
              </div>
              <div class="col-50">
                <label for="zip"><i class="fa fa-book"></i> Quantita'</label>
                <input type="text" id="zip" name="quantita" value="<%=libro.getQuantita()%>">
              </div>
               
            </div>
          </div>

          <div class="col-50">
            <h3>Modifica Dati Libro</h3>
            <label for="fname"><i class="fa fa-book"></i> Tipo</label>
             
	<select name="tipo" id="selectStyle"  class="inpt">
		<option value="<%=libro.getTipo() %>"><%=libro.getTipo() %></option> 
    	<option value="CartaceoDigitale">Cartaceo e Digitale</option>
		<option value="Digitale">Digitale</option>
		<option value="Cartaceo">Cartaceo</option> 
	</select>
            <label for="cname"><i class="fa fa-photo"></i> Copertina</label>
            <input type="text" id="cname" name="copertina" value="<%=libro.getCopertina()%>">
            <label for="ccnum"><i class="fa fa-book"></i> Casa Editrice</label>
            <input type="text" id="ccnum" name="casae" value="<%=libro.getCasaEditrice()%>">
            <div class="col-50">
                <label for="zip"><i class="fa fa-book" ></i> Trama</label>
                <textarea class="txtar"name="Trama" value="<%=libro.getTrama()%>"><%=libro.getTrama()%></textarea>
             </div>
          </div>
          
        </div>
        
          <label >
    	</label> 
        
        <input type="submit" value="Modifica" class="btn"><br><br><br><br><br>
      
   
</form>
  


<!-- Footer -->
<%@ include file="footerLJSP.jsp" %>

</body>
</html>