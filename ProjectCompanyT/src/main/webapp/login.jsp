<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script type="text/javascript">
     function validate() {
          if (document.getElementById("mUserName").value == "") {
              document.getElementById("error").innerHTML = "<center>User Name required</center>";
              return false;
          } else if (document.getElementById("mPassword").value == "") {
              document.getElementById("error").innerHTML = "<center>Password required</center>";
              return false;
          } else {
              return true;
          }
     }
</script>
</head>
<body>
     <nav class="navbar navbar-inverse">
     <div class="container-fluid">
          <div class="navbar-header">
              <a class="navbar-brand" href="./">Company T</a>
          </div>
          <ul class="nav navbar-nav navbar-right">
              <li><a href="register"><span
                        class="glyphicon glyphicon-user"></span> Sign Up</a></li>
          </ul>

     </div>
     </nav>
     <div class="container">
   <h4> Login</h4>

          <p id="success" style="color:red;">${registered}</p>
		  <p id="error" style="color: red;"><%= request.getParameter("errorMsg")==null?"":request.getParameter("errorMsg")%></p>
          <form:form action="authenticateUser"  modelAttribute="manager">
              <label for="Name">Name:</label>
              <form:input name="mUserName" path="mUserName" class="form-control" />
              <br>
              <label for="password">Password:</label>
              <form:password name="mPassword" path="mPassword" class="form-control" />
              <br>
              <input type="submit" value="LogIn" onclick="return validate()"
                   class="btn btn-primary" />
          </form:form>
     </div>


</body>
</html>