<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Cars</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT * from cray1.Car
</sql:query>
	<h1>Cars</h1>
	<a href="/car/insert.jsp">Insert Car</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>CarId</th>
			<th>Description</th>
			<th>Registration Number</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/car/delete.jsp?carid=<c:out value="${row.carid}" />">
						delete</a></td>
				<td><c:out value="${row.carid}" /></td>
				<td><c:out value="${row.description}" /></td>
				<td><c:out value="${row.registrationnumber}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>