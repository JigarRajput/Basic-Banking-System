<%@ page language="java" contentType="text/html" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>

<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link href="style.css" rel="stylesheet" >

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body class = "bg-image " style="background-image: url(https://media.istockphoto.com/vectors/garland-with-light-bulbs-hanging-on-a-wooden-wall-vector-id1143502085?k=20&m=1143502085&s=612x612&w=0&h=LkrvRHceAeTTEWsLnHfYyOjJFCgyaOyfL276v1slCBw=); height:100vh;">

<nav class="navbar text-light bg-dark p-3 rounded">
  		<div class="">
    		<a class="navbar-brand text-light" style = "text-decoration: none;" href="home.jsp">
      		<img src="https://thumbs.dreamstime.com/b/bank-icon-vector-sign-symbol-isolated-white-background-bank-logo-concept-bank-icon-vector-isolated-white-background-134167171.jpg" alt="" width="30" height="24" class="d-inline-block align-text-top">
     		 Banking System
    		</a>
  		</div>

  		<div class="">
  			<ul class="me-5">
  				<a href="home.jsp" class="text-light me-2" style = "text-decoration: none;" >Home</a>
  				<a href="customers.jsp" class="text-light me-2" style = "text-decoration: none;">Customers</a>
  				<a href="transfer.jsp" class="text-light me-2" style = "text-decoration: none;">Transfer</a>
  			</ul>
  		</div>
</nav>

<%

ResultSet result;

try{

try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e) {}

		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","jigar");
		Statement st = cn.createStatement();
		result = st.executeQuery("SELECT * FROM TRANSACTION"); 
%>

<div class="mt-4 text-center container">
	<h1 class="d-block mb-4 text-light">Transaction History</h1>
		<table class="table table-dark table-striped table-hover">
			<thead>
				<tr>
					<th>Transfer from</th>
					<th>Transfer to</th>
					<th>Amount transfer</th>
					<th>Time stamp</th>
				</tr>
			</thead>
			<tbody>	

<%

if(result != null)
{

		while(result.next())
		{
			String transfer_from = result.getString("Transfer_from");
			String transfer_to = result.getString("Transfer_to");
			int amount = result.getInt("Amount");
			String time = result.getString("timestamp");			

%>

			<tr>
				<td>
					<% out.print(transfer_from); %>
				</td>

				<td>
					<% out.print(transfer_to); %>
				</td>

				<td>
					<% out.print(amount); %>
				</td>

				<td>
					<% out.print(time); %>
				</td>
			</tr>
			<%

		}
	}}catch(Exception e){}
%>
		</tbody>
	</table>
</div>
