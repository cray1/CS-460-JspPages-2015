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
SELECT * from cray1.Lesson
</sql:query>
	<h1>Lessons</h1>
	<a href="/lesson/insert.jsp">Insert Lesson</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>LessonId</th>
			<th>ClientId</th>
			<th>Start Date</th>
			<th>Stop Date</th>
			<th>PositionId</th>
			<th>CarId</th>
			<th>Mileage Used</th>
			<th>Progress Notes</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/lesson/delete.jsp?lessonid=<c:out value="${row.lessonid}" />">
						delete</a></td>
				<td><c:out value="${row.lessonid}" /></td>
				<td><c:out value="${row.clientid}" /></td>
				<td><c:out value="${row.startdate}" /></td>
				<td><c:out value="${row.stopdate}" /></td>
				<td><c:out value="${row.positionid}" /></td>
				<td><c:out value="${row.carid}" /></td>
				<td><c:out value="${row.mileageused}" /></td>
				<td><c:out value="${row.progressnotes}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>