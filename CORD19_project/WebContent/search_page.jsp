<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Search Page</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="test.css"> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body >	
	<div class="topnav">
		<a href="index.jsp">Home</a>
		<a href="https://github.com/evangelospap/internet_and_applications" target="_blank">My Github</a>
	</div>	
	<h2 align="center">Search for <%= request.getParameter("search") %> drugs</h2>
	
	<table class="table">
	  <thead class="thead-light">
	    <tr>
	      <th scope="col">Authors</th>
	      <th scope="col">Title</th>
	      <th scope="col">Abstract</th>
	      <th scope="col">Publish time</th>
	      <th scope="col">Journal</th>
	    </tr>
	  </thead>
	  
	<%
	String search = request.getParameter("search");
	if (search != null) {
		String[] drugs = search.trim().split("[,\\s]+");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internet_app", "root", "") ;
		Statement stmt = con.createStatement();
		String sql = "SELECT * FROM metadata WHERE abstract LIKE \"" + "%"+ drugs[0] + "%\"" + " AND abstract LIKE \"" + "%"+ drugs[1] + "%"+ "\";";	
		ResultSet rs = stmt.executeQuery(sql);
		int resultset_size = 0;
		if (!rs.next()) {
			out.write("Could not find requested drugs");
		}
		else{
			List<String> authors = new ArrayList<String>();
			List<Integer> authors_counter = new ArrayList<Integer>();
			Set<String> authors_set = new HashSet<String>(); 
			do{
				resultset_size++;
				authors = Arrays.asList(rs.getString("authors").split("; "));
				for (int i=0; i<authors.size(); ++i) {
					String x = authors.get(i);
					if(!authors_set.contains(x)){
						authors_set.add(x); 
						authors_counter.add(1);
					}
					else{
						// increment the value V authors_counter(V)
						Integer value = authors_counter.get(i); // get value
						value = value + 1; // increment value
						authors_counter.set(i,value);
					}
				}
				%>		
				<tbody>
			    <tr>
			      <td><%=rs.getString("authors") %></td>
			      <td><a href="<%= rs.getString("url") %>" target="_blank"> <%=rs.getString("title") %> </a></td>
			      <td><%=rs.getString("abstract") %></td>
			      <td><%=rs.getString("publish_time") %></td>
			      <td><%=rs.getString("journal") %></td>
			    </tr>
				<%
			}while(rs.next());
			%>	
			  </tbody>
			</table>
			<%
			List<String> authors_list = new ArrayList<String>(authors_set);
			Map<String, Integer> map = new HashMap<String, Integer>();
			for (int i = 0; i<authors_list.size(); ++i){
				map.put(authors_list.get(i), authors_counter.get(i));
			}
			Collections.sort(authors_counter, Collections.reverseOrder()); 
			ArrayList<String> final_authors =  new ArrayList<String>();				
			for (int i=0; i<5; ++i){
				String author= new String();
				for (Map.Entry<String, Integer> e : map.entrySet()) {
				    String key = e.getKey();
				    Integer value = e.getValue();
				    if (value.equals(authors_counter.get(i))) {
				    	author = key;
				    	break;
				    }
				}
				if(authors_set.contains(author)){
					final_authors.add(author);
					authors_set.remove(author);
					map.remove(author);
				}
			}
			String authors_search = new String();
			authors_search = final_authors.get(0);
			for (int INDEX=1; INDEX<final_authors.size(); ++INDEX){
				authors_search = authors_search+ "+" + final_authors.get(INDEX);
			}
			
			session = request.getSession(true);
			session.setAttribute("authors", authors_search );
			%>
			<h5> TOP 5 Authors found :  <%= authors_search %> <br> Click <a class="link2" href="authors_page.jsp?search=<%=drugs[0]+"+"+drugs[1]%>" target="_blank"><b> Here! </b> </a> to see their papers</h5>	
			<%
			
		}
	}
	%>		
	
	<br/><b> Search for other drugs: </b> <a href="index.jsp">Home</a> <br/>
	
	
</body>
</html>
