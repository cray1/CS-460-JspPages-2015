<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Delete Position</title>
</head>
<body>


	<%@ include file="../datasource.jsp"%>

	<sql:update dataSource="${dbsource}">
	  DELETE FROM cray1.position WHERE positionid = ?
	  <sql:param value="${param.positionid}" />
	</sql:update>

	<c:redirect url="/position/selectAll.jsp">
	</c:redirect>
</body>
</html>