<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
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
				<td>${author.name}</td>
				<td>${author.country}</td>
				<td><a
					href="<c:url value='/authors/edit-${author.id}-author' />">Edit
						Author</a></td>
				<td><a
					href="<c:url value='/authors/delete-${author.id}-author' />">Delete
						Author</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="<c:url value='/authors/new' />">Add New Author</a>
	<br /> Go back to
	<a href="<c:url value='/' />">Home</a>
</body>
</html>