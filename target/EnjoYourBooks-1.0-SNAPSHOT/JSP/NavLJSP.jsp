<%@ page import ="model.* " %>
<%@ page import="dao.*" %> 
<%@ page import="java.util.*" %>
<%  userBean user = (userBean) session.getAttribute("user");
ArrayList<bookBean> carr = (ArrayList<bookBean>) session.getAttribute("carrello");
int dim = 0;
if(carr!=null){ dim = carr.size();}
%>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script>
function openSearch() {   document.getElementById("myOverlay").style.display = "block";}
function closeSearch() {   document.getElementById("myOverlay").style.display = "none"; }

function myFunction() {  var x = document.getElementById("myTopnav");
if (x.className === "topnav") { x.className += " responsive"; }
else { x.className = "topnav"; }
}

function preaccesso(){
	$('#error').text("Eseguire Prima l'Accesso");
}

</script>
</head>
<div class="topnav" id="myTopnav">
  <a href="JSP/HomeJSP.jsp" class="active hover-white"><img src="Img/nlogo.png" ></a>

<span class="rht">
  <div id="myOverlay" class="overlay">
  <span class="closebtn" onclick="closeSearch()" title="Close Overlay">x</span>
  <div class="overlay-content">
    <form action="cercaLibriServlet" method="post">
      <input type="text" placeholder="Search.." name="cerca">
      <button type="submit" name="cerca"><img src="Img/lupa.png" class="fa fa-search "></button>
    </form>
  </div>
</div>
<span > <img src="Img/lupa.png" onclick="openSearch()" class="lnt"></span>


<% if (user == null) {%>
<a href="JSP/LoginJSP.jsp" onclick="preaccesso()" class="hover-white"><span><img src="Img/mer.png"></span>
<% if(dim>0){ %><span class="badge"><%=dim %></span><%} %></a>
  <a href="JSP/LoginJSP.jsp">Accedi</a>
   <a href="JSP/LoginJSP.jsp" onclick="preaccesso()" >Pubblica</a>
  <% } else { %>
  <%if(user.getrole().equalsIgnoreCase("Utente")){ %>
  <a href="JSP/CarrelloINJSP.jsp" class="hover-white"><span><img src="Img/mer.png"></span >
  <% if(dim>0){ %><span class="badge"><%=dim %></span><%} %></a><%} %>
  <a href="JSP/UserINJSP.jsp">Area Personale</a>
  <span class="dropdown"><form action ="logoutServlet" method="GET"><button class="dropbtn" style="margin-top:4px;">Logout</button> </form></span>
  <a href="JSP/PubblicaJSP.jsp">Pubblica</a><%} %>
 
  <div class="dropdown">
    <form action ="catalogoServlet" method="GET"><button class="dropbtn">Letture</button></form>
   <form action="catalogoGenereServlet" method="GET"><div class="dropdown-content">
    			 <button class="btndr" value="fan-fiction" name="genere" >Fanfiction</button>
       			 <button class="btndr" value="Fantasy" name="genere">Fantasy</button>
       			 <button class="btndr" value="Horror" name="genere">Horror</button>
       			 <button class="btndr" value="Istruzione" name="genere">Istruzione</button>
       			 <button class="btndr" value="Umorismo" name="genere">Umorismo</button>
   				 <button class="btndr" value="YoungAdult" name="genere">Young Adult</button></form>	
   				 <form action="TopServlet" method="POST"><button class="btndr">Top10</button></form>		 
    </div>	
  </div>   
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</span>
</div>

</html>