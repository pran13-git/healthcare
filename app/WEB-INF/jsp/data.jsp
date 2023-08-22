<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student List</title>
</head>
<body> 
	<h1>Displaying Student List</h1>
	<table border ="1" width="500" align="center">
		<tr bgcolor="00FF7F">
		<th><b>Student Name</b></th>
		</tr>
		<%-- Fetching the attributes of the request object
			which was previously set by the servlet
			"StudentServlet.java"
		--%>
		<c:forEach items="${data}" var="Apptdata">
    		<tr>      
        		<td>${Apptdata.getSname()}</td>
    		</tr>
		</c:forEach>

		</table>
		<hr/>
	</body>
</html>
