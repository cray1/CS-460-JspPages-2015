<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

 
<html>
    <head>
        <title>Insert Office</title>
    </head>
    <body>
        
<%@ include file="datasource.jsp" %>

 <% 
 
 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss aaa"); 
 java.util.Date date_util = formatter.parse(request.getParameter("birthDate")); 
 java.sql.Timestamp birthDate = new java.sql.Timestamp(date_util.getTime());
 %>
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Staff (Emplid, firstName, lastName, phoneNumber, birthDate) VALUES (?,?,?,?,?)
            <sql:param value="${param.emplId}" />
            <sql:param value="${param.firstName}" />
            <sql:param value="${param.lastName}" />
            <sql:param value="${param.phoneNumber}" />
            <sql:param value="<%= birthDate %>"  />
        </sql:update>
        <c:if test="${result>=1}">
            <c:redirect url="selectAllStaff.jsp" >
            </c:redirect>
        </c:if> 
 
 		
    </body>
</html>