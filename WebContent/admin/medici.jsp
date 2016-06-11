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


<title>Cerca un medico</title>

<script type="text/javascript">
	$(document).ready(function() {
 		$("#cerca").keyup(function () {
 			var search = $(this).val().toLowerCase();
 			$("#medici tr").each(function () {

 				var nome = $(this).find("td[name='nome']").text().toLowerCase();
 				var cognome = $(this).find("td[name='cognome']").text().toLowerCase();
 				var nomeCognome = nome + " " + cognome;
 				var cognomeNome = cognome + " " + nome;
 				var indexNomeCognome = nomeCognome.indexOf(search);
 				var indexCognomeNome = cognomeNome.indexOf(search);

 				if (indexNomeCognome == -1 && indexCognomeNome == -1)
 					$(this).hide();
 				else
 					$(this).show();


 			});
 		});
 		
 	});
</script>


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
			    <li class="active"><a href='<c:url value="medici.jsp"></c:url>'>Visualizza tutti gli esami effettuati da un medico</a></li>
			</ul>
		</div>
		<!--</div> -->
	</nav>
<!-- ///////////////// FINE NAV ///////////////////////// -->
	<f:view>
	<h:form>
	<div class="container">
		<div class="col-sm-6 col-sm-offset-3">
			<div class="page-header">
				<h1>Elenco Medici</h1>
			</div>
			<input type="text" class="form-control" placeholder="cerca medico" id="cerca" autocomplete="off"></input>
			<table class="table table-striped" id="medici">
				<c:forEach var="medico" items="#{controllerMedico.medici}">
					<tr>
						<td name="nome">${medico.nome}</td>
						<td name="cognome">${medico.cognome}</td>
						<td>
						<h:commandLink action="#{controllerEsame.findEsamiPerMedico}" value="Visualizza esami">
						<f:param name="idmedico" value="#{medico.id}"></f:param>
						</h:commandLink>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	</h:form>
	</f:view>
</body>
</html>