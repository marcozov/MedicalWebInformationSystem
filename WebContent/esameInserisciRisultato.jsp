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
<title>Inserimento dei risultati</title>
</head>
<body>
	<div class="container">
	<c:if test="${controllerRisultato.nuovoRisultatoSucceded == true}">
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<p>Risultato inserito con successo! <span class="glyphicon glyphicon-ok"></span></p>
				</div>
			</c:if>
	<div class="page-header">
		<h1>Codice Esame: ${controllerEsame.esame.id}</h1>
	</div>
	<h2>Dettagli</h2>
	<ul class="list-group">
			<li class="list-group-item">Data Esame: ${controllerEsame.esame.dataEsame}</li>
			<li class="list-group-item">Data Prenotazione: ${controllerEsame.esame.dataPrenotazione}</li>
			<li class="list-group-item">Tipologia: ${controllerEsame.esame.tipologiaEsame.nome}</li>
			<li class="list-group-item">Medico: ${controllerEsame.esame.medico.nome} ${controllerEsame.esame.medico.cognome}</li>
			<li class="list-group-item">Paziente: ${controllerEsame.esame.paziente.nome} ${controllerEsame.esame.paziente.cognome}</li>
	</ul>
	<f:view>
	<h:form>
	
	Indicatore: <h:selectOneMenu value="#{controllerRisultato.idindicatore}">
			<c:forEach var="indicatore" items="#{controllerEsame.listaIndicatori}">
				<f:selectItem itemValue="#{indicatore.id}" itemLabel="#{indicatore.nome}" />
			</c:forEach>
			</h:selectOneMenu>
			<br />
	Risultato: <h:inputText value="#{controllerRisultato.valore}" styleClass="form-control"
			required="true" requiredMessage="Va inserito un valore per il risultato" id="valore" />
			
			<h:commandLink action="#{controllerRisultato.aggiungiRisultato}" value="Inserisci Risultato">
				<f:param name="idesame" value="#{controllerEsame.esame.id}"></f:param>
			</h:commandLink>
	
	</h:form>
	</f:view>
	
	</div>
</body>
</html>