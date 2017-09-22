<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" type="text/css" href="styles/CSS/bootstrap.css">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

	<div class="container" style="margin-top: 5%;">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2>Registration</h2>
				</div>
				<div class="panel-body">

					<!-- Registration Form -->
					<form role="form" id="regForm" modelAttribute="user"
						action="registerProcess" method="post">

						<!-- Username Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="username"><span class="text-danger"
									style="margin-right: 5px;">*</span>Username:</label>
								<div class="input-group">
									<input class="form-control" id="username" type="text"
										name="username" placeholder="Username" required /> <span
										class="input-group-btn"> <label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>

								</div>
							</div>
						</div>
						<!-- Content Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="password"><span class="text-danger"
									style="margin-right: 5px;">*</span>Password:</label>
								<div class="input-group">
									<input class="form-control" id="password" type="password"
										name="password" placeholder="Password" required /> <span
										class="input-group-btn"> <label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>

								</div>
							</div>
						</div>

						<!-- Firstname Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="firstname"><span class="text-danger"
									style="margin-right: 5px;">*</span>Firstname:</label>
								<div class="input-group">
									<input class="form-control" id="firstname" type="text"
										name="firstname" placeholder="firstname" required /> <span
										class="input-group-btn"> <label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>
								</div>
							</div>
						</div>

						<!-- lastname Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="lastname"><span class="text-danger"
									style="margin-right: 5px;">*</span>Lastname:</label>
								<div class="input-group">
									<input class="form-control" id="lastname" type="text"
										name="lastname" placeholder="lastname" required /> <span
										class="input-group-btn"> <label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>
								</div>
							</div>
						</div>

						<!-- email Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="email"><span class="text-danger"
									style="margin-right: 5px;">*</span>Email:</label>
								<div class="input-group">
									<input class="form-control" id="email" type="text" name="email"
										placeholder="email" required /> <span class="input-group-btn">
										<label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>
								</div>
							</div>
						</div>


						<!-- address Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="address"><span class="text-danger"
									style="margin-right: 5px;">*</span>Address:</label>
								<div class="input-group">
									<input class="form-control" id="address" type="text"
										name="address" placeholder="address" required /> <span
										class="input-group-btn"> <label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>
								</div>
							</div>
						</div>


						<!-- phone Field -->
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="phone"><span class="text-danger"
									style="margin-right: 5px;">*</span>Phone:</label>
								<div class="input-group">
									<input class="form-control" id="phone" type="text" name="phone"
										placeholder="phone" required /> <span class="input-group-btn">
										<label class="btn btn-primary"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
									</span>
								</div>
							</div>
						</div>

						<!-- Register Button -->
						<div class="row">
							<div class="form-group col-xs-4">
								<button class="btn btn-primary" type="submit" id="registerbtn" name="registerbtn">Register</button>
							</div>
						</div>

					</form>
					<!-- End of register Form -->

				</div>
			</div>
		</div>
	</div>


	<%-- <form:form id="regForm" modelAttribute="user" action="registerProcess"
		method="post">
		<table align="center">
			<tr>
				<td><form:label path="username">Username</form:label></td>
				<td><form:input path="username" name="username" id="username" />
				</td>
			</tr>
			<tr>
				<td><form:label path="password">Password</form:label></td>
				<td><form:password path="password" name="password"
						id="password" /></td>
			</tr>
			<tr>
				<td><form:label path="firstname">FirstName</form:label></td>
				<td><form:input path="firstname" name="firstname"
						id="firstname" /></td>
			</tr>
			<tr>
				<td><form:label path="lastname">LastName</form:label></td>
				<td><form:input path="lastname" name="lastname" id="lastname" />
				</td>
			</tr>
			<tr>
				<td><form:label path="email">Email</form:label></td>
				<td><form:input path="email" name="email" id="email" /></td>
			</tr>
			<tr>
				<td><form:label path="address">Address</form:label></td>
				<td><form:input path="address" name="address" id="address" />
				</td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone</form:label></td>
				<td><form:input path="phone" name="phone" id="phone" /></td>
			</tr>
			<tr>
				<td></td>
				<td><form:button id="register" name="register">Register</form:button>
				</td>
			</tr>
			<tr></tr>

		</table>
	</form:form> --%>
</body>
</html>