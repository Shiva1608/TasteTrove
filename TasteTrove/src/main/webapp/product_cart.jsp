<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Map" %>
 <%@ page import='loginportal.User' %>
  <%@ page import='loginportal.PageLoader' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<% Cookie cook[] = null; %>
<% float sum = 0; %>
<% cook = request.getCookies(); %>
<% Map<String, Integer> items = User.items; %>
<body>
	<%@include file='navbar.jsp'%>
	<br>
	<h1 style="text-align:center;">YOUR CART</h1>
	<br>
	<div class="container"> 
		<% if(items != null) {%>
		<div class="row">
			<div class="col-6"><h6>Item</h6></div>
			<div class="col-2"><h6>Price</h6></div>
			<div class="col-2"><h6>Quantity</h6></div>
			<div class="col-2"><h6>Total</h6></div>
		</div>
			<hr>
		<% for (String key : items.keySet()) {%>
		<div class="row">
			<% float price = Float.parseFloat(PageLoader.price(key)); %>
			<% sum+=price*User.items.get(key); %>
			<div class="col-6"><h6><%= key %></h6></div>
			<div class="col-2"><h6><%= PageLoader.price(key)%></h6></div>
			<div class="col-2"><h6><%= User.items.get(key) %></h6></div>
			<div class="col-2"><h6><%= price*User.items.get(key) %></h6></div>
		</div>
		<% } %>
		<br>
		<div class="row">
		<div class="col-6"><h6></h6></div>
			<div class="col-2"><h6></h6></div>
			<div class="col-2"><h6>TOTAL AMOUNT</h6></div>
			<div class="col-2"><h6><%= sum %></h6></div>
		</div>
		<% } else { %>
		<h4>No items in your cart!</h4>
		<% } %>
	</div>
</body>
</html>