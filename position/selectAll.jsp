<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Positions</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
		SELECT * from cray1.position
	</sql:query>
	<h1>Positions</h1>
	<a href="/position/insert.jsp">Insert Position</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>PositionId</th>
			<th>Job Title</th>
			<th>Staff</th>
			<th>Office</th>
			<th>Car</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/position/delete.jsp?positionid=<c:out value="${row.positionid}" />">
						delete</a></td>
				<td><c:out value="${row.positionid}" /></td>
				<td><sql:query dataSource="${dbsource}" var="jobTitle">
					SELECT title from cray1.jobtitle where jobtitleid = ?
					<sql:param value="${row.jobtitleid}" />
					</sql:query> <c:forEach var="_jobTitle" items="${jobTitle.rows}">
						<c:out value="${_jobTitle.title }" />
					</c:forEach></td>
				<td><sql:query dataSource="${dbsource}" var="Staff">
					SELECT firstname, lastname from cray1.Staff where emplid = ?
					<sql:param value="${row.emplid}" />
					</sql:query> <c:forEach var="_staff" items="${Staff.rows}">
						<c:out value="${_staff.firstname }" />&nbsp;<c:out
							value="${_staff.lastname }" />
					</c:forEach></td>
				<td><sql:query dataSource="${dbsource}" var="Office">
					SELECT officename, state from cray1.Office where officeid = ?
					<sql:param value="${row.officeid}" />
					</sql:query> <c:forEach var="_Office" items="${Office.rows}">
						<c:out value="${_Office.officename }" />&nbsp;,&nbsp;<c:out
							value="${_Office.state }" />
					</c:forEach></td>
				<td><sql:query dataSource="${dbsource}" var="Car">
					SELECT * from cray1.car where carid = ?
					<sql:param value="${row.carid}" />
					</sql:query> <c:forEach var="_Car" items="${Car.rows}">
						<c:out value="${_Car.description }" />&nbsp;,&nbsp;<c:out
							value="${_Car.registrationnumber}" />
					</c:forEach></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>