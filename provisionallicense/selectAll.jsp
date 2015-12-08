<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Provisional Licenses</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT * from cray1.Provisionallicense
</sql:query>
	<h1>Provisional Licenses</h1>
	<a href="/provisionallicense/insert.jsp">Insert Provisional License</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>LicenseId</th>
			<th>ClientId</th>
			<th>ExpireDate</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/provisionallicense/delete.jsp?licenseid=<c:out value="${row.licenseid}" />">
						delete</a></td>
				<td><c:out value="${row.licenseid}" /></td>
				<td><c:out value="${row.clientid}" /></td>
				<td><c:out value="${row.expiredate}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>