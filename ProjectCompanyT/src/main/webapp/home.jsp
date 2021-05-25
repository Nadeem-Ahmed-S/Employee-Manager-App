<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>Home Page</title>
<script type="text/javascript">
		function Myfunction(){
			document.querySelector('#Hire').innerHTML = 'Hired'
			document.getElementById("Hire").disabled = true;
			return true;
		}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./">Company T</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="home">Home</a></li>
            <li ><a href="myEmployees">My Employees</a></li>
            <li><a href="addEmployee">Add Employee</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>
                    Logout</a></li>
        </ul>
    </div>
    </nav>
	<p id="home" >${moduleName}</p>
    <div align="center" class="table-responsive">
<table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Employee Name</th>
                    <th scope="col">Location</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.eId}</td>
                        <td>${employee.eName}</td>
                        <td>${employee.eLocation}</td>
                        <td>
                        	<c:if test="${employee.manager == null}">
                                <form action="hireEmployee">
                                	<input type="hidden" name="eId" value="${employee.eId}"/>
                                    <input type="submit" class="btn btn-primary" id="Hire"
                                        value="Hire" onclick="Myfunction()">
                                </form>
                            </c:if> 
                            <c:if test="${employee.manager != null}">
                                <button type="button" class="btn btn-primary" value="Hired"
                                    disabled>Hired</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            </div>
</body>
</html>