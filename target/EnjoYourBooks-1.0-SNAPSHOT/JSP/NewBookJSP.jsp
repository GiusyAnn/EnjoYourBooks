<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pubblica</title>
  <link type="text/css" rel="stylesheet" href="../css/RegistrazioneCSS.css" >
  <link rel="stylesheet" href="../css/styleCSS.css">
  <link rel="stylesheet" href="../css/BarNavCSS.css">
  <link rel="icon" href="../Img/libro-abierto.png">
</head>
<body>

<!-- Barra Navigazione -->
<%@ include file="NavBarJSP.jsp" %>



<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1600px">



<form id="regForm" action="../pubblicaNewServlet" method="POST">
  <h1>Aggiungi Libro Al Catalogo</h1>
  <!-- One "tab" for each step in the form: -->
  <div class="tab">Informazioni Libro:
    <p><input placeholder="Titolo" oninput="this.className = ''" name="Titolo" class="input"></p>
    <p><input placeholder="ISBN" oninput="this.className = ''" name="isbn" class="input"></p>
     <p><input placeholder="Autore" oninput="this.className = ''" id="myInput" name="Autore" type="text" class="input"></p>
  </div>
   <div class="tab">Informazioni Libro:
    <p><input placeholder="Casa Editrice" oninput="this.className = ''" id="myInput" name="casae" type="text" class="input"></p>
     <p><input placeholder="Link Copertina" oninput="this.className = ''" id="myInput" name="copertina" type="text" class="input"></p>
    </div>
  <div class="tab">Genere:<br>
   	<select name="genere" id="selectStyle"> 
    	<option value="fan-fiction">Fanfiction</option>
		<option value="Fantasy">Fantasy</option>
		<option value="Horror">Horror</option> 
		<option value="Istruzione">Istruzione</option>
		<option value="Umorismo">Umorismo</option>
		<option value="YoungAdult">Young Adult</option>
	</select>
	Tipo:
	<select name="tipo" id="selectStyle"> 
    	<option value="CartaceoDigitale">Cartaceo e Digitale</option>
		<option value="Digitale">Digitale</option>
		<option value="Cartaceo">Cartaceo</option> 
	</select>

	 <p><input placeholder="Quantita'" oninput="this.className = ''" id="myInput" name="quantita" type="number" class="input num"></p>
 	
  </div>
  <div class="tab">Informazioni Libro:
    <p><input placeholder="Trama" oninput="this.className = ''" name="Trama" class="input"></p>
     <p><input placeholder="Prezzo" oninput="this.className = ''" id="myInput" name="prezzo" type="num" class="input"></p>
  </div>
  
  
  <div style="overflow:auto;">
    <div style="float:right;">
    <br><br>
      <button type="button" id="prevBtn" onclick="nextPrev(-1)" class="input button">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)"class="input button">Next</button>
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
    document.getElementById("nextBtn").innerHTML = "Pubblica";
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
			
		
	
</div>


<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>