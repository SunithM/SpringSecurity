<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring security demo</title>
</head>
<body>
	<b>Welcome to spring security home page----Test.!!!!</b>
	<hr>
	<!-- display user name and role -->
	<p>
		User :
		<security:authentication property="principal.username" />
	</p>
	<br>
	<p>
		Role(s):
		<security:authentication property="principal.authorities" />

	</p>
	<hr>
	<hr>
	<security:authorize access="hasRole('MANAGER')">
		<!-- add link to point to /leaders...for manger role -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership
				meeting</a> (Only for managers)
		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!-- Add link to /system page for admin -->
		<p>
			<a href="${pageContext.request.contextPath }/systems">IT system
				meeting</a> (Only for system admin)
		</p>
	</security:authorize>
	<!-- add log out button -->
	<form:form action="${pageContext.request.contextPath }/logout"
		method="POST">
		<input type="submit" value="logout">
	</form:form>
</body>
</html>