<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
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

<meta charset="utf-8">

<c:if test="${controllerPaziente.loginPazienteSucceded == false}">
	<script type="text/javascript" src="showModal.js"></script>
</c:if>

<script type="text/javascript">
	function createCookieBanner() {
		var startValue = document.cookie.indexOf('=');
		return startValue == -1
				|| document.cookie.substring(startValue + 1) != 'true';
	}
	$(document).ready(function() {
		if (createCookieBanner())
			$("#cookieDiv").slideDown(300);
		$("#cookieOk").click(function() {
			$("#cookieDiv").slideUp(300);
			document.cookie = 'cookieOk=true';
		});

		$("#tipologie-nav").click(function() {
			$("#tipologie-title").animate({
				fontSize : "+=0.2em"
			}, 100);
			$("#tipologie-title").animate({
				fontSize : "-=0.2em"
			}, 100);
		});
	});
</script>

<title>Clinica Chescio Rescio</title>
</head>
<body>
	<div class="container-fluid">
		<div id="cookieDiv">
			Questo sito usa i cookie perchè ce la famo prende a bene,
			continuando la navigazione accetti qualcosa
			<button id="cookieOk" class="btn btn-success">
				Ok <span class="glyphicon glyphicon-ok"></span>
			</button>
		</div>
	</div>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNav">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">Clinica Chescio Rescio</a>
		</div>
		<div class="collapse navbar-collapse" id="myNav">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a id="tipologie-nav" href="#tipologie">Tipologie di
						Esami</a></li>
				<li><a href="#">I Tuoi Esami</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li>
				<c:if test="${controllerPaziente.paziente == null}">
				<a href="#" data-toggle="modal" data-target="#log-in-modal"><span
						class="glyphicon glyphicon-log-in"></span> Login</a>
				</c:if>
				<c:if test="${controllerPaziente.paziente != null}">
					<h4 class="navbar-text">Benvenuto, <em>${controllerPaziente.paziente.nome}</em></h4>
				</c:if>		
				</li>
			</ul>
		</div>
		<!--</div> -->
	</nav>

	<!-- LOG IN MODAL -->

	<div id="log-in-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Log in</h4>
				</div>
				<div class="modal-body">
					<h1 class="glyphicon glyphicon-user center-block"></h1>
					<f:view>
					<h:form>
						<c:if test="${controllerPaziente.loginPazienteSucceded == false}">
							<div class="alert alert-warning fade in">
								<a href="#" class="close" data-dismiss="alert">&times;</a>
								<p>c'è un errore nella password o nell' email</p>
							</div>
						</c:if>
					
						Indirizzo email:
						<h:inputText value="#{controllerPaziente.email}" styleClass="form-control"></h:inputText>
						
						Password:
						<h:inputSecret value="#{controllerPaziente.password}" styleClass="form-control"></h:inputSecret>
						
						<h:commandLink action="#{controllerPaziente.loginPaziente}"
						value="Login" styleClass="submit-button btn btn-primary"/>
					</h:form>
					</f:view>
				</div>

			</div>

		</div>
	</div>

	<!-- FINE LOG IN MODAL -->


	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>

		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="img-responsive center-block"
					src="img/carousel/drCrescio.png" alt="1">
			</div>

			<div class="item">
				<img class="img-responsive center-block"
					src="img/carousel/clinica.jpg" alt="2">
			</div>

			<div class="item">
				<img class="img-responsive center-block"
					src="img/carousel/clinica2.jpg" alt="3">
			</div>


		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container">
		<a name="tipologie"></a>
		<h3 id="tipologie-title">Tipologie di esame offerte</h3>

		<!-- se il resto con 4 e' zero vuol dire che siamo sul primo elemento
			di una riga (formata da 4 elementi), se il resto con 4 e' 3 vuol dire che
			siamo invece sull' ultimo elemento. Nel primo caso è necessario aprire
			una nuova riga di bootstrap nel secondo e' necessario chiuderla -->
		
			<c:forEach var="tipologia" items="${controllerTipologia.facade.getAllTipologieEsame()}" varStatus="status">
			<c:if test="${status.index % 4 == 0}">
				<div class="row">
			</c:if>
			<div class="col-md-3">
				<div class="selectbox">
					<img class="img-responsive center-block"
						src="img/icons/${tipologia.codice}.png">
					<h4>${tipologia.nome}</h4>
				</div>
			</div>
			<c:if test="${status.index % 4 == 3}">
				
				</div>
			</c:if>
			</c:forEach>
			
			<c:if test="${status.index % 4 != 3}">
				</div>
			</c:if>
			
			

	</div>

</body>
</html>