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
            INSERT INTO cray1.Car (carid, description, registrationnumber) VALUES (?,?,?)
            <sql:param value="${param.carid}" />
			<sql:param value="${param.description}" /> 
			<sql:param value="${param.registrationnumber}" /> 
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/car/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>