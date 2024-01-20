<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TasteTrove</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<% String error = (String)request.getAttribute("error"); %>
<% String p = (String)request.getAttribute("p"); %>
<% if(error == "okay" && p == "login") {%>
<script type="text/javascript">
    window.onload = function () {
        OpenBootstrapPopup();
    };
    function OpenBootstrapPopup() {
        $("#login").modal('show');
    }
</script>
<% } %>
<% if(error == "okay" && p.equals("signup")) {%>
<script type="text/javascript">
    window.onload = function () {
        OpenBootstrapPopup();
    };
    function OpenBootstrapPopup() {
        $("#signup").modal('show');
    }
</script>
<% } %>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<style>

@media (min-width: 1000px) {
  .search {
    font-size: 130%;
  }
}
	@media (min-width: 1200px) {
  .h1font {
    font-size: 37px;
  }
}
@media (max-width: 1199.98px) {
  .h1font {
    font-size: 33px;
  }
}
@media (max-width: 600px) {
  .h1font {
    font-size: 25px;
  }
}
  @import url('https://fonts.googleapis.com/css2?family=Quicksand&display=swap');
</style>
<body>
<% 
String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
<% String err = (String)request.getAttribute("err"); %>
<% String er = (String)request.getAttribute("er"); %>
	<nav class="navbar navbar-expand-lg" style="background: rgba(255,255,255,0.5 );padding:12px;">
  <div class="container-fluid">
  <div style="color:black;padding-left:1%;padding-right:1%">
    <a href="navigation.jsp" style="text-decoration:none;color:black"><h1 class="h1font">TasteTrove</h1></a>
    </div>
    <%
	Cookie cookie[] = null;
	cookie = request.getCookies();
	%>
	<% if(cookie.length > 1){ %>
	<form action="Servlet?logout&<%= pageName %>" method="post">
	<p>Welcome, <%= cookie[1].getValue() %></p>
    <button class="btn btn-danger" type="submit">Logout</button>
    </form>
    <% }
	else { %>
	    <div class="nav navbar justify-content-end " id="navbarSupportedContent">
	      <ul class="nav nav-pills justify-content-end ml-auto">
	        <li class="nav-item">
	          <a style="margin-right:15px;" class="btn btn-danger" data-bs-toggle="modal" role="button" href="#login">Login</a>
	          <div class="modal fade" id="login" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title" id="exampleModalLabel">LOGIN</h3>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	       <form action="Servlet?login&<%= pageName %>" method="post"> 
	      <div class="modal-body">
		  <label>Email</label>
	      <input style="margin-bottom:10px;" name="email" type="email" placeholder="Enter Email Address" class="form-control" required/>
	      <label>Password</label>
	      <input name="pwd" type="password" placeholder="Enter Password" class="form-control" required/>
	      <% if(err != null) {%>
	      <p style="color:red;margin-bottom:0px;margin-top:5px;"><%= err %></p>
	      <% } %>
	      <p style="margin-top:10px;margin-bottom:5px;">  <a href="Reset.jsp" >Forgot Password?</a></p>
	      </div>
	      <div class="modal-footer">
	        <button class="btn bg-dark" style="color:white;" type="submit">Submit</button>
	      </div>
	      </form>
	      </div>
	    </div>
	  </div>
	        </li>
	        <li >
	          <a class="btn btn-danger " data-bs-toggle="modal" role="button" href="#signup">Sign Up</a>
	          <div class="modal fade" id="signup" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title" id="exampleModalLabel">SIGNUP</h3>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	       <form action="Servlet?signup&<%= pageName %>" method="post"> 
	      <div class="modal-body">
		  <label>Username</label>
	      <input style="margin-bottom:10px;" name="name" type="text" placeholder="Enter Username" class="form-control" required/>
	      <label>Email</label>
	      <input style="margin-bottom:10px;" name="email" type="email" placeholder="Enter Email Address" class="form-control" required/>
	      <label>Password</label>
	      <input style="margin-bottom:10px;" name="pwd" type="password" placeholder="Enter Password" class="form-control" required/>
	      <label>Confirm Password</label>
	      <input name="conf_pwd" type="password" placeholder="Confirm Password" class="form-control" required/>
	      <% if(er != null) {%>
	      <p style="color:red;margin-bottom:0px;margin-top:5px;"><%= er %></p>
	      <% } %>
	      </div>
	      <div class="modal-footer">
	        <button class="btn bg-dark" style="color:white;" type="submit">Submit</button>
	      </div>
	      </form>
	      </div>
	    </div>
	    </div>
	        </li>
	      </ul>
	    </div>  
	<% } %>
  </div>       
</nav>


<% if(er !=null && er.equals("Weak password!")){ %>
<script>
alert("Password Criteria!\n1) 8-25 characters.\n2) Atleast 1 number, uppercase & lowercase alphabet.\n3) No blank spaces.\n4) Atleast one of these symbols !@#$%^&+=");
</script>
<% } %>
</body>
</html>