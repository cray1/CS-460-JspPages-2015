<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Interview</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("interviewdate"));
		java.sql.Timestamp interviewdate = new java.sql.Timestamp(date_util.getTime());
	%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Interview (positionid, clientid, interviewnotes, interviewdate) VALUES (?,?,?,?)
            <sql:param value="${param.positionid}" />
			<sql:param value="${param.clientid}" /> 
			<sql:param value="${param.interviewnotes}" /> 
			<sql:param value="<%=interviewdate%>" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/interview/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>