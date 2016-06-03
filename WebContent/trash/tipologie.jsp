<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Products</title>
</head>
<body>
<f:view>
<h1>Products</h1>
<h:form>
<table>
	<tr>
		<th>Name</th><th>Price</th>
	</tr>
	<c:forEach var="tipologia" items="#{controllerTipologia.tipologie}">
		<tr><td>
		<h:commandLink action="#{controllerTipologia.findTipologia}" value="#{tipologia.nome}">
			<f:param name="id" value="#{tipologia.id}" />
		</h:commandLink>
		</td><td>${tipologia.costo}</td></tr>
	</c:forEach>
</table>
</h:form>

</f:view>
</body>
</html>