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

<div class ="mt-3 container">
<form method="GET" action="transfer.jsp">

  				<div class="row bg-dark  rounded p-4">

    				<div class="col d-flex justify-content-start ">

    					<div class="row d-flex align-items-center">

    							<label class="col text-light">From</label>

      					  		<select name="from" id="sender" class="form-select col">
    								<option value="Khush">Khush</option>
    								<option value="Mohan">Mohan</option>
    								<option value="Krishna">Krishna</option>
    								<option value="Radhe">Radhe</option>
    								<option value="Jagannath">Jagannath</option>
    								<option value="Shiv">Shiv</option>
    								<option value="Omkar">Omkar</option>
    								<option value="Vaijnath">Vaijnath</option>
    								<option value="Bhimshankar">Bhimshankar</option>
    								<option value="Rameshwar">Rameshwar</option>
  						  		</select>

    				    </div>

    				</div>


  					<div class="col d-flex justify-content-start ">

  						<div class="row align-middle d-flex justify-content-start align-items-center">

  							<label class="col text-light">To:</label>

      					  	<select name="to" id="receiver" class="form-select col">
    							<option value="Khush">Khush</option>
    							<option value="Mohan">Mohan</option>
    							<option value="Krishna">Krishna</option>
    							<option value="Radhe">Radhe</option>
    							<option value="Jagannath">Jagannath</option>
    							<option value="Shiv">Shiv</option>
    							<option value="Omkar">Omkar</option>
    							<option value="Vaijnath">Vaijnath</option>
    							<option value="Bhimshankar">Bhimshankar</option>
    							<option value="Rameshwar">Rameshwar</option>
  						  </select>

  						</div>  
    				</div>

    				<div class="col d-flex justify-content-end d-flex align-items-center">
      					<input type="text" class="form-control" placeholder="Amount" name="amount">
    				
      					<button class="btn btn-success" style="margin-left: 20px; margin-right: 10px;">Transfer</button>
    				</div>
  				</div>
			</form>
		</div>


	</body>

	<%

ResultSet result = null;

try{

try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e) {}



		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","jigar");


		// manipulation of customer table in banking datbase

		String transfer_to = request.getParameter("to");
		String from = request.getParameter("from");
		int amount = Integer.parseInt(request.getParameter("amount"));

		String sql = "update customer set balance = balance + ? where name = ?";
		PreparedStatement ps = cn.prepareStatement(sql);

		ps.setInt(1,amount);
		ps.setString(2,transfer_to);

		int rows_affected = ps.executeUpdate();

		//out.print(transfer_to+""+amount+""+rows_affected);


		String sql_minus = "update customer set balance = balance - ? where name = ?";
		PreparedStatement ps_minus = cn.prepareStatement(sql_minus);

		ps_minus.setInt(1,amount);
		ps_minus.setString(2,from);

		int rows_affected_minus = ps_minus.executeUpdate();

		Date theDate = new Date( );

		//out.println(from+""+amount+""+rows_affected_minus);


		// manipulation of trasaction table in banking datbase

		String insertSQL = "INSERT INTO TRANSACTION VALUES(?,?,?,?)";
		PreparedStatement insert_ps = cn.prepareStatement(insertSQL);
		insert_ps.setString(1,from);
		insert_ps.setString(2,transfer_to);
		insert_ps.setInt(3,amount);
		insert_ps.setString(4,theDate.toString());


		int ri = insert_ps.executeUpdate();

		Statement trans_st = cn.createStatement();
		result = trans_st.executeQuery("SELECT * FROM TRANSACTION");


}catch(Exception e){}

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
	}%>
		</tbody>
	</table>
</div>