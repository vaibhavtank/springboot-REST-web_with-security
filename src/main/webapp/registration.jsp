<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">

      <title>${edit eq true ? 'Update account' : 'Create account'}</title>

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">

        <form:form method="POST" action="/registration" modelAttribute="userForm" class="form-signin" >
            <h2 class="form-signin-heading">${edit eq true ? 'Update account' : 'Create account'}</h2>
            <input:hidden path="id" value="${user.id}" />
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" value="${user.username}" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>
            <c:if test="${edit ne true}">
            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password"  class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm"  class="form-control"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>
            </c:if>
            <spring:bind path="firstName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="firstName" value="${user.firstName}" class="form-control"
                                placeholder="First Name"></form:input>
                    <form:errors path="firstName"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="lastName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="lastName" value="${user.lastName}" class="form-control"
                                placeholder="Last Name"></form:input>
                    <form:errors path="lastName"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="contactNo">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="contactNo" value="${user.contactNo}" class="form-control"
                                placeholder="Contact No"></form:input>
                    <form:errors path="contactNo"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="countryCode">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="countryCode" value="${user.countryCode}" class="form-control"
                                placeholder="Country Code"></form:input>
                    <form:errors path="countryCode"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="countryCode">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                     <form:radiobutton path="status"  value="1" label = "Active" checked="${user.status == 1 ? 'checked' : '' }" class="form-control" />
                     <form:radiobutton path="status" value="0" label = "Inactive" checked="${user.status == 0 ? 'checked' : '' }" class="form-control" />
                    <form:errors path="status"></form:errors>
                </div>
            </spring:bind>

            <c:if test="${edit eq true}">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
            </c:if>
            <c:if test="${edit ne true}">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            </c:if>

        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
