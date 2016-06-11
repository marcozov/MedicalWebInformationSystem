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
<title>Tipologia</title>
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
	
	<div class="page-header">
		<h1>${controllerTipologia.tipologia.nome}</h1>
	</div>
	<h2>Dettagli</h2>
	<ul class="list-group">
			<li class="list-group-item">Codice: ${controllerTipologia.tipologia.codice}</li>
			<li class="list-group-item">Prezzo: ${controllerTipologia.tipologia.costo}</li>
			<li class="list-group-item">Descrizione: ${controllerTipologia.tipologia.descrizione}</li>
			<li class="list-group-item">
			Prerequisiti:
			<ul>
				<c:forEach var="pre" items="${controllerTipologia.tipologia.prerequisiti}">
				<li>
					Nome: ${pre.nome}
					Descrizione: ${pre.descrizione}
				</li>
				</c:forEach>
			
			</ul>
			</li>
			
			<c:if test="${controllerTipologia.tipologia.prerequisiti == null}">
				!--è null
			</c:if>
	</ul>
	</div>
	
</body>
</html>