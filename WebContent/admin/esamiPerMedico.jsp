<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Esami per medico</title>
</head>
<body>
	<f:view>
	<h:form>
	<div class="container">
	
	<h1>Lista esami</h1>
	
	<c:if test="${empty controllerEsame.esamiMedicoScelto}">
		Questo medico non ha esami, ora sono triste :(
	</c:if>
	
	<c:forEach var="esame" items="#{controllerEsame.esamiMedicoScelto}">
		<ul class="list-group">
			<li class="list-group-item">
				Tipologia: ${esame.tipologiaEsame.nome}
				<h:commandLink action="#{controllerTipologia.findTipologia}" value="#{esame.tipologiaEsame.codice}">
				<f:param name="id" value="#{esame.tipologiaEsame.id}" />
				</h:commandLink>
				
			</li>
			<li class="list-group-item">
				Data prenotazione: 
				<h:outputText value="#{esame.dataPrenotazione}" >
    				<f:convertDateTime pattern="dd.MM.yyyy HH:mm" />
				</h:outputText>
				
			</li>
			<li class="list-group-item">
				Data esame: 
				<h:outputText value="#{esame.dataEsame}" >
    				<f:convertDateTime pattern="dd.MM.yyyy" />
				</h:outputText>
			</li>
			<li class="list-group-item">
				Paziente: ${esame.paziente.nome} ${esame.paziente.cognome} (${esame.paziente.email})
			</li>
		</ul>
	</c:forEach>
	</div>
	</h:form>
	</f:view>
</body>
</html>