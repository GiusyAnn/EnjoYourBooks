<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration</title>
  <link type="text/css" rel="stylesheet" href="../css/RegistrazioneCSS.css" >
  <link rel="stylesheet" href="../css/styleCSS.css">
  <link rel="stylesheet" href="../css/BarNavCSS.css">
  <link rel="icon" href="../Img/libro-abierto.png">
  <script src="../JS/RegistrazioneJS.js"></script>
</head>
<body>

<!-- Barra Navigazione -->
<%@ include file="NavBarJSP.jsp" %>



<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1600px">



<form name="registra" id="regForm" action="../registrazioneServlet" method="post">
  <h1>Registrati</h1>
  <!-- One "tab" for each step in the form: -->
<div class="tab">Credenziali Utente:
	 
    <p><input placeholder="Username" oninput="this.className = ''" name="Username" id="user" class="input"></p>
    <p><input placeholder="Password" oninput="this.className = ''" id="myInput" name="Password" type="password" class="input"
    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Deve contenere almeno un numero, una lettera maiuscola e una minuscola e dev'essere composta da Almeno 8 caratteri" required></p>
    <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    <input type="checkbox" value="Show Password" onclick="myFunction()"><p>Show Password</p>
    </label>
    <div id="message">
  <h3>La Password deve contenere:</h3>
  <p id="letter" class="invalid"> Una lettera <b>minuscola</b></p>
  <p id="capital" class="invalid"> Una Lettera <b>Maiuscola</b></p>
  <p id="number" class="invalid"> Un <b>Numero</b></p>
  <p id="length" class="invalid"> Almeno <b>8 Caratteri</b></p>
</div>
	
    <script>
    function myFunction() {
    	  var x = document.getElementById("myInput");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } else {
    	    x.type = "password";
    	  }
    	}
</script>
  </div>
  <div class="tab">Dati Personali:
  <p id="error"></p>
    <p><input placeholder="Nome" oninput="this.className = ''" name="Nome" class="input"></p>
    <p><input placeholder="Cognome" oninput="this.className = ''" name="Cognome" class="input"></p>
    <p><input placeholder="E-mail" oninput="this.className = ''" name="email" class="input" id="email"></p>
  </div>
  
  <div class="tab"> 
  <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/01.png"><img src="../imgProfil/01.png" alt="Avatar" style="width:100px;height:100px;" >
    </label >
    <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/02.png"><img src="../imgProfil/02.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
    <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/03.png"><img src="../imgProfil/03.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
    <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/04.png"><img src="../imgProfil/04.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/05.png"><img src="../imgProfil/05.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/06.png"><img src="../imgProfil/06.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/07.png"><img src="../imgProfil/07.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/08.png"><img src="../imgProfil/08.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/09.png"><img src="../imgProfil/09.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/10.png"><img src="../imgProfil/10.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/11.png"><img src="../imgProfil/11.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/12.png"><img src="../imgProfil/12.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/13.png"><img src="../imgProfil/13.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/14.png"><img src="../imgProfil/14.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/15.png"><img src="../imgProfil/15.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/16.png"><img src="../imgProfil/16.png" alt="Avatar"style="width:100px;height:100px;" >
    </label> 
    <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/21.png"><img src="../imgProfil/21.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/22.png"><img src="../imgProfil/22.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/23.png"><img src="../imgProfil/23.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/25.png"><img src="../imgProfil/25.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/26.png"><img src="../imgProfil/26.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/27.png"><img src="../imgProfil/27.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/28.png"><img src="../imgProfil/28.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>
     <label class=" w3-col l3 m6 w3-margin-bottom nopad">
    	<input type="radio" name="profilo" value="imgProfil/29.png"><img src="../imgProfil/29.png" alt="Avatar"style="width:100px;height:100px;" >
    </label>         
  </div>
  
  <div class="tab">Residenza:
    <p><input placeholder="Citta'" oninput="this.className = ''" name="citta" class="input"></p>
    <p> Provincia : </p>
    <select id="selectStyle" name="provincia" >
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
    <p><input placeholder="Via" oninput="this.className = ''" name="via"></p>
    <p><input type=tel placeholder="CAP" oninput="this.className = ''" name="cap"></p>
  </div>
  
  <div >
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)" class="input button">Previous</button>
   <button type="button" id="nextBtn" onclick="nextPrev(1) " class="input button">Next</button>  
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>

<script>

var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Registrati";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>


<script>
var myInput = document.getElementById("myInput");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

	
</div>


<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>