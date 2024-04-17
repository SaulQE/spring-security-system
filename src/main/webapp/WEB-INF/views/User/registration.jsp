<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Librer�a Spring Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<div align="center">
		<h3>Registro - Nuevo Usuario</h3>
		
		<form:form action="" method="post" modelAttribute="userEntity">
			Username: <form:input type="text" path="username" required="required"/> <br>
			Password: <form:input type="password" path="password" required="required"/> <br>
			Nombre: <form:input type="text" path="nombre" required="required"/> <br>
			Apellidos: <form:input type="text" path="apellidos" required="required"/> <br>
			
			G�nero:
			<form:select path="genero" required="required">
				<form:option value="MASCULINO">MASCULINO</form:option>
				<form:option value="FEMENINO">FEMENINO</form:option>
			</form:select> <br>
			
			Email: <form:input type="text" path="email" required="required"/> <br>
			Celular: <form:input type="text" path="celular" required="required"/> <br>
			
			Rol(es):
			<form:select 
				path="itemsRole" 
				items="${itemsRole}" 
				multiple="multiple" 
				required="required"
				oninvalid="this.setCustomValidity('Seleccione un ROL')"
				oninput="this.setCustomValidity('')"
				itemValue="roleId"
				itemLabel="tipo">
			</form:select> <br>
			
			<button type="submit">Guardar</button> |
			<button type="button" onclick="location.href='/saul/admin'">Cancelar</button>
			
		</form:form>
		
	</div>
</body>
</html>