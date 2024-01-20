<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import='loginportal.PageLoader' %>
<%@ page import="java.util.ArrayList" %>
<% String res = (String)request.getQueryString(); %>
<% ArrayList<String[]> data = PageLoader.menu(res); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<meta charset="UTF-8">
<title><%= res %></title>
</head>
<body style="background-color:#E7EFF9">
	<%@include file='navbar.jsp' %>
	<br>
	<div class="container justify-content-center">
	<div id="<%= res %>" class="carousel slide carousel-fade" style="width:80%;height:80%;" data-bs-ride="carousel">
	<div class="carousel-indicators">
    <button type="button" data-bs-target="#<%= res %>" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#<%= res %>" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#<%= res %>" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./assets/<%= res %>/1.jpg" class="d-block w-100 img-fluid" alt="<%= res %>">
    </div>
    <div class="carousel-item">
      <img src="./assets/<%= res %>/2.jpg" class="d-block w-100 img-fluid" alt="<%= res %>">
    </div>
    <div class="carousel-item">
      <img src="./assets/<%= res %>/3.jpg" class="d-block w-100 img-fluid" alt="<%= res %>">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#<%=res %>" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#<%= res %>" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<br>
<div class="container">
  <div class="row">
    <div class="col-8">
      <h3><%= res %></h3>
      <h5><%= data.get(0)[3] %></h5>
    </div>
    <div class="col-4">
    <button style="color:white;background-color:green;border-radius:4px;border:4px green;">
    <% if(data.get(0)[2] != null) {%>
      <p style="margin-bottom:10%;"><%= data.get(0)[2] %><svg xmlns="http://www.w3.org/2000/svg" height="0.625em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ffd700}</style><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg></p>
      <% } else { %>
      <p style="margin-bottom:10%;">New </p>
      </button>
      <% } %>
      <p>No ratings yet</p>
    </div>
  </div>
</div>
</div>
<hr>
	<div class="container">
	<div class="row">
	<div class="col-4">
	<h2>MENU</h2>
	</div>
	<div class="col-8">
	<input id="Search" onkeyup="myFunction()" class="form-control search" type="text" placeholder="Search on the menu" style="width:40%;height:50%;border-radius:12px;font-family:Quicksand;padding:2.5%;opacity:80%">
	<% for(int i=0;i<data.size();i++) { %>
	</div>
	</div>
	</div>
	<div class="container">
	<br>
	<div class="card mb-3 item" style="max-width: 744px;border:0px;">
  <div class="row g-0"  >
    <div class="col-sm-4">
      <img src="./assets/<%=data.get(i)[0]%>/<%=data.get(i)[4] %>.jpg" class="img-fluid rounded" alt="<%=data.get(i)[4] %>" style="margin-bottom:2%;">
    </div>
    <div class="col-sm-8">
      <div class="card-body">
        <h5 class="card-title"><%= data.get(i)[4] %></h5>
        <button style="color:white;background-color:#F4A266;border-radius:4px;border:4px #F4A266;margin-bottom:2%;">BESTSELLER</button>
        <p class="card-text"><%= data.get(i)[5] %></p>
		<form action="Servlet?<%= res %>" method="post">
        <input name="item" type="hidden" value="<%= data.get(i)[4] %>" />
        <button type="button" class="btn">&#x20B9;<%= data.get(i)[6] %></button> <button style="margin-left:5%;" type="submit" class="btn btn-info" >ADD TO CART</button>
      	</form>
      </div>
    </div>
  </div>
</div>
<% } %>
</div>
<%@ include file='cart.jsp' %>
<script>
function myFunction() {
	  var input = document.getElementById("Search");
	  var filter = input.value.toLowerCase();
	  var nodes = document.getElementsByClassName('item');

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