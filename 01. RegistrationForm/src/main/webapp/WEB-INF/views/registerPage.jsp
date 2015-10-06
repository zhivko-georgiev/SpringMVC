<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Some Form</title>
	</head>
	<body>
	    <div align="center">
	        <form:form action="register" method="post" commandName="registerForm">
	            <div>
	               <h2>Spring MVC Register Form</h2>
	            </div>
	            <div>
	                <div>User Name:</div>
	                <div><form:input path="username" /></div>
	            </div>
	            <div>
	                <div>Password:</div>
	                <div><form:password path="password" /></div>
	            </div>
	            <div>
	                <div>E-mail:</div>
	                <div><form:input path="email" type="email"/></div>
	            </div>
	            </br>
	            <div>
	            	<input type="submit" value="Register" />
	        	</div>
	        </form:form>
	    </div>
	</body>
</html>