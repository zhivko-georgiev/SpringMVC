<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Authors List</title>
</head>
<body>
	<h2>List of Authors</h2>
	<table>
		<tr>
			<td>NAME</td>
			<td>Country</td>
		</tr>
		<c:forEach items="${authors}" var="author">
			<tr>
				<td><a href="<c:url value='/authors/${author.id}/books' />">${author.name}</a></td>
				<td>${author.country}</td>
				<td>
					<form:form action="/MyLibrary/authors/${author.id}" method="GET">
						<input type="submit" value="Edit Author" />
					</form:form>
				</td>
				<td>
					<form:form action="/MyLibrary/authors/${author.id}" method="DELETE">
						<input type="submit" value="Delete Author" />
					</form:form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="<c:url value='/authors/new' />">Add New Author</a>
	<br /> Go back to
	<a href="<c:url value='/' />">Home</a>
</body>
</html>