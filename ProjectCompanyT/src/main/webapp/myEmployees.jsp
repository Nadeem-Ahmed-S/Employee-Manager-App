<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Pets</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./">Company T</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="home">Home</a></li>
            <li class="active"><a href="myEmployees">My Employees</a></li>
            <li><a href="addEmployee">Add Employee</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>
                    Logout</a></li>
        </ul>
    </div>
    </nav>
	<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">EmployeeName</th>
				<th scope="col">Location</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${employees}">
				<tr>
					<td>${employee.eId}</td>
					<td>${employee.eName}</td>
					<td>${employee.eLocation}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

</body>
</html>