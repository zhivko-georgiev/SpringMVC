<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Welcome To Our Library!</h1>
	<P>
		<a href="<c:url value='/authors/' />">List All Authors</a>
	</P>
</body>
</html>
