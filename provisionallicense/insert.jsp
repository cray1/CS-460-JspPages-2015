<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
       	<%@ include file="../head.jsp" %>
	 <title>Insert Provisional License</title>
    </head>
    <body>
    
    	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="Client">
		SELECT * from cray1.Client
	</sql:query>
    
        <form action="/provisionallicense/insertdb.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Insert Provisional License</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>License Id</label></td>
                        <td><input type="number" name="licenseid" min="1" max="9999"/></td>
                    </tr>
                    <tr>
                        <td><label>Expire Date</label></td>
                        <td><input type="datetime" name="expiredate" placeholder="MM/dd/yyyy HH:mm:ss AM" /></td>
                    </tr>
                    <tr>
					<td><label>ClientId</label></td>
					<td><select name="clientid">
							<c:forEach var="client" items="${Client.rows}">
								<option value="${client.clientid}">
									${client.lastname}&nbsp;,&nbsp;${client.firstname}</option>
							</c:forEach>
					</select></td>
				</tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td> 
                    </tr>
                </tbody>
            </table>
        </form>
         
         
    </body>
</html>