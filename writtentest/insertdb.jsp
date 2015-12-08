<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<title>Insert written Test</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("testdate"));
		java.sql.Timestamp testdate = new java.sql.Timestamp(date_util.getTime());
		
		Boolean _passed;
		if(request.getParameter("passed") != null && request.getParameter("passed").toString().equals("on")){
			_passed = true;
		}
		else{
			_passed = false;
		}
	%>
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.writtentest (writtentestid, clientid, passed, testdate) VALUES (?,?,?, ?)
            <sql:param value="${param.writtentestid}" />
			<sql:param value="${param.clientid}" /> 
			<sql:param value="<%= _passed %>" /> 
			<sql:param value="<%= testdate%>" />
	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/writtentest/selectAll.jsp">
		</c:redirect>
	</c:if>
</body>
</html>