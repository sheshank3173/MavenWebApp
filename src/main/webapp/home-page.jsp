<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="styles/CSS/bootstrap.css">
<script src="styles/JS/jquery-3.2.1.js"></script>
<script src="styles/JS/bootstrap.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">

			<div class="navbar-header">
				<button button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" rel="home" href="#"
					title="HTC Global Services"> <img
					style="max-width: 45px; max-hieght: 20px; margin-top: -10px;"
					src="styles/images/HTC_Logo.png">
				</a>
			</div>

			<div id="navbar"
				class="collapse navbar-collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#" id="home" name="home">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
					<!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li> -->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login" id="login" name="login">Login</a></li>
					<li><a href="register" id="register" name="register">Register</a></li>
				</ul>
				<!-- <form class="navbar-form navbar-right" role="search" method="get" id="searchform" action="">
				<div class="form-group">
					<input name="s" id="s" type="text" class="search-query form-control" autocomplete="off" placeholder="Search...">
				</div>
			</form> -->
			</div>

		</div>
	</div>

	<br />
	<br />
	<br />
	<br />


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