<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
 
<title>Insert written Test</title>
</head>
<body>
	<%@ include file="../datasource.jsp"%>
	<sql:query dataSource="${dbsource}" var="Clients">
		SELECT * from cray1.Client
	</sql:query>
	<form action="/writtentest/insertdb.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2">Insert written Test</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>writtenTestId</label></td>
					<td><input type="number" name="writtentestid" min="1"
						max="9999" /></td>
				</tr>
				<tr>
					<td><label>Client</label></td>
					<td><select name="clientid">
							<c:forEach var="_client" items="${Clients.rows}">
								<option value="${_client.clientid}">
									${_client.firstname}&nbsp;,&nbsp;${_client.lastname}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label>Passed</label></td>
					<td><input type="checkbox" name="passed" /></td>
				</tr>
				<tr>
					<td><label>Test Date</label></td>
					<td><input type="datetime" name="testdate"
						placeholder="MM/dd/yyyy HH:mm:ss AM" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</tbody>
		</table>
	</form>


</body>
</html>