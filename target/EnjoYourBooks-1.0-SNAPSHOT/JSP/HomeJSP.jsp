<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>EnjoYourBooks</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/styleCSS.css">
<link rel="stylesheet" href="../css/BarNavCSS.css">
<link rel="icon" href="../Img/libro-abierto.png">
<body>

<!-- Navbar  -->
<%@ include file="NavBarJSP.jsp" %>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style=max-width:1500px; id="home">
  <img class="w3-image" src="../Img/Sfondo.jpg" alt="Architecture" width="1500" height="800">
  <div class="w3-display-middle w3-margin-top w3-center">
    <div class="esterno w3-display-middle w3-margin-top w3-center" ><div  class="interno"><div class="tl"><img src="../Img/Logot.png"></div></div></div>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width=1564px">
 
  <!-- Project Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Chi Siamo</h3>
  </div>

  <div class="w3-row-padding">
    <p>EnjoYourBooks e' un sito che nasce con l'intento di unire la passione della scrittura con quella della lettura. Nel sito si possono trovare libri di tutti i generi, dal famoso Fantasy "Harry Potter" al celebre Horror "IT", sia in formato cartaceo che in versione e-book. La particolarita' nel nostro sito e' quella di non limitarsi solo a questo. Molto spesso persone amanti della scrittura non riescono a pubblicare i loro scritti per la complessita' dei processi di pubblicazione, a questo scopo si e' pensato ad un sito versatile e intuitivo che permettera' a tutti di realizzare il desiderio di far conoscere e addirittura di vendere i propri lavori. Sono molti i siti che permettono agli appassionati della scrittura di rendere visibili a tutti i propri testi, ma ad ora nessuno permette una pubblicazione veloce e senza alcuna spesa. Il sito consente infatti a scrittori amatoriali di pubblicare i loro libri senza dover pagare assolutamente nulla, bisogna pero' tener conto di alcune condizioni che sono fondamentali per permettere al nostro sito di crescere e migliorare sempre di piu'.</p>
<br><em>Condizioni di Pubbicazione:</em>
<ul>
<li>Delle prime 100 copie vendute, il 60% dell'incasso sara' attribuito direttamente al sito, il restante 30% all'autore del libro. </li>
<li>Delle restanti copie vendute, il 20% dell'incasso verra' conferito al sito, il restante all'autore del libro.</li></ul><br>
<p>Un fattore per Noi molto importante e' la tutela dei nostri utenti. A tale proposito ogni testo inedito, prima di essere pubblicato, necessita l'approvazione dall'amministratore.</p>

<br><br>
    </div>
  </div><br><br>
     
<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>
