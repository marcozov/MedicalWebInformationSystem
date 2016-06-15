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


<title>Nuovo Esame</title>
</head>
<body>
	<div class="container">
		
		<f:view>
		<h:form>
			<div class="form-group thumbnail single-form">
			<c:if test="${controllerEsame.nuovoEsameSucceded == true}">
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<p>Esame inserito successo! <span class="glyphicon glyphicon-ok"></span></p>
				</div>
			</c:if>
			Data Esame: <h:inputText value="#{controllerEsame.dataEsame}" styleClass="form-control"
			required="true" requiredMessage="Data esame obbligatoria" id="dataEsame"> 
				<f:convertDateTime pattern="yyyy-MM-dd"/>  
			</h:inputText>
			<strong><h:message for="dataEsame" /></strong>
			<br />
			
			Medico: <h:selectOneMenu value="#{controllerEsame.idmedico}">
			<c:forEach var="medico" items="#{controllerMedico.medici}">
				<f:selectItem itemValue="#{medico.id}" itemLabel="#{medico.nome} #{medico.cognome}" />
			</c:forEach>
			</h:selectOneMenu>
			<br />
			
			Tipologia: <h:selectOneMenu value="#{controllerEsame.idtipologia}">
			<c:forEach var="tipologia" items="#{controllerTipologia.tipologie}">
				<f:selectItem itemValue="#{tipologia.id}" itemLabel="#{tipologia.nome}" />
			</c:forEach>
			</h:selectOneMenu>
			<br />
			
			Paziente: <h:selectOneMenu value="#{controllerEsame.idpaziente}">
			<c:forEach var="paziente" items="#{controllerPaziente.pazienti}">
				<f:selectItem itemValue="#{paziente.id}" itemLabel="#{paziente.nome} #{paziente.cognome}" />
			</c:forEach>
			</h:selectOneMenu>
			
			<br /><h:commandLink action="#{controllerEsame.aggiungiEsame}"
						value="Registra Esame" styleClass="submit-button btn btn-primary"/>
						
		    <div class="btn-group">
				<a href="adminPanel.jsp" class="btn btn-default">Annulla Inserimento</a>
			</div>
		    </div>
		</h:form>
		</f:view>
	</div>

</body>
</html>