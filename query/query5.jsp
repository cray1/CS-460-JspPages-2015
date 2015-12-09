<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Total Number of Clients in Each City</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
		SELECT Count(clientid) AS Num_Clients, 
		       city 
		FROM   cray1.office offi, 
		       cray1.client cl 
		WHERE  offi.officeid = cl.officeid 
		GROUP  BY city
	</sql:query>

	<h1>Total Number of Clients in Each City</h1>

	<table border="1" width="100%">
		<tr>
			<th>City</th>
			<th>Number of Clients</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.city}" /></td>
				<td><c:out value="${row.Num_Clients}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>