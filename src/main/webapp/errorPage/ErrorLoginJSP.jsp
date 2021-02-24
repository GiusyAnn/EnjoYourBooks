<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Error</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleCSS.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BarNavCSS.css">
<link rel="icon" href="${pageContext.request.contextPath}/Img/libro-abierto.png">
<style>
body {background-image:url(${pageContext.request.contextPath}/Img/Sfocato.jpg);background-repeat:repeat; font-family:Verdana, Geneva, Tahoma, sans-serif ; }
</style>
<body>

<!-- Navbar  -->
<%@ include file="../JSP/NavLJSP.jsp" %>
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width=1564px">

<div class="table th  w3-auto w3-display-middle w3-center w3-margin-bottom  w3-hide-small">
<h2>Errore</h2>
<p>Credenziali non valide</p>
<p>Errore durante il tentativo di accesso</p>
<a href="JSP/LoginJSP.jsp"><input type="button" class="submit " value="Accedi" ></a>

</div>

<!-- Footer -->
<%@ include file="/JSP/footerLJSP.jsp" %>

</body>
</html>