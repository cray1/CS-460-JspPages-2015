<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Position</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Position (positionid, jobtitleid, emplid, officeid, carid) VALUES (?,?,?,?,?)
            <sql:param value="${param.positionid}" />
		<sql:param value="${param.jobtitleid}" />
		<sql:param value="${param.emplid}" />
		<sql:param value="${param.officeid}" />
		<sql:param value="${param.carid}" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/position/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>
