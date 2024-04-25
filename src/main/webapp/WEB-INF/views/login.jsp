<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
            <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
                <div class="card-img-left-login d-none d-md-flex">
                    <!-- Background image for card set in CSS! -->
                </div>
                <div class="card-body p-4 p-sm-5">
                    <h2 class="card-title text-center mb-5">LOGIN</h2>

                    <!-- Si hay error en las credenciales -->
                    <c:if test="${param.error != null}">
                        <p style="color:red">Error acceso denegado</p>
                    </c:if>

                    <!-- Si ha cerrado sesión -->
                    <c:if test="${param.logout != null}">
                        <p style="color:green;">Has sido desconectado</p>
                    </c:if>

                    <form action="/saul/login" method="post">

                        <!-- Protección para que se entienda como login -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInputUsername"
                                        placeholder="Username"
                                        required="required"
                                        name="txtUsername"
                                        autocomplete="off"/>
                            <label>Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingInputUsername"
                                        placeholder="Password"
                                        required="required"
                                        name="txtPassword"/>
                            <label>Password</label>
                        </div>

                        <div type="submit" class="d-grid mb-2">
                            <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">
                                Iniciar sesion
                            </button>
                        </div>

                        <a class="d-block text-center mt-2 small" href="/saul/register">Regístrate</a>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>