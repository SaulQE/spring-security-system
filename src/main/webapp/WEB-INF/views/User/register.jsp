<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!-- Librería Spring Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
</head>
<body>
<div align="center">
    <h3>Registrece</h3>

    <form:form action="" method="post" modelAttribute="newUserEntity">
        Username: <form:input type="text" path="username" required="required"/> <br>
        Password: <form:input type="password" path="password" required="required"/> <br>
        Nombre: <form:input type="text" path="nombre" required="required"/> <br>
        Apellidos: <form:input type="text" path="apellidos" required="required"/> <br>

        Género:
        <form:select path="genero" required="required">
            <form:option value="MASCULINO">MASCULINO</form:option>
            <form:option value="FEMENINO">FEMENINO</form:option>
        </form:select> <br>

        Email: <form:input type="text" path="email" required="required"/> <br>
        Celular: <form:input type="text" path="celular" required="required"/> <br>

        <div class="g-recaptcha" data-sitekey="6LfFrr4pAAAAAMPvUgyYpFyxWP6_ogJ74ramPDoO"></div>

        <button type="submit">Guardar</button> |
        <button type="button" onclick="location.href='/saul/login'">Cancelar</button>

    </form:form>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</div>
</body>
</html>