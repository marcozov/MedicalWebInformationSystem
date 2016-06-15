<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Elenco Esami</title>
<!-- Bootstrap core CSS -->
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="http://getbootstrap.com/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="http://getbootstrap.com/examples/grid/grid.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
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
<body>
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
			<li><a href="#">Home</a></li>
			<li><a id="tipologie-nav" href="#tipologie">Tipologie di
					Esami</a></li>
			<li class="active"><a href="esamiPaziente.jsp">I Tuoi Esami</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<c:if test="${controllerPaziente.paziente != null}">
					<h4 class="navbar-text">
						Benvenuto, <em>${controllerPaziente.paziente.nome}</em>
					</h4>
				</c:if></li>
		</ul>
	</div>
	<!--</div> --> </nav>
	<div class=container>
		<h1>
			I Tuoi esami
		</h1>
		<c:if test="${controllerPaziente.paziente != null}">
		
			<c:forEach var="esame" items="${controllerPaziente.paziente.esami }">
				<div class="thumbnail">
				<h3>Data prenotazione:</h3>
				<h4>${esame.dataPrenotazione}</h4>
			
				<h3>Data esame</h3>
				<h4>${esame.dataEsame}</h4>
				
				<h3>Paziente</h3>
				<h4>${esame.paziente.nome} ${esame.paziente.cognome}</h4>
				
				<h3>Tipologia esame</h3>
				<h4>${esame.tipologiaEsame.nome}</h4>
				
				
				<h3>Medico</h3>
				<h4>${esame.medico.nome} ${esame.medico.cognome}</h4>
					
				
				<h3>Risultati</h3>
					<div class="thumbnail">
					<c:forEach var="risultato" items="${esame.risultati}">
						<h4>${risultato.indicatoreRisultato.nome}: <em>${risultato.valore}</em></h4>
					</c:forEach>
					</div>
			</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>