<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Dettagli Tipologia</title>
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
<body>
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
				<li><a href="#">Home</a></li>
				<li class="active"><a id="tipologie-nav" href="#tipologie">Tipologie di
						Esami</a></li>
				<li><a href="#">I Tuoi Esami</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><c:if test="${paziente == null}">
						<a href="#" data-toggle="modal" data-target="#log-in-modal"><span
							class="glyphicon glyphicon-log-in"></span> Login</a>
					</c:if> <c:if test="${paziente != null}">
						<h4 class="navbar-text">
							Benvenuto, <em>${paziente.nome}</em>
						</h4>
					</c:if></li>
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
					<form action="loginController" method="post">
						<c:if test="${logError != null}">
							<div class="alert alert-warning fade in">
								<a href="#" class="close" data-dismiss="alert">&times;</a>
								<p>c'è un errore nella password o nell' email</p>
							</div>
						</c:if>

						Indirizzo email: <input type="email" class="form-control"
							name="email" value="${param['email']}"></input> Password: <input
							type="password" name="password" class="form-control"></input>
						<div class="checkbox">
							<label><input type="checkbox" value="ok"
								name="keeploggedin">Rimani Connesso</label>
						</div>
						<button type="submit" class="submit-button btn btn-primary">Log
							in</button>

					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- FINE LOG IN MODAL -->
	<h3>${tipologiaEsame.nome}</h3>
	<div class="page-header">
		<h4>
			Descrizione Esame: <br>
		</h4>
		<p class="lead">${tipologiaEsame.descrizione }</p>
	</div>
	<div class="page-header">
		<h4>Indicatori Risultato:</h4>
		<p class="lead">la nostra clinica per questa tipologia mette a
			disposizione i se guenti indicatori</p>
		<ul>
			<div class="row">
			  
			  <div class="col-md-4"> <b>Indicatori</b> </div>
				<c:forEach var="indicatore"
					items="${tipologiaEsame.indicatoriRisultato }">
					<div class="col-md-4">${indicatore.nome}</div>
				</c:forEach>
			  
			</div>
		</ul>
	</div>
	<div class="page-header">
		<h4>Prerequisiti:</h4>
		<p class="lead">per poter essere sottoposti all'esame in questione
			devono essere rispettati una serie di prerequisiti</p>
		<ul>
			<div class="row">
			  
			  <div class="col-xs-12 col-sm-6 col-lg-8"> <b>Prerequisiti</b> </div>
				<c:forEach var="prerequisito"
					items="${tipologiaEsame.prerequisiti }">
					<div class="col-md-4">${prerequisito.nome}</div>
					<div class="col-md-4">${prerequisito.descrizione}</div>
				</c:forEach>
			</table>
		</ul>
	</div>
	<div class="page-header">
		<h4>Costi:</h4>
		<p class="lead">questo esame nello specifico prevede un costo di
			${tipologiaEsame.costo} &euro;</p>
	</div>
</body>
</html>