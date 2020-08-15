<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home Page</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="jquery-3.4.1.min.js"></script>
	<script src="https://kit.fontawesome.com/4197d29f11.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="test.css">
</head>

<style>
	p {
	  position: absolute;
	  transform: translate(-50%, -50%);
	  top: 60%;
	  left: 50%;
	}
		
	body {
	  font-family: Arial, Helvetica, sans-serif;
	  background: url("blue_bg.jpg") no-repeat center;
	  background-size : cover;
	  background-attachment: fixed;
	  width: 100%;
	  height: 100%;
	  
	}
</style>
<body>			
	<div class="topnav">
		<a href="index.jsp">Home</a>
		<a href="https://github.com/evangelospap/internet_and_applications" target="_blank">My Github</a>
	</div>
	
	<form method="get" action="search_page.jsp">
		<div class="content">				
		  	<input type="text" class="input" id="searchbar" name="search" placeholder="type two drugs to search for...">
		  	<div class="searchbtn">
		  		<button id="mybtn" class="fas fa-search" onclick="onClickHandler()" ></button>
		  	</div>		  	
		</div>
	</form>
	
	<p><b>Tip:</b> If u want to search for only 1 drug, type it twice: i.e. Cannabis, Cannabis</p>	
	

</body>
</html>