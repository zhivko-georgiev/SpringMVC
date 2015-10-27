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
			<h1 class="text-center">Welcome To Our Library</h1>
		</div>

		<div class="row">
			<div class="col-md-4 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-body text-center">Number Of Authors</div>
					<div class="panel-footer text-center">${authorsCount}</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body text-center">Number Of Books</div>
					<div class="panel-footer text-center">${booksCount}</div>
				</div>
				<form:form action="/MyLibrary/authors/" method="GET">
					<button type="submit" class="btn btn-primary btn-block">All
						Authors</button>
				</form:form>
			</div>
			<br />
			<div class="col-md-8 col-xs-12">
				<img class="img-responsive"
					src="<c:url value='/resources/images/reader.jpg' />"
					alt="A guy reading a book">
			</div>
		</div>
		<br /> <img class="img-responsive"
			src="<c:url value='/resources/images/SoftServe-logo.jpg' />"
			alt="SoftServe Logo" width="100%">
	</div>
</body>
</html>