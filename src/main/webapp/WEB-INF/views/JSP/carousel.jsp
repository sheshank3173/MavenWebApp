<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css"
	href="styles/CSS/bootstrap.css">
<script src="styles/JS/jquery-3.2.1.js"></script>		
<script src="styles/JS/bootstrap.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
<br/>
<br/>
<br/>
<!-- Bootstrap Carousel -->
	<div class="container">
		<h2>HTC Global Services</h2>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="styles/images/Ciber.jpg" alt="Ciber" style="width: 100%;">
				</div>

				<div class="item">
					<img src="styles/images/Troy.jpg" alt="Troy" style="width: 100%;">
				</div>

				<div class="item">
					<img src="styles/images/Guindy.jpg" alt="Guindy"
						style="width: 100%;">
				</div>
			</div>



			<!-- Left and right controls -->


			<!--   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
     <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a> -->
		</div>
	</div>



</body>
</html>