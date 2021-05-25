<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<script type="text/javascript">
	function validate() {
		if (document.getElementById("mUserName").value == "") {
			document.getElementById("error").innerHTML = "<center>User Name required</center>";
			return false;
		} else if (document.getElementById("mPassword").value == "") {
			document.getElementById("error").innerHTML = "<center>Password required</center>";
			return false;
		} else if (document.getElementById("confirmPassword").value == "") {
			document.getElementById("error").innerHTML = "<center>Confirm password required</center>";
			return false;
		} else if (document.getElementById("mName").value == "") {
			document.getElementById("error").innerHTML = "<center>Name required</center>";
			return false;
		}  else if (document.getElementById("mLocation").value == "") {
			document.getElementById("error").innerHTML = "<center>Location required</center>";
			return false;
		} else if (document.getElementById("mPassword").value != document
				.getElementById("confirmPassword").value) {
			document.getElementById("error").innerHTML = "<center>Password and Confirm password does not match</center>";
			return false;
		} else {
			return true;
		}
	}
</script>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./">Company T</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>

	</div>
	</nav>
	<div class="container">
		<h4>Register</h4>
		<p id="success" style="color:red;">${registered}</p>
		<p id="error" style="color: red;"><%= request.getParameter("errorMsg")==null?"":request.getParameter("errorMsg")%></p>
		<form:form action="saveRegister" modelAttribute="manager">
			<label for="mUserName">UserName:</label>
			<form:input id="mUserName" path="mUserName" class="form-control" />
			<br>
			<label for="mPassword">Password:</label>
			<form:password id="mPassword" path="mPassword" class="form-control" />
			<br>
			<label for="confirmPassword">Confirm Password:</label>
			<form:password id="confirmPassword" path="confirmPassword"
				class="form-control" />
			<br>
			<label for="mName">Name:</label>
			<form:input id="mName" path="mName" class="form-control" />
			<br>
			<label for="mLocation">Location:</label>
			<form:input id="mLocation" path="mLocation" class="form-control" />
			<br>
			<input type="submit" value="Register" onclick="return validate()"
				class="btn btn-primary" />
		</form:form>
	</div>


</body>
</html>

