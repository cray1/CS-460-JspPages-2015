<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Query 4</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
	SELECT * from cray1.Lesson l, cray1.Car c WHERE l.carid=c.carid and mileageused>10
	</sql:query>
	<h1>The cars and progress notes taken in lessons longer than 10 miles</h1>

	<table border="1" width="100%">
		<tr>
			<th>Car Description</th>
			<th>Progress Notes</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.description}" /></td>
				<td><c:out value="${row.progressnotes}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>