<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Query 1</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
	SELECT distinct (phonenumber), firstname, lastname from cray1.Staff, cray1.Office, cray1.Position, cray1.JobTitle WHERE jobtitle.title='Manager' AND jobtitle.jobtitleid=2
	</sql:query>
	<h1>The names and telephone numbers of the Managers of each office</h1>

	<table border="1" width="100%">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Phone Number</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.firstname}" /></td>
				<td><c:out value="${row.lastname}" /></td>
				<td><c:out value="${row.phonenumber}" /></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>