<%@ page language="java" contentType="text/html" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body class = "bg-image"style="background-image: url('https://www.intellectsoft.net/blog/wp-content/uploads/Digital-Transformation-in-Banking-Cover.jpg'); height:100vh;">

		<nav class="navbar text-light bg-dark p-3 rounded">
  		<div class="">
    		<a class="navbar-brand text-light" style = "text-decoration: none;" href="home.jsp">
      		<img src="https://thumbs.dreamstime.com/b/bank-icon-vector-sign-symbol-isolated-white-background-bank-logo-concept-bank-icon-vector-isolated-white-background-134167171.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top">
     		 Banking System
    		</a>
  		</div>

  		<div class="">
  			<ul class="me-5">
  				<a href="home.jsp" class="text-light mx-3" style = "text-decoration: none;" >Home</a>
  				<a href="customers.jsp" class="text-light mx-3" style = "text-decoration: none;">Customers</a>
  				<a href="transfer.jsp" class="text-light mx-3" style = "text-decoration: none;">Transfer</a>
  			</ul>
  		</div>
</nav>



	<div>
		<div class="container text-center">
			
			<h1 class="text-light pt-5">Banking Application</h1>
		
			<div class="btn-group-vertical col-4 align-bottom"  style="margin-top: 100px;">
			
			<a href="transactions.jsp" class = "btn btn-warning mt-5 p-2 rounded">Show All Transactions</a>
	

		
		<a href="customers.jsp" class = "btn btn-outline-light  mt-4 p-2 rounded">Show Customers</a>	
	
	</div>
</div>
	</div>


</body>