<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Job Title</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.JobTitle (jobtitleid, title) VALUES (?,?)
            <sql:param value="${param.jobtitleid}" />
			<sql:param value="${param.title}" /> 
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/jobTitle/selectAllJobTitles.jsp">
		</c:redirect>
	</c:if>
</body>
</html>