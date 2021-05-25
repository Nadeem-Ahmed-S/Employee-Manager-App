<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>

</head>
<body>
    <nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="./">Company T</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="home">Home</a></li>
            <li><a href="myEmployees">My Employees</a></li>
            <li class="active"><a href="addEmployee">Add Employee</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>
                    Logout</a></li>
        </ul>
    </div>
    </nav>

 

    <center>
        <h2>Employee Information</h2>
            </center>
            <div style="padding-top: 10px" class="panel-body">
                <form:form action="saveEmployee" class="form-horizontal" method="post"
                    role="form" modelAttribute="employee">
                    <div style="margin-bottom: 10px" class="input-group">
                        <label for="Name">Employee Name</label><br>
                        <form:input id="name" type="text" class="form-control"
                            name="eName" path="eName" placeholder="Enter employee name" size="30" />
                    </div>
                    <div style="margin-bottom: 10px" class="input-group">
                        <label for="Location">Employee Location</label><br>
                        <form:input id="location" type="text" class="form-control"
                            name="eLocation" path="eLocation" placeholder="Enter employee Location"
                            size="30" />
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-0 col-sm-9 m-t-15">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="reset" class="btn btn-primary">Cancel</button>
                        </div>
                    </div>
                </form:form>
            </div>
</body>
</html>