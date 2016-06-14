<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="http://getbootstrap.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/grid/grid.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
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

<meta charset="utf-8">

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
			    <li><a href="nuovoPaziente.jsp">Inserisci Paziente</a></li>
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
	<c:if test="${controllerRisultato.esame == null}">
		<p> errore controller null! </p>
	</c:if>
	
	<p>!!!! ${controllerRisultato.esameid}</p>
	
	<c:if test="${controllerRisultato.nuovoRisultatoSucceded == true}">
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<p>Risultato inserito con successo! <span class="glyphicon glyphicon-ok"></span></p>
				</div>
			</c:if>
	<div class="page-header">
		<h1>Codice Esame: ${controllerRisultato.esame.id}</h1>
	</div>
	<h2>Dettagli</h2>
	<ul class="list-group">
			<li class="list-group-item">Data Esame: ${controllerRisultato.esame.dataEsame}</li>
			<li class="list-group-item">Data Prenotazione: ${controllerRisultato.esame.dataPrenotazione}</li>
			<li class="list-group-item">Tipologia: ${controllerRisultato.esame.tipologiaEsame.nome}</li>
			<li class="list-group-item">Medico: ${controllerRisultato.esame.medico.nome} ${controllerRisultato.esame.medico.cognome}</li>
			<li class="list-group-item">Paziente: ${controllerRisultato.esame.paziente.nome} ${controllerRisultato.esame.paziente.cognome}</li>
	</ul>
	<f:view>
	<h:form>
	
   Indicatore: <h:selectOneMenu value="#{controllerRisultato.idindicatore}">
			<c:forEach var="indicatore" items="#{controllerRisultato.esame.tipologiaEsame.indicatoriRisultato}">
				<f:selectItem itemValue="#{indicatore.id}" itemLabel="#{indicatore.nome}" />
			</c:forEach>
			</h:selectOneMenu>
			<br /> 
	Risultato: <h:inputText value="#{controllerRisultato.valore}" styleClass="form-control"
			required="true" requiredMessage="Va inserito un valore per il risultato" id="valore" />
			<strong><h:message for="valore"/></strong>
			<h:commandButton action="#{controllerRisultato.aggiungiRisultato}" value="Inserisci Risultato">
			
			<br />
			<h:commandButton action="#{controllerRisultato.confermaInserimento}" value="Conferma Inserimento"></h:commandButton>
			</h:commandButton>
	
	</h:form>
	</f:view>
	
	</div>
</body>
</html>