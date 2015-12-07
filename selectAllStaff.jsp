<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="head.jsp"%>
<title>Select all staff</title>
</head>
<body>

	<h4>
		<a href="index.jsp">Home</a>
	</h4>
	<%@ include file="datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT emplid, firstname, lastname, phonenumber, 
TO_CHAR(birthDate, 'MM/DD/YYYY:HH24:MI:SS') as bday from cray1.Staff
</sql:query>
	<h1>Staff</h1>
	<a href="insertStaff.jsp">Insert Staff</a>


	<table border="1" width="100%">
		<tr>
			<th>delete</th>
			<th>Emplid</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Phone Number</th>
			<th>Birth Date</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">

			<tr>
				<td><a
					href="deleteStaff.jsp?emplId=<c:out value="${row.emplid}" />">
						delete</a></td>
				<td><c:out value="${row.emplid}" /></td>
				<td><c:out value="${row.firstname}" /></td>
				<td><c:out value="${row.lastname}" /></td>
				<td><c:out value="${row.phonenumber}" /></td>
				<td><c:out value="${row.bday}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>