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

<!-- Per responsiveness 
	width=device-width specifica che la larghezza della pagina deve seguire la larghezza dello schermo del device
	initial-scale=1 setta lo zoom iniziale -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Panel</title>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>Admin Panel</h1>
		</div>
		<ul class="nav nav-pills nav-stacked">
			<li><a  href='<c:url value="admin/nuovoPaziente.jsp"></c:url>'>Inserisci paziente <span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
			<li><a href='<c:url value="admin/nuovaTipologia.jsp"></c:url>'>Inserisci Tipologia Esame</a></li>
			<li><a href='<c:url value="admin/nuovoEsame.jsp"></c:url>'>Inserisci Esame</a></li>
			<li><a href='<c:url value="admin/inserimentoRisultatiEsame.jsp"></c:url>'>Inserisci risultati di un esame</a></li>
		</ul>
	</div>
</body>
</html>