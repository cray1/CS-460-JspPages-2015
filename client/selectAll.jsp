<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Clients</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT * from cray1.Client
</sql:query>
	<h1>Clients</h1>
	<a href="/car/insert.jsp">Insert Client</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>ClientId</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Phone Number</th>
			<th>Email</th>
			<th>Birthdate</th>
			<th>Sex</th>
			<th>OfficeId</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/client/delete.jsp?clientid=<c:out value="${row.clientid}" />">
						delete</a></td>
				<td><c:out value="${row.clientid}" /></td>
				<td><c:out value="${row.firstname}" /></td>
				<td><c:out value="${row.lastname}" /></td>
				<td><c:out value="${row.phonenumber}" /></td>
				<td><c:out value="${row.email}" /></td>
				<td><c:out value="${row.birthdate}" /></td>
				<td><c:out value="${row.sex}" /></td>
				<td><c:out value="${row.officeid}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>