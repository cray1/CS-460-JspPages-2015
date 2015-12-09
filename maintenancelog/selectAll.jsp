<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Maintenance Logs</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

 
	<sql:query dataSource="${dbsource}" var="result">
		SELECT maintenancelogid, carid,   
		TO_CHAR(maintenancedate, 'MM/DD/YYYY:HH24:MI:SS') as mdate, faultsfound, maintenancenotes from cray1.maintenancelog
	</sql:query>
	<h1>Driving Test</h1>
	<a href="/maintenancelog/insert.jsp">Insert Maintenance Log</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>MaintenanceLogId</th>
			<th>Car</th>
			<th>Faults Found</th>
			<th>Maintenance Notes</th>
			<th>Maintenance Date</th> 
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/maintenancelog/delete.jsp?maintenancelogid=<c:out value="${row.maintenancelogid}" />">
						delete</a></td>
				<td><c:out value="${row.maintenancelogid}" /></td>
				<td><sql:query dataSource="${dbsource}" var="Car">
					SELECT * from cray1.car where carid = ?
					<sql:param value="${row.carid}" />
					</sql:query> <c:forEach var="_car" items="${Car.rows}">
						<c:out value="${_car.description }" />&nbsp;<c:out value="${_car.registrationnumber }" />
					</c:forEach>
				</td> 
				<td><c:out value="${row.faultsfound}" /></td>
				<td><c:out value="${row.maintenancenotes}" /></td>
				<td><c:out value="${row.mdate}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>