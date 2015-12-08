<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Car</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.drivingtest (drivingtestid, clientid, passed, testdate) VALUES (?,?,?,?)
            <sql:param value="${param.drivingtestid}" />
			<sql:param value="${param.clientid}" /> 
			<sql:param value="${param.passed}" /> 
			<sql:param value="${param.testdate}" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/car/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>