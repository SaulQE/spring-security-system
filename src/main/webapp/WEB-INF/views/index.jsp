<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index</title>
</head>
<body>
	<div align="center">
		<h3>Hello World!</h3>
		<br>
		
		<security:authorize access="isAnonymous()">
			<a href="/saul/login">Login</a>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
            <security:authentication property="principal.username" var="username"/>
            Hola <b>${username}</b>
            
            <security:authorize access="hasRole('USER')">
            	<a href="/saul/user">Ir a USER</a>
            </security:authorize>
            
            <security:authorize access="hasRole('ADMIN')">
            	<a href="/saul/admin">Ir a ADMIN</a>
            </security:authorize>
            
            <security:authorize access="hasRole('DBA')">
            	<a href="/saul/dba">Ir a DBA</a>
            </security:authorize>
            
            <a href="/saul/logout">Logout</a>
        </security:authorize>
		
		
	</div>
</body>
</html>