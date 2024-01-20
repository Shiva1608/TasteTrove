<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import='loginportal.PageLoader' %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
 </head>
<style>
  div.col-2{
  	transition: all .2s ease-in-out;
  }
  div.col-2 a:hover{
  	text-decoration:none;
  	cursor:default;
  }
  div.col-2 span{
  	font-weight:bold;
  	font-size:110%;
  	margin:auto;
  	display:table;
  	color:black;
  }
  div.col-2 img{
  	border-radius:50%;
  	margin-bottom:5%
  }
  div.col-2{
  	padding:0px 2%;
  }
  div.col-2 img:hover{
  	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }
  div.col-2:hover{
  	transform: scale(1.1);
  }
  button.rating:hover{
  	cursor:default;
  }
  div.jumbotron img{
  	object-fit:cover;
  }
  div.jumbotron:hover{
  	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }
  @import url('https://fonts.googleapis.com/css2?family=Caprasimo&family=Oswald:wght@500&display=swap');
</style>
<body style="background-color:#E7EFF9">
<% 	ArrayList<String[]> data = PageLoader.DataLayout();%>

	<%@include file='navbar.jsp' %>
	<div class="container" style="margin-left:2%;margin-top:1%;margin-bottom:3%;width:auto;" aria-label="order&dining">
  <ul class="pagination pagination-lg">
    <li class="page-item active"><a href="order.jsp" class="page-link">&#x1F69A;Delivery</a></li>
    <li class="page-item"><a href="dining.jsp" class="page-link">&#x1F37D;Dining</a></li>
  </ul>
  </div>
  <h2 class="text-muted" style="font-family: 'Oswald', sans-serif;text-align:center;">Top Brands currently</h2>
  <br>
  <div class="container">
  <div class="row">
  <% for(int i=0;i<data.size();i++) {%>
    <div class="col-2">
      <a href="restaurant.jsp?<%= data.get(i)[0] %>">
      <img src="./assets/top/<%= data.get(i)[0] %>.png" class="d-block w-100 top" alt="<%= data.get(i)[0] %>" >
      <span><%= data.get(i)[0] %></span>
      </a>
    </div>
    <% } %>
  </div>
 </div>
 <hr>
 <div style="margin-left:25%;">
<div class="input-group mb-3" style="width:60%;text-align:center;margin-top:4%">
  <button class="btn bg-dark" type="submit" onclick="getLocation()"  style="border-top-left-radius:12px;border-bottom-left-radius:12px;font-family:Quicksand;font-size:18px;padding:2%;padding-right:4%;padding-left:4%;color:white" ><div><svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 384 512"><style>svg{fill:#fafbff}</style><path  d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg></div></button>
  <input id="Search" onkeyup="myFunction()" class="form-control search" type="text" placeholder="What are you craving today?" style="border-top-right-radius:12px;border-bottom-right-radius:12px;font-family:Quicksand;padding:2.5%;opacity:80%">
</div>
</div> 
<div style="margin-left:35%;margin-top:2%;">
  <button class="btn bg-light" style="border-color:#707070;margin-right:1%;">
  <span class="material-symbols-outlined" style="font-size:110%;padding-top:5%;padding-right:5%;float:left;">page_info</span> 
  Filters
  </button>
  <button class="btn bg-light" style="border-color:#707070;margin-right:1%;">
  <span class="material-symbols-outlined" style=";padding-right:5%;float:left;">restaurant_menu</span>
   Cuisines
  </button>
  <button class="btn bg-light dropdown-toggle" style="border-color:#707070" type="button" id="sortby" data-bs-toggle="dropdown" aria-expanded="false">
  <span class="material-symbols-outlined" style="padding-right:5%;float:left;">sort</span>
  Sort by
  </button>
  <ul class="dropdown-menu" aria-labelledby="sortby">
    <li><a class="dropdown-item" href="#">Popularity</a></li>
    <li><a class="dropdown-item" href="#">Rating : High to Low</a></li>
    <li><a class="dropdown-item" href="#">Cost : Cheap to Expensive</a></li>
  </ul>
  </div>
<br>
<br>

<% for(int i=0;i<data.size();i=i+3) {%>
<div class="container text-center">
  <div class="row">
    <div class="col-4 food">
    	<a style="text-decoration:none;color:black;" href="restaurant.jsp?<%= data.get(i)[0] %>">
    	<div class="jumbotron" style="padding:4px 7px;background-color:white;">
    		<img class="img-fluid" src="./assets/<%= data.get(i)[0] %>.jpg" alt="<%= data.get(i)[0] %>.jpg">
    		<div class="container text-center">
    		<div class="row" style="margin-top:5%;">
    		<div class="col-10">
    		<h3 style="text-align:left;margin-bottom:1%;"><%= data.get(i)[0] %></h3>
    		</div>
    		<div class="col-2" style="padding-top:1%;">
    		<button class="rating" style="border:1px green;border-radius:4px;background-color:green;color:white;">
    		<% if(data.get(i)[1] == null) {%> New <% } else { %>
    		<%= data.get(i)[1] %> <% } %>
    		</button>
    		</div>
    		</div>
    		</div>
    		<p style="text-align:left;margin-left:3.5%;"><%= data.get(i)[2] %></p>
    	</div>
    	</a>
    </div>
    <div class="col-4 food" >
    	<a style="text-decoration:none;color:black;" href="restaurant.jsp?<%= data.get(i+1)[0] %>">
    	<div class="jumbotron" style="padding:4px 7px;background-color:white;">
    		<img class="img-fluid" src="./assets/<%= data.get(i+1)[0] %>.jpg" alt="<%= data.get(i+1)[0] %>.jpg">
    		<div class="container text-center">
    		<div class="row" style="margin-top:5%;">
    		<div class="col-10">
    		<h3 style="text-align:left;margin-bottom:1%;"><%= data.get(i+1)[0] %></h3>
    		</div>
    		<div class="col-2" style="padding-top:1%;">
    		<button class="rating" style="border:1px green;border-radius:4px;background-color:green;color:white;">
    		<% if(data.get(i+1)[1] == null) {%> New <% } else { %>
    		<%= data.get(i+1)[1] %> <% } %>
    		</button>
    		</div>
    		</div>
    		</div>
    		<p style="text-align:left;margin-left:3.5%;"><%= data.get(i+1)[2] %></p>
    	</div>
    	</a>
    </div>
    
    <div class="col-4 food">
    	<a style="text-decoration:none;color:black;" href="restaurant.jsp?<%= data.get(i+2)[0] %>">
    	<div class="jumbotron" style="padding:4px 7px;background-color:white;">
    		<img class="img-fluid" src="./assets/<%= data.get(i+2)[0] %>.jpg" alt="<%= data.get(i+2)[0] %>.jpg">
    		<div class="container text-center">
    		<div class="row" style="margin-top:5%;">
    		<div class="col-10">
    		<h3 style="text-align:left;margin-bottom:1%;"><%= data.get(i+2)[0] %></h3>
    		</div>
    		<div class="col-2" style="padding-top:1%;">
    		<button class="rating" style="border:1px green;border-radius:4px;background-color:green;color:white;">
    		<% if(data.get(i+2)[1] == null) {%> New <% } else { %>
    		<%= data.get(i+2)[1] %> <% } %>
    		</button>
    		</div>
    		</div>
    		</div>
    		<p style="text-align:left;margin-left:3.5%;"><%= data.get(i+2)[2] %></p>
    	</div>
    	</a>
    </div>
    
  </div>
</div>
<% } %>
<%@ include file='cart.jsp' %>
<script>
function myFunction() {
	  var input = document.getElementById("Search");
	  var filter = input.value.toLowerCase();
	  var nodes = document.getElementsByClassName('food');

	  for (i = 0; i < nodes.length; i++) {
	    if (nodes[i].innerText.toLowerCase().includes(filter)) {
	      nodes[i].style.display = "block";
	    } else {
	      nodes[i].style.display = "none";
	    }
	  }
	}
</script>
</body>
</html>