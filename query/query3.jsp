<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>Insert Client</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("birthDate"));
		java.sql.Timestamp birthDate = new java.sql.Timestamp(date_util.getTime());
	%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Client (clientid, firstname, lastname, phonenumber, email, birthdate, sex, officeid) VALUES (?,?,?,?,?,?,?,?)
            <sql:param value="${param.clientid}" />
			<sql:param value="${param.firstname}" /> 
			<sql:param value="${param.lastname}" /> 
			<sql:param value="${param.phonenumber}" />
			<sql:param value="${param.email}" /> 
			<sql:param value="<%=birthDate%>" />
			<sql:param value="${param.sex}" /> 
			<sql:param value="${param.officeid}" /> 
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/client/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>