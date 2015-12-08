<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Driving Test</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
		SELECT * from cray1.drivingtest
	</sql:query>
	<sql:query dataSource="${dbsource}" var="result">
		SELECT drivingtestid, clientid, passed,  
		TO_CHAR(testdate, 'MM/DD/YYYY:HH24:MI:SS') as tdate from cray1.drivingtest
	</sql:query>
	<h1>Driving Test</h1>
	<a href="/drivingtest/insert.jsp">Insert Driving Test</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>DrivingTestId</th>
			<th>Client</th>
			<th>Passed</th>
			<th>Test Date</th> 
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/drivingtest/delete.jsp?drivingtestid=<c:out value="${row.drivingtestid}" />">
						delete</a></td>
				<td><c:out value="${row.drivingtestid}" /></td>
				<td><sql:query dataSource="${dbsource}" var="Client">
					SELECT * from cray1.client where clientid = ?
					<sql:param value="${row.clientid}" />
					</sql:query> <c:forEach var="_client" items="${Client.rows}">
						<c:out value="${_client.firstname }" />&nbsp;<c:out value="${_client.lastname }" />
					</c:forEach>
				</td> 
				<td><c:out value="${row.passed}" /></td>
				<td><c:out value="${row.tdate}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>