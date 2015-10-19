<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>List of Books</h2>
	<table>
		<tr>
			<td>NAME</td>
			<td>Status</td>
			<td>Author/s</td>
		</tr>
		<c:forEach items="${books}" var="book">
			<tr>
				<td>${book.title}</td>
				<td>${book.status}</td>

				<td><a href="<c:url value='/books/edit-${book.id}-book' />">Edit
						Book</a></td>
				<td><a href="<c:url value='/books/delete-${book.id}-book' />">Delete
						Book</a></td>
			</tr>
		</c:forEach>
	</table>
	<select>
		<c:forEach items="${authors}" var="author">
			<option>${author.name}</option>
		</c:forEach>
	</select>
	<br />
	<a href="<c:url value='/books/new' />">Add New Book</a>
	<br /> Go back to
	<a href="<c:url value='/' />">Home</a>
</body>
</html>