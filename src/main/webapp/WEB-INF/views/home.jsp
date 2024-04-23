<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!-- Libreria Security Tag -->
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'>
    <link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap'>
    <link rel="stylesheet" href="css/sidebar.css">

</head>
<body>
<!-- partial:index.partial.html -->
<nav class="sidebar close">
    <header>
        <div class="image-text">
      <span class="image">
        <img src="images/user.png" alt="" width="40px">
      </span>

            <div class="text logo-text">
                <security:authorize access="isAuthenticated()">
                    <security:authentication property="principal.username" var="username"/>

                    <span class="name">Hola ${username}</span>
                    <span class="profession">Web developer</span>
                </security:authorize>
            </div>
        </div>

        <i class='bx bx-chevron-right toggle'></i>
    </header>

    <div class="menu-bar">
        <div class="menu">

            <ul class="menu-links">

                <li class="nav-link">
                    <a href="#">
                        <i class='bx bxs-user icon' ></i>
                        <span class="text nav-text">Users</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="#">
                        <i class='bx bxs-key icon' ></i>
                        <span class="text nav-text">Roles</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="#">
                        <i class='bx bxl-spring-boot icon'></i>
                        <span class="text nav-text">Proximo</span>
                    </a>
                </li>

            </ul>
        </div>

        <div class="bottom-content">
            <li class="">
                <security:authorize access="isAuthenticated()">
                    <a href="/saul/logout">Logout</a>
                    <i class='bx bx-log-out icon'></i>
                    <span class="text nav-text">Logout</span>
                </security:authorize>
            </li>

            <security:authorize access="isAuthenticated()">
                <security:authentication property="principal.username" var="username"/>
                Hola <b>${username}</b>

                <%--<security:authorize access="hasRole('USER')">
                    <a href="/saul/user">Ir a USER</a>
                </security:authorize>

                <security:authorize access="hasRole('ADMIN')">
                    <a href="/saul/admin">Ir a ADMIN</a>
                </security:authorize>

                <security:authorize access="hasRole('DBA')">
                    <a href="/saul/dba">Ir a DBA</a>
                </security:authorize>--%>
            </security:authorize>


        </div>
    </div>

</nav>

<section class="home">
    <div class="text">Dashboard Sidebar</div>
</section>


<!-- partial -->
<script  src="js/sidebar.js"></script>

</body>
</html>

