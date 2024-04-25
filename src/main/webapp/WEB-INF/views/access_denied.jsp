<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>access denied</title>
</head>
<body>
	<div align="center">
		<h3>ERROR</h3>
		
		<security:authentication property="principal.username" var="username"/>
			<p>Estimado(a) <b>${username}</b>, usted no tiene permiso para acceder a esta p�gina</p>
			
			<br>

		<security:authorize access="isAuthenticated()">
			<security:authentication property="principal.username" var="username"/>
			<label>Volver a: </label><br><br>

			<security:authorize access="hasRole('USER')">
				<a href="/saul/user">P�GINA USER</a> <br><br>
			</security:authorize>

			<security:authorize access="hasRole('ADMIN')">
				<a href="/saul/admin">P�GINA ADMIN</a> <br><br>
			</security:authorize>

			<security:authorize access="hasRole('DBA')">
				<a href="/saul/dba">P�GINA DBA</a>
			</security:authorize>
		</security:authorize>
		
	</div>
</body>
</html>