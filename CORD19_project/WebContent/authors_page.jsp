<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Authors Page</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="jquery-3.4.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="test.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
</head>
<body>
	<div class="topnav">
		<a href="index.jsp">Home</a>
		<a href="https://github.com/evangelospap/internet_and_applications" target="_blank">My Github</a>
	</div>	
	<h2 align="center">Authors with <%= request.getParameter("search") %> drugs</h2>
	
	<%
	String search = request.getParameter("search");
	String[] drugs = search.trim().split("[,\\s]+");
	String authors_search = (String) session.getAttribute("authors"); 
	String[] authors = authors_search.trim().split("[+]");
	ArrayList<String> papers = new ArrayList<String>();
	ArrayList<String> years = new ArrayList<String>();
	%>
	<h6> TOP 5 Actors found : <%= authors_search %></h6>	
	<table class="table">
	  <thead class="thead-light">
	    <tr>
	      <th scope="col">Author</th>
	      <th scope="col">Title</th>
	      <th scope="col">Abstract</th>
	      <th scope="col">Publish time</th>
	      <th scope="col">Journal</th>
	    </tr>
	  </thead>
	<% 
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internet_app", "root", "") ;
	Statement stmt = con.createStatement();
	
	for(String author : authors){
		String subSelect = "(SELECT * FROM metadata WHERE authors LIKE \"" + "%" + author + "%" + "\") AS authorSummary";
		String sql = "SELECT * FROM " + subSelect + " WHERE abstract LIKE \"" + "%"+ drugs[0] + "%\"" + " AND abstract LIKE \"" + "%"+ drugs[1] + "%" +  "\";";	
		
		ResultSet rs = stmt.executeQuery(sql);
		int resultset_size = 0;
		if (!rs.next()) {
			out.write("alert('Could not find requested drugs')");
		}
		else{
			resultset_size++;
			papers.add(rs.getString("title"));
			years.add(rs.getString("publish_time").substring(0, 4));
			%>				
			<tbody>
			    <tr>
			      <td><%= author %></td>
			      <td><a href="<%= rs.getString("url") %>" target="_blank"> <%=rs.getString("title") %> </a></td>
			      <td><%=rs.getString("abstract") %></td>
			      <td><%=rs.getString("publish_time") %></td>
			      <td><%=rs.getString("journal") %></td>
			    </tr>	
			<%
			while(rs.next()){
				resultset_size++;
				papers.add(rs.getString("title"));
				years.add(rs.getString("publish_time").substring(0, 4));
				%>	
				<tr>	
				  <td><%= ">>" %></td>		
			      <td><a href="<%= rs.getString("url") %>" target="_blank"> <%=rs.getString("title") %> </a></td>
			      <td><%=rs.getString("abstract") %></td>
			      <td><%=rs.getString("publish_time") %></td>
			      <td><%=rs.getString("journal") %></td>
			    </tr>	 
				<%
				
			}
		}
	}	
	%>	
		</tbody>
	</table>
	
	<script type="text/javascript">
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var jpapers = [<% for (int i = 0; i < papers.size(); i++) { %>'<%= papers.get(i) %>'<%= i + 1 < papers.size() ? ',':' ' %><% } %>];
			var jyears = [<% for (int i = 0; i < years.size(); i++) { %>'<%= years.get(i) %>'<%= i + 1 < years.size() ? ',':' ' %><% } %>];
			var jArray = new Array(jyears.length+1);
			// Loop to create 2D array using 1D array 
			for (var i = 0; i < jArray.length; i++) { 
			    jArray[i] = new Array(2); 
			} 
			// Loop to initilize 2D array elements. 
			jArray[0][0] = 'Paper';
			jArray[0][1] = 'Year';
			for (var i = 1; i < jArray.length; i++) { 
			        jArray[i][0] = jpapers[i-1]; 
			        jArray[i][1] = jyears[i-1];
			} 
			var data = google.visualization.arrayToDataTable(jArray);
		
		 	var options = {
			      title: 'Multitude of papers, in years',
			      legend: { position: 'none' },
			      colors: ['#e7711c'],
			      histogram: { bucketSize: 10 }	
			};
		
		 	var chart = new google.visualization.Histogram(document.getElementById('chart_div'));
		 	chart.draw(data, options);
		}
    </script>
	
	
	<div id="chart_div" style="width: 900px; height: 500px;"></div>
	
	<br/><b> Search for other drugs: </b> <a href="index.jsp">Home</a> <br/>

</body>
</html>