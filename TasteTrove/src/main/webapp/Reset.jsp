<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<% String error = (String)request.getAttribute("error"); %>
<% String type = (String)request.getAttribute("otp"); %>
<% if(type == null) {%>
<h2 style="text-align:center;margin-top:15%;">FORGOT PASSWORD?</h2>
<div style="width:40%;border:2px solid black;padding-bottom:20px;" class="container">
<form action="Servlet?reset" method="post">
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">Email:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter email" name="Remail">
  </div>
  <% if(error != null && error.equals("Email not registered!")) {%>
  <p style="color:red;"><%= error %></p>
  <% } %>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<% }else if(type.equals("yes")) { %>
<h2 style="text-align:center;margin-top:15%;">OTP sent to your email!</h2>
<div style="width:40%;border:2px solid black;padding-bottom:20px;" class="container">
<form action="Servlet?otp" method="post">
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">OTP:</label>
    <input type="text" class="form-control" id="email" placeholder="Enter OTP" name="otp">
  </div>
  <% if(error != null) {%>
  <p style="color:red;"><%= error %></p>
  <% } %>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<% }else if(type.equals("change")){ %>
<h2 style="text-align:center;margin-top:15%;">Reset your Password!</h2>
<div style="width:40%;border:2px solid black;padding-bottom:20px;" class="container">
<form action="Servlet?change" method="post">
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">New Password:</label>
    <input type="password" class="form-control" id="email" placeholder="Enter new password" name="pass">
    </div>
    <div class="mb-3 mt-3">
    <label for="email" class="form-label">Confirm Password:</label>
    <input type="password" class="form-control" id="email" placeholder="Confirm new password" name="conf_pass">
  </div>
  <% if(error != null) {%>
  <p style="color:red;"><%= error %></p>
  <% } %>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<% } %>
<% if(error!=null && error.equals("Weak password!")) {%>
<script>
alert("Password Criteria!\n1) 8-25 characters.\n2) Atleast 1 number,uppercase & lowercase alphabet.\n3) No blank spaces.\n4) Atleast one of these symbols !@#$%^&+=");
</script>
<% } %>
</body>
</html>