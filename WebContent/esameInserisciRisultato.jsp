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
	<div class="container">
	
	<div class="page-header">
		<h1>${controllerEsame.esame.id}</h1>
	</div>
	<h2>Dettagli</h2>
	<ul class="list-group">
			<li class="list-group-item">Data Esame: ${controllerEsame.esame.dataEsame}</li>
			<li class="list-group-item">Data Prenotazione: ${controllerEsame.esame.dataPrenotazione}</li>
			<li class="list-group-item">Tipologia: ${controllerEsame.esame.tipologiaEsame.nome}</li>
			<li class="list-group-item">Medico: ${controllerEsame.esame.medico.nome} ${controllerEsame.esame.medico.cognome}</li>
			<li class="list-group-item">Paziente: ${controllerEsame.esame.paziente.nome} ${controllerEsame.esame.paziente.cognome}</li>
	</ul>
	<p>Inserisci i risultati</p>
	</div>
</body>
</html>