<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<title>SoftServe Library</title>
</head>
<body>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2 class="text-center">Welcome to Our Library</h2>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th><h3>Author Name</h3></th>
						<th><h3>Country</h3></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${authors}" var="author">
						<tr>
							<td><h4>${author.name}</h4></td>
							<td><h4>${author.country}</h4></td>
							<td><form:form action="/MyLibrary/authors/${author.id}"
									method="GET">
									<button type="submit" class="btn btn-default">Edit
										Author</button>
								</form:form></td>
							<td><form:form action="/MyLibrary/authors/${author.id}"
									method="DELETE">
									<button type="submit" class="btn btn-default">Delete
										Author</button>
								</form:form></td>
							<td><form:form
									action="/MyLibrary/authors/${author.id}/books/" method="GET">
									<button type="submit" class="btn btn-default">List
										Books</button>
								</form:form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form:form action="/MyLibrary/authors/new/" method="GET">
			<button type="submit" class="btn btn-primary btn-block">Add
				New Author</button>
		</form:form>
		<br /> <img class="img-responsive"
			src="<c:url value='/resources/images/SoftServe-logo.jpg' />"
			alt="SoftServe Logo" width="100%" height="345">
	</div>
</body>
</html>