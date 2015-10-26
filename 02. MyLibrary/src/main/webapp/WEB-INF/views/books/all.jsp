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
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">${author.name}</h1>
		</div>
		<c:choose>
			<c:when test="${emptyList}">
				<h2 class="text-center">No Books For This Author Added Yet</h2>
			</c:when>

			<c:otherwise>
				<div class="row">
					<div class="col-md-3 col-xs-6 text-center">
						<h2>Title</h2>
					</div>
					<div class="col-md-3 col-xs-6 text-center">
						<h2>Status</h2>
					</div>
				</div>
				<c:forEach items="${books}" var="book">
					<div class="row">
						<div class="col-md-3 col-xs-6 text-center">
							<h4>${book.title}</h4>
						</div>
						<div class="col-md-3 col-xs-6 text-center">
							<h4>${book.status}</h4>
						</div>
						<div class="col-md-6">
							<div class="btn-group btn-group-justified">
								<div class="btn-group">
									<form:form
										action="/MyLibrary/authors/${author.id}/books/${book.id}"
										method="GET">
										<button type="submit" class="btn btn-primary">Edit</button>
									</form:form>
								</div>
								<div class="btn-group">
									<form:form
										action="/MyLibrary/authors/${author.id}/books/${book.id}"
										method="DELETE">
										<button type="submit" class="btn btn-default">Delete</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<br />
			</c:otherwise>
		</c:choose>
		<br />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 ">
				<form:form action="/MyLibrary/authors/${author.id}/books/new/"
					method="GET">
					<button type="submit" class="btn btn-primary btn-block">Add
						New Book</button>
				</form:form>
			</div>
		</div>
		<br /> <a href="<c:url value='/authors/' />"> <img
			class="img-responsive"
			src="<c:url value='/resources/images/SoftServe-logo.jpg' />"
			alt="SoftServe Logo" width="100%">
		</a>
	</div>
</body>
</html>