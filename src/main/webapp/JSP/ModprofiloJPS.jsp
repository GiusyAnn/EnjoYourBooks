<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Modifica</title>
<link rel="stylesheet" href="../css/TableCSS.css">
<link rel="stylesheet" href="../css/styleCSS.css">
<link rel="stylesheet" href="../css/BarNavCSS.css">
<link rel="icon" href="../Img/libro-abierto.png">
</head>
<body>
<!-- Navbar  -->
<%@ include file="NavBarJSP.jsp" %>
 <form action="../ModServlet" method="post">

 <div class="row" style="margin-top:55px;">

          <div class="col-50">
            <h3>Dati Utente</h3>
            <label for="fname"><i class="fa fa-user"></i> Username </label>
            <input type="text" readOnly id="fname" name="Username" class="in" value="<%=user.getuser()%>">
            <label for="email"><i class="fa fa-key"></i> Password</label>
            <input type="text" id="email" name="password" value="<%=user.getpass()%>">
            <label for="adr"><i class="fa fa-address-card-o"></i> Via</label>
            <input type="text" id="adr" name="via" value="<%=user.getVia()%>">
            <label for="city"><i class="fa fa-institution"></i> Citta'</label>
            <input type="text" id="city" name="citta" value="<%=user.getCitta()%>">

            <div class="row">
              <div class="col-50">
                <label for="state"><i class="fa fa-institution"></i> Provincia</label>
                <select id="selectStyle"  class="inpt" name="provincia" >
     <option value="<%=user.getProvincia()%>"><%=user.getProvincia() %></option>
	<option value="AG">Agrigento</option>
	<option value="AL">Alessandria</option>
	<option value="AN">Ancona</option>
	<option value="AO">Aosta</option>
	<option value="AR">Arezzo</option>
	<option value="AP">Ascoli Piceno</option>
	<option value="AT">Asti</option>
	<option value="AV">Avellino</option>
	<option value="BA">Bari</option>
	<option value="BT">Barletta-Andria-Trani</option>
	<option value="BL">Belluno</option>
	<option value="BN">Benevento</option>
	<option value="BG">Bergamo</option>
	<option value="BI">Biella</option>
	<option value="BO">Bologna</option>
	<option value="BZ">Bolzano</option>
	<option value="BS">Brescia</option>
	<option value="BR">Brindisi</option>
	<option value="CA">Cagliari</option>
	<option value="CL">Caltanissetta</option>
	<option value="CB">Campobasso</option>
	<option value="CI">Carbonia-iglesias</option>
	<option value="CE">Caserta</option>
	<option value="CT">Catania</option>
	<option value="CZ">Catanzaro</option>
	<option value="CH">Chieti</option>
	<option value="CO">Como</option>
	<option value="CS">Cosenza</option>
	<option value="CR">Cremona</option>
	<option value="KR">Crotone</option>
	<option value="CN">Cuneo</option>
	<option value="EN">Enna</option>
	<option value="FM">Fermo</option>
	<option value="FE">Ferrara</option>
	<option value="FI">Firenze</option>
	<option value="FG">Foggia</option>
	<option value="FC">Forl&igrave;-Cesena</option>
	<option value="FR">Frosinone</option>
	<option value="GE">Genova</option>
	<option value="GO">Gorizia</option>
	<option value="GR">Grosseto</option>
	<option value="IM">Imperia</option>
	<option value="IS">Isernia</option>
	<option value="SP">La spezia</option>
	<option value="AQ">L'aquila</option>
	<option value="LT">Latina</option>
	<option value="LE">Lecce</option>
	<option value="LC">Lecco</option>
	<option value="LI">Livorno</option>
	<option value="LO">Lodi</option>
	<option value="LU">Lucca</option>
	<option value="MC">Macerata</option>
	<option value="MN">Mantova</option>
	<option value="MS">Massa-Carrara</option>
	<option value="MT">Matera</option>
	<option value="VS">Medio Campidano</option>
	<option value="ME">Messina</option>
	<option value="MI">Milano</option>
	<option value="MO">Modena</option>
	<option value="MB">Monza e della Brianza</option>
	<option value="NA">Napoli</option>
	<option value="NO">Novara</option>
	<option value="NU">Nuoro</option>
	<option value="OG">Ogliastra</option>
	<option value="OT">Olbia-Tempio</option>
	<option value="OR">Oristano</option>
	<option value="PD">Padova</option>
	<option value="PA">Palermo</option>
	<option value="PR">Parma</option>
	<option value="PV">Pavia</option>
	<option value="PG">Perugia</option>
	<option value="PU">Pesaro e Urbino</option>
	<option value="PE">Pescara</option>
	<option value="PC">Piacenza</option>
	<option value="PI">Pisa</option>
	<option value="PT">Pistoia</option>
	<option value="PN">Pordenone</option>
	<option value="PZ">Potenza</option>
	<option value="PO">Prato</option>
	<option value="RG">Ragusa</option>
	<option value="RA">Ravenna</option>
	<option value="RC">Reggio di Calabria</option>
	<option value="RE">Reggio nell'Emilia</option>
	<option value="RI">Rieti</option>
	<option value="RN">Rimini</option>
	<option value="RM">Roma</option>
	<option value="RO">Rovigo</option>
	<option value="SA">Salerno</option>
	<option value="SS">Sassari</option>
	<option value="SV">Savona</option>
	<option value="SI">Siena</option>
	<option value="SR">Siracusa</option>
	<option value="SO">Sondrio</option>
	<option value="TA">Taranto</option>
	<option value="TE">Teramo</option>
	<option value="TR">Terni</option>
	<option value="TO">Torino</option>
	<option value="TP">Trapani</option>
	<option value="TN">Trento</option>
	<option value="TV">Treviso</option>
	<option value="TS">Trieste</option>
	<option value="UD">Udine</option>
	<option value="VA">Varese</option>
	<option value="VE">Venezia</option>
	<option value="VB">Verbano-Cusio-Ossola</option>
	<option value="VC">Vercelli</option>
	<option value="VR">Verona</option>
	<option value="VV">Vibo valentia</option>
	<option value="VI">Vicenza</option>
	<option value="VT">Viterbo</option>
</select>
              </div>
              <div class="col-50">
                <label for="zip"><i class="fa fa-institution"></i> CAP</label>
                <input type="text" id="zip" name="cap" value="<%=user.getCap()%>">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Modifica Dati Personali</h3>
            <label for="fname"><i class="fa fa-user"></i> Nome</label>
              <input type="text" id="zip" name="Nome" value="<%=user.getnome()%>">
            <label for="cname"><i class="fa fa-user"></i> Cognome</label>
            <input type="text" id="cname" name="Cognome" value="<%=user.getcognome()%>">
            <label for="ccnum"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="ccnum" name="Email" value="<%=user.getEmail()%>">
            
          </div>
          
        </div>
        
          <label >
    	</label> 
        
        <input type="submit" value="Modifica" class="btn"><br><br><br><br><br>
      
   
</form>
  


<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>