<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
       	<%@ include file="../head.jsp" %>
	 <title>Insert Client</title>
    </head>
    <body>
    
    	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="Offices">
		SELECT officeid, officename, state from cray1.Office
	</sql:query>
    
        <form action="/client/insertdb.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Insert Client</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>ClientId</label></td>
                        <td><input type="number" name="clientid" min="1" max="9999"/></td>
                    </tr>
                    <tr>
                        <td><label>First Name</label></td>
                        <td><input type="text" name="firstname"/></td>
                    </tr> 
                    <tr>
                        <td><label>Last Name</label></td>
                        <td><input type="text" name="lastname"/></td>
                    </tr>
                    <tr>
                        <td><label>Phone Number</label></td>
                        <td><input type="text" name="phonenumber"/></td>
                    </tr>
                    <tr>
                        <td><label>Email</label></td>
                        <td><input type="text" name="email"/></td>
                    </tr>
                    <tr>
                        <td><label>BirthDate</label></td>
                        <td><input type="datetime" name="birthDate" placeholder="MM/dd/yyyy HH:mm:ss AM" /></td>
                    </tr>
                    <tr>
                        <td><label>Sex</label></td>
                        <td><input type="text" name="sex"/></td>
                    </tr>
                    <tr>
					<td><label>Office</label></td>
					<td><select name="officeid">
							<c:forEach var="office" items="${Offices.rows}">
								<option value="${office.officeid}">
									${office.officename}&nbsp;,&nbsp;${office.state}</option>
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