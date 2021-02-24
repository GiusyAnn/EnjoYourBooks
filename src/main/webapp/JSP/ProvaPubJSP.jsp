<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.*" %>  
 <%@ page import="model.*" %>
<%@ page import="java.util.*" %>

<%
ArrayList<bookBean> preferiti = (ArrayList<bookBean>) request.getAttribute("pubblicati");
%>
<div id="elenco">
<table >
	
 	<tr class="tabelenco" >
 	<th>   </th>
 	<th>  Titolo </th>
 	<th> Autore </th>
 	<th> Trama </th>	
 	</tr>
<%
	for(bookBean l:preferiti) { 				
 %>

 	<tr class="tabelenco">
 	<form action="../bookServlet" method="post"><td> <button class="det" value="<%=l.getISBN() %>" name="ISBN" ><img src="<%= l.getCopertina() %>" style="width: 65px; height: 90px;"></button> </td>
 	<td style="font-size:14px;"><%=l.getTitolo() %></td>
 	<td style="font-size:14px;"><%= l.getAutore() %></td>
 	<td style="font-size:12px;"><%= l.getTrama() %> </td> </form>	
 	</tr>
 	<%} %>

 </table><br><br><br><br>

	
</div>
