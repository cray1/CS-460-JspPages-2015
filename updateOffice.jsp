<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp"%>
<title>Update Office</title>
</head>
<body>
	<form action="updateOfficedb.jsp" method="post">
		<table border="0" cellspacing="2" cellpadding="5">
			<thead>
				<tr>
					<th colspan="2">Update Office</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>OfficeId</label></td>
					<td><input type="number" name="officeId" min="1" max="9999"
						value="${param.officeId}" /></td>
				</tr>
				<tr>
					<td><label>Office Name</label></td>
					<td><input type="text" name="officeName"
						value="${param.officeName}" /></td>
				</tr>
				<tr>
					<td><label>City</label></td>
					<td><input type="text" name="city" value="${param.city}" /></td>
				</tr>
				<tr>
					<td><label>State</label></td>
					<td><input type="text" name="state" value="${param.state}" /></td>
				</tr>
				<tr>
					<td><label>Address</label></td>
					<td><input type="text" name="address" value="${param.address}" /></td>
				</tr>
				<tr>
					<td><label>ZipCode</label></td>
					<td><input type="text" name="zipCode" value="${param.zipCode}" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save" /></td>
					<td><input type="reset" value="reset" /></td>
				</tr>
			</tbody>
		</table>
	</form>


</body>
</html>