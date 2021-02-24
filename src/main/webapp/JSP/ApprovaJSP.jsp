<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Books</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleCSS.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/BarNavCSS.css">
  <link rel="icon" href="${pageContext.request.contextPath}/Img/libro-abierto.png">

</head>
<body>

<!-- ${pageContext.request.contextPath} -->
<!-- Barra Navigazione -->
<%@ include file="NavLJSP.jsp" %>


<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="projects">
    <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16" style="margin:0 70px 0 70px;" >Libri</h2>
  </div>

<div class="w3-row-padding " >
<%
	ArrayList<bookBean> libro = (ArrayList<bookBean>) request.getAttribute("libri");
	for(bookBean l:libro) { %>
		<form action="bookServlet" method="post"><button value="<%=l.getISBN() %>" name="ISBN" class="flip-card w3-col l3 m6 w3-margin-bottom" style="width:300px;height:295px; border:none; cursor:pointer"  >
		  <div class="flip-card-inner " style="width:250px;height:350px">
		    <div class="flip-card-front " style="width:250px;height:350px">
		    <h1 class="titut"><%=l.getTitolo() %></h1><h5 class="aut"><%=l.getAutore()%></h5>
		    </div>
		    <div class="flip-card-back">
		      <h2 ><%=l.getTitolo() %></h2> 
		      <h5><%=l.getAutore()%><br><%=l.getGenere() %></h5> 
		      <p><%=l.getTrama() %></p>
		      <h5><%=l.getPrezzo() %> &#8364;</h5> 
		    </div>
		  </div>
		</button></form>
		<% } %>
	
</div>

</div>
<!-- Footer -->
<jsp:include page="footerLJSP.jsp"></jsp:include>

</body>
</html>