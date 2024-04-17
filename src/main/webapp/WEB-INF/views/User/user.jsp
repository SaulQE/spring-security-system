<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER</title>
</head>
<body>
	<div align="center">
		<h3>HELLO USER</h3>
		
		<security:authentication property="principal.username" var="username"/>
			<p>Estimado(a) <b>${username}</b>, bienvendo a la p�gina USER</p>
			
			<br>
			<a href="/saul/index">Index</a> |
            <a href="/saul/logout">Logout</a>
	</div>

</body>
</html>