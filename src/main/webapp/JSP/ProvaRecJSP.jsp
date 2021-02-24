<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>


<!-- ${pageContext.request.contextPath} -->
<!-- Barra Navigazione -->


<!-- Page content -->
<div id = "content-recenzione" class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="projects">
    <h2 class="w3-border-bottom w3-border-light-grey w3-padding-16" style="margin:0 70px 0 70px;" ></h2>
  </div>

<div class="w3-row-padding " >
<%
ArrayList<recensioneBean> ordini = (ArrayList<recensioneBean>) request.getAttribute("recensioni");
if(ordini==null){ %>
<h2>Nessuna Recensione effettuato</h2> <% } else{ %>

			<h2 id="messageError"></h2> <% 
			for(recensioneBean r:ordini) {%>
				<div class="comment">
		 		 <img src="<%=r.getFoto()%>" class="imgProfil"><span><h4 ><%=r.getUsername() %> </h4></span>
		  		<h5> Voto : <b> <%=r.getVoto() %> </b>  </h5>
		  		<textarea  readOnly class="txtar"><%=r.getCommento() %></textarea>
		  		</div><br>
		  <%}} %>

</div>
<!-- Footer -->
