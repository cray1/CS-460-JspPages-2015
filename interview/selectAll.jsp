<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Interviews</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT * from cray1.Interview
</sql:query>
	<h1>Interviews</h1>
	<a href="/interview/insert.jsp">Insert Interview</a>
 

	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>PositionId</th>
			<th>ClientId</th>
			<th>Interview Notes</th>
			<th>Interview Date</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/interview/delete.jsp?positionid=<c:out value="${row.positionid}"/>&clientid=<c:out value="${row.clientid}"/>">
						delete</a></td>
				<td><c:out value="${row.positionid}" /></td>
				<td><c:out value="${row.clientid}" /></td>
				<td><c:out value="${row.interviewnotes}" /></td>
				<td><c:out value="${row.interviewdate}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>