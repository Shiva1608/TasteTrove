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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<style>
.back{
	background-image:url(./assets/bg.jpg);
	background-size:     cover; 
    background-repeat:   no-repeat;
    background-position: 100% 25%;
	}
	div.col-6{
		padding:0px;
	}
	.card{
		color:black;
		transition: all .2s ease-in-out;
	}
	.cards:hover{
		text-decoration:none;
  		cursor:default;
	}
	.card:hover{
		transform: scale(1.1);
	}
	@keyframes slideInLeft {
        0% {
          transform: translateX(-100%);
        }
        100% {
          transform: translateX(0);
        }
      }
      nav {
        animation: 2s ease-out 0s 1 slideInLeft;
      }
</style>
<body>
<div class="back" style="padding-bottom:14%;">
<%@include file='navbar.jsp' %>
<div class="container">
<div class="input-group mb-3" style="width:60%;text-align:center;margin-top:13%;margin-left:20%">
  <button class="btn bg-dark" type="submit" onclick="getLocation()"  style="border-top-left-radius:12px;border-bottom-left-radius:12px;font-family:Quicksand;font-size:18px;padding:2%;padding-right:4%;padding-left:4%;color:white" ><div><svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 384 512"><style>svg{fill:#fafbff}</style><path  d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg></div></button>
  <input class="form-control search" type="text" placeholder="What are you craving today?" style="border-top-right-radius:12px;border-bottom-right-radius:12px;font-family:Quicksand;padding:2.5%;opacity:80%">
</div>
</div>
<p id="demo"></p>
</div>
<div class="container">
<div class="row" style="margin-top:3%;margin-bottom:5%;">
<div class="col-6">
<a class="cards" href="order.jsp">
<div class="card" style="width:20rem;background: rgb(244,241,236,0.7);margin-left:27%;color:black;">
  <img src="./assets/order.jpg" class="card-img-top" alt="order">
  <div class="card-body">
    <h5 class="card-title">ORDER ONLINE</h5>
    <p class="card-text">Delivering happiness.</p>
  </div>
</div>
</a>
</div>

<div class="col-6">
<a class="cards" href="dining.jsp">
<div class="card" style="width:20rem;background: rgba(244,241,236,0.7);margin-left:12%;color:black;">
  <img src="./assets/dining.jpg" class="card-img-top" alt="dining">
  <div class="card-body">
    <h5 class="card-title">DINING</h5>
    <p class="card-text">Your culinary adventure awaits.</p>
  </div>
</div>
</a>
</div>
</div>
</div>
<%@ include file='cart.jsp' %>
<script>
var x = document.getElementById("demo");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition, showError);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}

function showError(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}
</script>
</body>
</html>