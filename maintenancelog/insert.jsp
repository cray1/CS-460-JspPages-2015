<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head> 
<title>Insert Maintenance Log</title>
</head>
<body>

	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="car">
		SELECT * from cray1.Car
	</sql:query>

	<form action="/maintenancelog/insertdb.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2">Insert Maintenance Log</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>MaintenanceLogId</label></td>
					<td><input type="number" name="maintenancelogid" min="1"
						max="9999" /></td>
				</tr>

				<tr>
					<td><label>Car</label></td>
					<td><select name="carid">
							<c:forEach var="car" items="${car.rows}">
								<option value="${car.carid}">
									${car.description}&nbsp;,&nbsp;${car.registrationnumber}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label>Maintenance Date</label></td>
					<td><input type="datetime" name="maintenancedate"
						placeholder="MM/dd/yyyy HH:mm:ss AM" /></td>
				</tr>
				<tr>
					<td><label>Faults Found</label></td>
					<td><input type="checkbox" name="faultsfound" /></td>
				</tr>
				<tr>
					<td><label>Maintenance Notes</label></td>
					<td><textarea rows="5" cols="50" name="maintenancenotes" /></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</tbody>
		</table>
	</form>


</body>
</html>