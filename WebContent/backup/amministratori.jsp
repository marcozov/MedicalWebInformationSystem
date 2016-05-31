<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Amministratori</title>
</head>
<body>
<f:view>
<h1>Amministratori</h1>
<h:form>
<table>
	<tr>
		<th>Id</th><th>Asd</th>
	</tr>
	<c:forEach var="amministratore" items="#{controllerAdmin.amministratori}">
	<tr>
		
		</td><td>${amministratore.id}</td></tr>
	</c:forEach>
</table>
</h:form>

</f:view>
</body>
</html>