<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
       	<%@ include file="../head.jsp" %>
	 <title>Insert Job Title</title>
    </head>
    <body>
        <form action="/jobTitle/insertJobTitledb.jsp" method="post">
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Add Job Title</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>JobTitleId</label></td>
                        <td><input type="number" name="jobtitleid" min="1" max="9999"/></td>
                    </tr>
                    <tr>
                        <td><label>Title</label></td>
                        <td><input type="text" name="title"/></td>
                    </tr> 
                    <tr>
                        <td><input type="submit" value="Save" /></td> 
                    </tr>
                </tbody>
            </table>
        </form>
         
         
    </body>
</html>