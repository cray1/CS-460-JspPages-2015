<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Select all Job Titles</title>
</head>
<body>

	<h4>
		<a href="../index.jsp">Home</a>
	</h4>
	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="result">
SELECT * from cray1.JobTitle
</sql:query>
	<h1>Offices</h1>
	<a href="/jobTitle/insertJobTitle.jsp">Insert Job Title</a>


	<table border="1" width="100%">
		<tr>
			<th>Delete</th>
			<th>JobTitleId</th>
			<th>Job Title</th> 
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><a
					href="/jobTitle/deleteJobTitle.jsp?jobtitleid=<c:out value="${row.jobtitleid}" />">
						delete</a></td>
				<td><c:out value="${row.jobtitleid}" /></td>
				<td><c:out value="${row.title}" /></td> 
			</tr>
		</c:forEach>
	</table>




</body>
</html>