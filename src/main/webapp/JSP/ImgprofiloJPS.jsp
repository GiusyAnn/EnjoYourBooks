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
 <form action="../ModProfilServlet" method="post">

 <div class="row" style="margin-top:55px;">

          <div class="col-50">
            <h3 >Modifica Immagine del Profilo</h3>
           
           
            <div class="row">
              
            </div>
          </div>

          <div class="col-50">
            
          </div>
          
        </div>
        <input  type="text" id="fname" name="username" class="in" value="<%=user.getuser() %>">
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
        <input type="submit" value="Modifica" class="btn"><br><br><br><br><br>
      
   
</form>
  


<!-- Footer -->
<%@ include file="footerJSP.jsp" %>

</body>
</html>