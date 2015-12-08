<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Lesson</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("startdate"));
		java.sql.Timestamp startdate = new java.sql.Timestamp(date_util.getTime());
		date_util = formatter.parse(request.getParameter("stopdate"));
		java.sql.Timestamp stopdate = new java.sql.Timestamp(date_util.getTime());
	%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Lesson (lessonid, clientid, startdate, stopdate, positionid, carid, mileageused, progressnotes) VALUES (?,?,?,?,?,?,?,?)
            <sql:param value="${param.lessonid}" />
			<sql:param value="${param.clientid}" /> 
			<sql:param value="<%=startdate%>" />
			<sql:param value="<%=stopdate%>" />
			<sql:param value="${param.positionid}" /> 
			<sql:param value="${param.carid}" />
			<sql:param value="${param.mileageused}" /> 
			<sql:param value="${param.progressnotes}" /> 
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/lesson/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>