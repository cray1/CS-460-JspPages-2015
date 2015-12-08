<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<html>
<head>
<title>Insert Maintenance Log</title>
</head>
<body>

	<%@ include file="../datasource.jsp"%>

	<%
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa");
		java.util.Date date_util = formatter.parse(request.getParameter("maintenancedate"));
		java.sql.Timestamp _maintenancedate = new java.sql.Timestamp(date_util.getTime());
		
		Boolean _faultsfound;
		if(request.getParameter("faultsfound") != null && request.getParameter("faultsfound").toString().equals("on")){
			_faultsfound = true;
		}
		else{
			_faultsfound = false;
		}
	%>

	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.maintenancelog (maintenancelogid, carid, maintenancedate,faultsfound,maintenancenotes) VALUES (?,?,?,?,?)
            <sql:param value="${param.maintenancelogid}" />
		<sql:param value="${param.carid}" />
		<sql:param value="<%=_maintenancedate%>" />
		<sql:param value="<%= _faultsfound %>" />
		<sql:param value="${param.maintenancenotes}" />


	</sql:update>
	<c:if test="${result>=1}">
		<c:redirect url="/maintenancelog/selectAll.jsp">
		</c:redirect>
	</c:if>


</body>
</html>