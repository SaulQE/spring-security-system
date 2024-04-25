<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Libreria JSTL Core -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ADMIN</title>
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'>
    <link rel='stylesheet'
          href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap'>
    <!-- CSS externo -->
    <link href="<c:url value='/css/sidebar.css'/>" rel="stylesheet"/>

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

                <ul class="menu-links">


                    <li class="nav-link">
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

    <section class="home">
        <div class="text">
            <security:authentication property="principal.username" var="username"/>
            <p>Estimado(a) <b>${username}</b>, bienvendo a la página ADMIN</p>
            <a href="/saul/admin/registration">New User</a>
        </div>
    </section>
</security:authorize>


<!-- partial -->
<script src="<c:url value='/js/sidebar.js'/>"></script>

</body>
</html>

