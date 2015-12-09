<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Lessons</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
		SELECT lessonid, clientid, 
		TO_CHAR(startdate, 'MM/DD/YYYY:HH24:MI:SS') as startd, 
		TO_CHAR(stopdate, 'MM/DD/YYYY:HH24:MI:SS') as stopd, 
		positionid, carid, mileageused, progressnotes
		from cray1.Lesson
</sql:query>
	<h1>Lessons</h1>
	<a href="/lesson/insert.jsp">Insert Lesson</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>LessonId</th>
			<th>Client</th>
			<th>Start Date</th>
			<th>Stop Date</th>
			<th>Position</th>
			<th>Car</th>
			<th>Mileage Used</th>
			<th>Progress Notes</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/lesson/delete.jsp?lessonid=<c:out value="${row.lessonid}" />">
						delete</a></td>
				<td><c:out value="${row.lessonid}" /></td>
				<td><sql:query dataSource="${dbsource}" var="Client">
					SELECT * from cray1.client where clientid = ?
					<sql:param value="${row.clientid}" />
					</sql:query> <c:forEach var="_client" items="${Client.rows}">
						<c:out value="${_client.firstname }" />&nbsp;<c:out
							value="${_client.lastname }" />
					</c:forEach></td>
				<td><c:out value="${row.startd}" /></td>
				<td><c:out value="${row.stopd}" /></td>
				<td><sql:query dataSource="${dbsource}" var="Position">
					select title, firstname, lastname from cray1.position
					inner join cray1.jobtitle on position.jobtitleid = jobtitle.jobtitleid
					inner join cray1.staff on staff.emplid = position.emplid
					where positionid = ?
					<sql:param value="${row.positionid}" />
					</sql:query> <c:forEach var="_pos" items="${Position.rows}">
						<c:out value="${_pos.title }" />,&nbsp;<c:out
							value="${_pos.firstname }" />&nbsp;<c:out
							value="${_pos.lastname }" />
					</c:forEach></td>
				<td><sql:query dataSource="${dbsource}" var="Car">
					SELECT * from cray1.car where carid = ?
					<sql:param value="${row.carid}" />
					</sql:query> <c:forEach var="_car" items="${Car.rows}">
						<c:out value="${_car.description }" />&nbsp;<c:out
							value="${_car.registrationnumber }" />
					</c:forEach></td>
				<td><c:out value="${row.mileageused}" /></td>
				<td><c:out value="${row.progressnotes}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>