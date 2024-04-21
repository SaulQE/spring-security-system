<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!-- Librería Spring Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
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
                <div class="card-img-left d-none d-md-flex">
                    <!-- Background image for card set in CSS! -->
                </div>
                <div class="card-body p-4 p-sm-5">
                    <h2 class="card-title text-center mb-5 fw-light fs-5">REGISTER</h2>

                    <form:form action="" method="post" modelAttribute="newUserEntity">

                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingInputUsername"
                                        placeholder="Username"
                                        required="required" path="username"/>
                            <label>Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <form:input type="password" class="form-control" id="floatingInputUsername"
                                        placeholder="Password"
                                        required="required"
                                        path="password"/>
                            <label>Password</label>
                        </div>

                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingInputUsername"
                                        placeholder="Nombre"
                                        required="required"
                                        path="nombre"/>
                            <label>nombre</label>
                        </div>

                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingInputUsername"
                                        placeholder="Apellidos"
                                        required="required"
                                        path="apellidos"/>
                            <label>Apellidos</label>
                        </div>

                        Genero:
                        <div class="form-floating mb-3">
                            <form:select path="genero" required="required">
                                <form:option value="MASCULINO">MASCULINO</form:option>
                                <form:option value="FEMENINO">FEMENINO</form:option>
                            </form:select>
                        </div>

                        <div class="form-floating mb-3">
                            <form:input type="email" class="form-control" id="floatingInputEmail"
                                        placeholder="email"
                                        required="required"
                                        path="email"/>
                            <label>Email</label>
                        </div>

                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="floatingInputEmail"
                                        placeholder="celular"
                                        required="required"
                                        path="celular"/>
                            <label>Celular</label>
                        </div>

                        <div class="g-recaptcha" data-sitekey="6LfFrr4pAAAAAMPvUgyYpFyxWP6_ogJ74ramPDoO"></div>

                        <hr>

                        <div type="submit" class="d-grid mb-2">
                            <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">
                                Register
                            </button>
                        </div>

                        <a class="d-block text-center mt-2 small" href="/saul/login">ya tienes cuenta? Logeate</a>


                    </form:form>
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