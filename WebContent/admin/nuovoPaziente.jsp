<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">


<title>Nuovo Paziente</title>
</head>
<body>
<!-- //////////////////// INIZIO NAV //////////////// -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNav">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="../index.jsp" class="navbar-brand">Clinica Chescio Rescio</a>
		</div>
		<div class="collapse navbar-collapse" id="myNav">
			<ul class="nav navbar-nav">
				<li class="active"><a href="nuovoPaziente.jsp">Inserisci Paziente</a></li>
				<li><a href="nuovaTipologia.jsp">Inserisci Tipologia Esame</a></li>
				<li><a href='<c:url value="nuovoEsame.jsp"></c:url>'>Inserisci Esame</a></li>
			    <li><a href='<c:url value="inserimentoRisultatiEsame.jsp"></c:url>'>Inserisci risultati di un esame</a></li>
			    <li><a href='<c:url value="medici.jsp"></c:url>'>Visualizza tutti gli esami effettuati da un medico</a></li>
			</ul>
		</div>
		<!--</div> -->
	</nav>
<!-- ///////////////// FINE NAV ///////////////////////// -->
	<div class="container">
		
		<f:view>
		<h:form>
			<div class="form-group thumbnail single-form">
			<c:if test="${controllerPaziente.nuovoPazienteSucceded == true}">
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<p>Paziente registrato con successo! <span class="glyphicon glyphicon-ok"></span></p>
				</div>
			</c:if>
			Nome: <h:inputText value="#{controllerPaziente.nome}" styleClass="form-control"
			required="true" requiredMessage="Nome obbligatorio" id="nome"/> 
			<strong><h:message for="nome" /></strong>
			<br/>Cognome: <h:inputText value="#{controllerPaziente.cognome}" styleClass="form-control"
			required="true" requiredMessage="Cognome obbligatorio" id="cognome"/> 
			<strong><h:message for="cognome" /></strong>
			
			<br/>Email: <h:inputText value="#{controllerPaziente.email}" styleClass="form-control"
			required="true" requiredMessage="Email obbligatoria" validatorMessage="formato errato" id="email"> 
			<f:validateRegex pattern=".*@.*"/>
			</h:inputText>
			<strong><h:message for="email" /></strong>
			
			
			<br/>Password: <h:inputSecret value="#{controllerPaziente.password}" styleClass="form-control"
			required="true" requiredMessage="Password obbligatoria" id="password"/> 
			<strong><h:message for="password" /></strong>
			<br /><h:commandLink action="#{controllerPaziente.aggiungiPaziente}"
						value="Registra Paziente" styleClass="submit-button btn btn-primary"/>
		    </div>
		</h:form>
		</f:view>
	</div>

</body>
</html>