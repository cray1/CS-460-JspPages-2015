<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

 
<html>
    <head>
        <title>Insert Office</title>
    </head>
    <body>
        
        <sql:setDataSource var="dbsource" driver="oracle.jdbc.OracleDriver"
                           url="jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle"
                           user="cray1"  password="a6574"/>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO cray1.Office (OfficeId, OfficeName, City, State, Address, ZipCode) VALUES (?,?,?,?,?,?)
            <sql:param value="${param.officeId}" />
            <sql:param value="${param.officeName}" />
            <sql:param value="${param.city}" />
            <sql:param value="${param.state}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.zipCode}" /> 
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="insertOffice.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>