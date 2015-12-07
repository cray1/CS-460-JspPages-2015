<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Insert Position</title>
</head>
<body>

	<%@ include file="../datasource.jsp"%>

	<sql:query dataSource="${dbsource}" var="jobTitles">
		SELECT * from cray1.JobTitle
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Staff">
		SELECT emplid, firstname, lastname from cray1.Staff
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Offices">
		SELECT officeid, officename, state from cray1.Office
	</sql:query>
	<sql:query dataSource="${dbsource}" var="Cars">
		SELECT * from cray1.Car
	</sql:query>

	<form action="/position/insertdb.jsp" method="post">

		<table>
			<thead>
				<tr>
					<th colspan="2">Insert Position</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>positionid</label></td>
					<td><input type="number" name="positionid" min="1" max="9999" /></td>
				</tr>
				<tr>
					<td><label>Job Title</label></td>
					<td><select name="jobtitleid">
							<c:forEach var="jobtitle" items="${jobTitles.rows}">
								<option value="${jobtitle.jobtitleid}">
									${jobtitle.title}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label>Staff</label></td>
					<td><select name="emplid">
							<c:forEach var="employee" items="${Staff.rows}">
								<option value="${employee.emplid}">
									${employee.firstname}&nbsp;${employee.lastname}</option>
							</c:forEach>
					</select></td>
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
					<td><label>Car</label></td>
					<td><select name="carid">
							<c:forEach var="car" items="${Cars.rows}">
								<option value="${car.carid}">
									${car.description}&nbsp;,&nbsp;${car.registrationnumber}</option>
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