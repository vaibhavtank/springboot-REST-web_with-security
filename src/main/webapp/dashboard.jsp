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
				<td>User Name</td>
				<td>First Name</td>
				<td>Last Name</td>
				<td>Contact No</td>
				<td>Country Code</td>
				<td>Status</td>
			</tr>
			<c:forEach items="${userList}" var="users">
			<tr>
				<th>${users.miraExitDate} </th>
			</tr>
				</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<th>Total: ${not_total}</th>
				<th>Errors: ${error_total}</th>
				<td></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>
