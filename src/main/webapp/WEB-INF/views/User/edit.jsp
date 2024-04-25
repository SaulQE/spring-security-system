<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Libreria JSTL Core -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Librería Spring Form -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EDITAR</title>

    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'>
    <link rel='stylesheet'
          href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.2.13/dist/semantic.min.css"/>
    <link href="<c:url value='/css/multiselect.css'/>" rel="stylesheet"/>
</head>

<body>
<!-- partial:index.partial.html -->
<security:authorize access="isAuthenticated()">
    <nav class="sidebar close">
        <header>
            <div class="image-text">
      <span class="image">
        <img src="<c:url value='/images/user.png'/>" alt="" width="40px">
      </span>

                <div class="text logo-text">
                    <security:authentication property="principal.username" var="username"/>

                    <span class="name">Hola ${username}</span>
                    <span class="profession">Web developer</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>


        <div class="menu-bar">
            <div class="menu">

                <ul class="">
                    <li class="">
                        <a href="#">
                            <i class='bx bxs-dashboard icon'></i>
                            <span class="text nav-text">Dashboard</span>
                        </a>
                    </li>

                    <security:authorize access="hasRole('ADMIN')">
                        <li class="">
                            <a href="/saul/admin/users">
                                <i class='bx bxs-user icon'></i>
                                <span class="text nav-text">Users</span>
                            </a>
                        </li>
                    </security:authorize>

                    <security:authorize access="hasRole('DBA')">
                        <li class="">
                            <a href="/saul/dba/roles">
                                <i class='bx bxs-key icon'></i>
                                <span class="text nav-text">Roles</span>
                            </a>
                        </li>
                    </security:authorize>

                    <security:authorize access="hasRole('USER')">
                        <li class="">
                            <a href="/saul/user">
                                <i class='bx bxl-spring-boot icon'></i>
                                <span class="text nav-text">Proximo</span>
                            </a>
                        </li>
                    </security:authorize>

                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="/saul/logout">
                        <i class='bx bx-log-out icon'></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>
            </div>
        </div>

    </nav>


    <%-- CONTENIDO --%>
    <section class="home">
        <div class="text">
            <div class="shadow-sm p-3 mb-5 bg-body rounded">
                <h3 style="margin-top: 20px" align="center">User - Editar</h3>

                <!-- Formulario Spring -->
                <form:form action="" method="post" modelAttribute="user">
                    <div class="shadow-lg p-4 mb-4 bg-white border border-2"
                         style="width: 720px; margin: 20px auto; border-radius: 10px">

                        <div class="row col-12">
                            <div class="col-6">
                                <label>Username:</label>
                                <form:input type="text" class="form-control" path="username" required="required"/> <br>
                                <label>Password:</label>
                                <form:input type="password" class="form-control" path="password" required="required"/>
                                <br>
                                <label>Nombre:</label>
                                <form:input type="text" class="form-control" path="nombre" required="required"/> <br>
                                <label>Apellidos:</label>
                                <form:input type="text" class="form-control" path="apellidos" required="required"/> <br>
                            </div>
                            <div class="col-6">
                                <label>Genero:</label>
                                <form:select path="genero" class="form-control" required="required">
                                    <form:option value="MASCULINO">MASCULINO</form:option>
                                    <form:option value="FEMENINO">FEMENINO</form:option>
                                </form:select> <br>

                                <label>Email:</label>
                                <form:input type="text" class="form-control" path="email" required="required"/> <br>
                                <label>Celular:</label>
                                <form:input type="text" class="form-control" path="celular" required="required"/> <br>

                                <label>Rol(es):</label>
                                <div class="d-flex justify-content-center align-items-center">
                                    <div class="inline w-100 field">
                                        <form:select
                                                path="itemsRole"
                                                items="${itemsRole}"
                                                multiple="multiple"
                                                required="required"
                                                oninvalid="this.setCustomValidity('Seleccione un ROL')"
                                                oninput="this.setCustomValidity('')"
                                                itemValue="roleId"
                                                itemLabel="tipo"
                                                name="skills"
                                                class="label ui selection fluid dropdown">
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div align="center">
                            <button class="btn btn-primary" type="submit">Guardar</button>
                            <button class="btn btn-secondary" type="button" onclick="location.href='/saul/admin/users'">
                                Cancelar
                            </button>
                        </div>

                    </div>
                </form:form>
            </div>
        </div>
    </section>
</security:authorize>


<!-- partial -->
<script src="<c:url value='/js/sidebar.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.2.13/dist/semantic.min.js"></script>
<script src="<c:url value='/js/main.js'/>"></script>
</body>
</html>