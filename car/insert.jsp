<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
       	<%@ include file="../head.jsp" %>
	 <title>Insert Car</title>
    </head>
    <body>
        <form action="/car/insertdb.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Insert Car</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>CarId</label></td>
                        <td><input type="number" name="carid" min="1" max="9999"/></td>
                    </tr>
                    <tr>
                        <td><label>Description</label></td>
                        <td><input type="text" name="description"/></td>
                    </tr> 
                    <tr>
                        <td><label>Registration Number</label></td>
                        <td><input type="text" name="registrationnumber"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td> 
                    </tr>
                </tbody>
            </table>
        </form>
         
         
    </body>
</html>