<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

 
<html>
    <head>
        <title>Insert Office</title>
    </head>
    <body>
        
<%@ include file="datasource.jsp" %>
 <% java.util.Date birthDate = new java.util.Date(request.getParameter("birthDate"));%>
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Staff (Emplid, firstName, lastName, phoneNumber, birthDate) VALUES (?,?,?,?,?)
            <sql:param value="${param.emplId}" />
            <sql:param value="${param.firstName}" />
            <sql:param value="${param.lastName}" />
            <sql:param value="${param.phoneNumber}" />
            <sql:param value="<%= birthDate %>" type="DATE" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="SelectAllOffices.jsp" >
            </c:redirect>
        </c:if> 
 
 		
    </body>
</html>