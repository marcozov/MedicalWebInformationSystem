<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clinica Chescio Rescio</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">

<!-- Per responsiveness 
	width=device-width specifica che la larghezza della pagina deve seguire la larghezza dello schermo del device
	initial-scale=1 setta lo zoom iniziale -->
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="col-sm-6 col-sm-offset-3">
		<div class="page-header">

			<h1>Admin Login</h1>

		</div>

		<f:view>
			<h:form>
			<div class="form-group thumbnail">
				<c:if test="${controllerAdmin.loginSucceded eq false and controllerAdmin.loginTried eq true}">
					<div class="alert alert-warning fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<p>c'è un errore nella password o nell' id</p>
					</div>
				</c:if>
				Id: <h:inputText value="#{controllerAdmin.id}" styleClass="form-control"></h:inputText>
				
				Password: <h:inputSecret value="#{controllerAdmin.password}" styleClass="form-control"></h:inputSecret>
					
				<h:commandButton action="#{controllerAdmin.loginAdmin}"
						value="Login" styleClass="submit-button btn btn-primary"/>
			</div>
			
			</h:form>
		</f:view>
		</div>
	</div>



</body>
</html>