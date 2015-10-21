<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="author">
		<form:input type="hidden" path="id" id="id" />
		<table>
			<tr>
				<td><label for="name">Name: </label></td>
				<td><form:input path="name" id="name" /></td>
				<td><form:errors path="name" cssClass="error" /></td>
			</tr>
			<tr>
				<td><label for="country">Country: </label></td>
				<td><form:input path="country" id="country" /></td>
				<td><form:errors path="country" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="3"><c:choose>
						<c:when test="${edit}">
							<form:form action="/MyLibrary/authors/${author.id}" method="PUT">
								<input type="submit" value="Edit Author" />
							</form:form>
						</c:when>
						<c:otherwise>
							<form:form action="/MyLibrary/authors/new" method="GET">
								<input type="submit" value="Add Author" />
							</form:form>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form:form>
	<br />
	<br /> Go back to
	<a href="<c:url value='/' />">Home</a>
</body>
</html>