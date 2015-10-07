<%@ page language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Successful Registration</title>
	</head>
	<body>
	    <div align="center">
            <div>
               <h2>Spring MVC Register Form</h2>
            </div>
            <div>
                <h4>User Name:</h4>
                <div>${registerForm.username}</div>
            </div>
            <div>
                <h4>Password:</h4>
                <div>${registerForm.password}</div>
            </div>
            <div>
                <h4>E-mail:</h4>
                <div>${registerForm.email}</div>
            </div>
	    </div>
	</body>
</html>

