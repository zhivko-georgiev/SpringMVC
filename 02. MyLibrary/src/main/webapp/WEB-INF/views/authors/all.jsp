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
			<h1 class="text-center">Authors</h1>
		</div>
		<div class="row">
			<div class="col-md-3 col-xs-6 text-center">
				<h2>Name</h2>
			</div>
			<div class="col-md-3 col-xs-6 text-center">
				<h2>Country</h2>
			</div>
		</div>
		<c:forEach items="${authors}" var="author">
			<div class="row">
				<div class="col-md-3 col-xs-6 text-center">
					<h4>${author.name}</h4>
				</div>
				<div class="col-md-3 col-xs-6 text-center">
					<h4>${author.country}</h4>
				</div>
				<div class="col-md-6">
					<div class="btn-group btn-group-justified">
						<div class="btn-group">
							<form:form action="/MyLibrary/authors/${author.id}" method="GET">
								<button type="submit" class="btn btn-primary">Edit</button>
							</form:form>
						</div>
						<div class="btn-group">
							<form:form action="/MyLibrary/authors/${author.id}"
								method="DELETE">
								<button type="submit" class="btn btn-default">Delete</button>
							</form:form>
						</div>
						<div class="btn-group">
							<form:form action="/MyLibrary/authors/${author.id}/books/"
								method="GET">
								<button type="submit" class="btn btn-info">Books</button>
							</form:form>
						</div>
					</div>
				</div>

			</div>
			<br />
		</c:forEach>
		<br />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 ">
				<form:form action="/MyLibrary/authors/new/" method="GET">
					<button type="submit" class="btn btn-primary btn-block">Add
						New Author</button>
				</form:form>
			</div>
		</div>
		<br /> <a href="<c:url value='/' />"><img class="img-responsive"
			src="<c:url value='/resources/images/SoftServe-logo.jpg' />"
			alt="SoftServe Logo" width="100%"></a>
	</div>
</body>
</html>