<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <head th:fragment="headerfiles">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" th:href="@{/webjars/bootstrap/4.4.1/css/bootstrap.css}"/>
        <link rel="stylesheet" type="text/css" th:href="@{/fragments/css/main.css}"/>
        <script th:src="@{/webjars/jquery/3.4.1/jquery.js}" ></script> 
    </head>
    <body>
        <footer th:fragment="footer" class="my-5 text-muted text-center text-small">
            <p class="mb-1">demo</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="https://www.dariawan.com">Homepage</a></li>
                <li class="list-inline-item"><a href="#">Articles</a></li>
            </ul>
        </footer>
    </body>
</html>
