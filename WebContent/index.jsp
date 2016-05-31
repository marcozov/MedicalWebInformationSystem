<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<c:if test="${logError != null}">
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
				<c:if test="${paziente == null}">
				<a href="#" data-toggle="modal" data-target="#log-in-modal"><span
						class="glyphicon glyphicon-log-in"></span> Login</a>
				</c:if>
				<c:if test="${paziente != null}">
					<h4 class="navbar-text">Benvenuto, <em>${paziente.nome}</em></h4>
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
					<form action="loginController" method="post">
						<c:if test="${logError != null}">
							<div class="alert alert-warning fade in">
								<a href="#" class="close" data-dismiss="alert">&times;</a>
								<p>c'è un errore nella password o nell' email</p>
							</div>
						</c:if>
					
						Indirizzo email: <input type="email" class="form-control"
							name="email" value="${param['email']}"></input>
						Password: <input type="password"
							name="password" class="form-control"></input>
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

		<div class="row">
			<div class="col-md-3">
				<div class="selectbox">
					<img class="img-responsive center-block"
						src="img/icons/syringe.png">
					<h4>Analisi del sangue</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<img class="img-responsive center-block"
						src="img/icons/test-tube.png">
					<h4>Analisi delle urine</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<h4>Analisi del cecio</h4>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<h4>Analisi boh</h4>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<div class="selectbox">
					<h1>2.1</h1>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<h1>2.2</h1>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<h1>2.3</h1>
				</div>
			</div>
			<div class="col-md-3">
				<div class="selectbox">
					<h1>2.4</h1>
				</div>
			</div>
		</div>

	</div>

</body>
</html>