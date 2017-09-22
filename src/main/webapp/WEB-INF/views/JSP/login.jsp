<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
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
					<h2>Login</h2>
				</div>
				<div class="panel-body">

					<!-- Login Form -->
					<form role="form" id="loginForm" modelAttribute="login"
						action="loginProcess" method="post">

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
											class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
									</span>

								</div>
							</div>
						</div>

						<!-- Login Button -->
						<div class="row">
							<div class="form-group col-xs-4">
								<button class="btn btn-primary" type="submit" id="loginbtn" name="loginbtn">Submit</button>
							</div>
						</div>

					</form>
					<!-- End of Login Form -->

				</div>
			</div>
		</div>
	</div>
	<%-- <form:form id="loginForm" modelAttribute="login" action="loginProcess" method="post">
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="username">Username: </form:label>
                        </td>
                        <td>
                            <form:input path="username" name="username" id="username" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password">Password:</form:label>
                        </td>
                        <td>
                            <form:password path="password" name="password" id="password" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="left">
                            <form:button id="login" name="login">Login</form:button>
                        </td>
                    </tr>
                    <tr></tr>
                    
                </table>
            </form:form> --%>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</body>
</html>