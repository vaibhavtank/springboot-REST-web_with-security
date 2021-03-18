<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Dashboard</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <style type="text/css">
        tr:first-child {
            font-weignt: bold;
            background-color: #c6c9c4
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Home</h2>
    <jsp:include page="includes/menu.jsp" flush="true" />
    <c:if test="${not empty success}">
        <div class="alert alert-success" role="alert">${success}</div>
    </c:if>

    <hr />
    <hr />
    <div class="form-group">
    </div>
    <div class="form-group">
        <table margin="2px" class="table">
            <tr>
                <td>User Id</td>
                <td>User Name</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Contact No</td>
                <td>Country Code</td>
                <td>Status</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            <c:forEach items="${userList}" var="users">
                <tr>
                    <th>${users.id} </th>
                    <th>${users.username} </th>
                    <th>${users.firstName} </th>
                    <th>${users.lastName} </th>
                    <th>${users.contactNo} </th>
                    <th>${users.countryCode} </th>
                    <th>${users.status == 0 ? 'Inactive' :'Active'} </th>
                    <th><a href="<c:url value='/editUser/${users.id}' />">Edit</a></th>
                    <th><a href="<c:url value='/deleteUser/${users.id}' />">Delete</a></th>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
