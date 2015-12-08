<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Provisional License</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("expiredate"));
		java.sql.Timestamp expiredate = new java.sql.Timestamp(date_util.getTime());
	%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.ProvisionalLicense (licenseid, clientid, expiredate) VALUES (?,?,?)
            <sql:param value="${param.licenseid}" />
			<sql:param value="${param.clientid}" /> 
			<sql:param value="<%=expiredate%>" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/provisionallicense/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>