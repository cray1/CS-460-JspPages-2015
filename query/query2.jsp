<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Query 2</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
	SELECT * from cray1.Office WHERE city='Glasgow'
	</sql:query>
	<h1>The full address of all offices in Glasgow</h1>

	<table border="1" width="100%">
		<tr>
			<th>Office Name</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Zipcode</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.officename}" /></td>
				<td><c:out value="${row.address}" /></td>
				<td><c:out value="${row.city}" /></td>
				<td><c:out value="${row.state}" /></td>
				<td><c:out value="${row.zipcode}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>