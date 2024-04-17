<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="css/loginStyle.css">
</head>
<body>

<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3"><span>LOGIN</span><span>REGISTRARSE</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <!-- Formulario -->
                                        <form action="/saul/login" method="post">

                                            <!-- Protección para que se entienda como login -->
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                            <h4 class="mb-4">Login</h4>
                                            
                                            <img src="images/user.png" width="90px">
                                            
                                            <!-- Si hay error en las credenciales -->
                                            <c:if test="${param.error != null}">
                                                <p style="color:red">Error acceso denegado</p>
                                            </c:if>

                                            <!-- Si ha cerrado sesión -->
                                            <c:if test="${param.logout != null}">
                                                <p style="color:green;">Has sido desconectado</p>
                                            </c:if>

                                            <div class="form-group">
                                                <input type="text" name="txtUsername" class="form-style"
                                                       placeholder="Username" id="logemail" autocomplete="off"/>
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="password" name="txtPassword" class="form-style"
                                                       placeholder="Password" id="logpass" autocomplete="off"/>
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <button type="submit" class="btn mt-4">Iniciar sesión</button>
                                            <br>
                                            <a class="btn mt-4" href="/saul/index">Index</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Registrarse</h4>
                                        <div class="form-group">
                                            <input type="text" name="txtPassword" class="form-style"
                                                   placeholder="Tú nombre completo" id="logname" autocomplete="off">
                                            <i class="input-icon uil uil-user"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="email" name="logemail" class="form-style"
                                                   placeholder="email" id="logemail" autocomplete="off">
                                            <i class="input-icon uil uil-at"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="password" name="logpass" class="form-style"
                                                   placeholder="password" id="logpass" autocomplete="off">
                                            <i class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                        <a href="#" class="btn mt-4">Registrarse</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
</div>


</body>
</html>