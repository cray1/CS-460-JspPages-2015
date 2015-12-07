<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<html>
<head>
<title>Update Office</title>
</head>
<body>

	<%@ include file="../datasource.jsp"%>

	<sql:update dataSource="${dbsource}" var="result"> 
        
            UPDATE cray1.Office  
			SET officeName = ?, city = ?, state = ?, address = ?, zipCode = ? 
			WHERE officeId = ?
            
            <sql:param value="${param.officeName}" />
		<sql:param value="${param.city}" />
		<sql:param value="${param.state}" />
		<sql:param value="${param.address}" />
		<sql:param value="${param.zipCode}" />
		<sql:param value="${param.officeId}" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/office/selectAllOffices.jsp">
		</c:redirect>
	</c:if>


</body>
</html>