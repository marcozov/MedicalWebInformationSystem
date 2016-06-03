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

<link rel="stylesheet" type="text/css" href="../style.css">

<!-- Per responsiveness 
	width=device-width specifica che la larghezza della pagina deve seguire la larghezza dello schermo del device
	initial-scale=1 setta lo zoom iniziale -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuova Tipologia</title>

<script type="text/javascript">
	var prerequisiti = [];
	var indicatori = [];

	function listItemFormatter(name, value) {
		return "<li class='list-group-item'><span class='label label-default'>"+name+"</span>:"+value+"</li>";
	}
	
	function renderName2ValueList(htmlList, name2value) {
		var html = '';
		for (var i = 0; i < name2value.length; i++)
			html += listItemFormatter(name2value[i][0], name2value[i][1]);
		htmlList.html(html);
	}
	
	function renderNameList(htmlList, nameList) {
		var html = '';
		for (var i = 0; i < nameList.length; i++) 
			html += "<li class='list-group-item'>"+nameList[i]+"</li>";
		htmlList.html(html);
	}

	function setHiddenFields() {
		console.log("ciaoooo");
		document.getElementById("form:prereqInput").value = JSON.stringify(prerequisiti);
		document.getElementById("form:indicatoriInput").value = JSON.stringify(indicatori);
	}
	
	$(document).ready( function() {
		$("#inserisciTipologia").click( function() {
			prerequisiti.push([$("#pre-name").val(), $("#pre-value").val()]);
			renderName2ValueList($("#riepilogo"), prerequisiti);
			$("#pre-name").val('');
			$("#pre-value").val('');
			setHiddenFields();
		});
		
		$("#inserisciIndicatore").click( function() {
			indicatori.push($("#indicatore").val());
			renderNameList($("#riepilogoIndicatori"), indicatori);
			$("#indicatore").val('');
			setHiddenFields();
		});
		
	});

</script>

</head>
<body>
	<div class="container">
		<div class="col-sm-6 col-sm-offset-3">
			<f:view>
			<h:form id="form">
			<div class="form-group thumbnail">
				Codice: <strong><h:message for="codice" /></strong>
				<h:inputText value="#{controllerTipologia.codice}" styleClass="form-control"
				required="true" requiredMessage="codice obbligatorio" id="codice"/> 
				
				Nome: <strong><h:message for="nome" /></strong>
				<h:inputText value="#{controllerTipologia.nome}" styleClass="form-control"
				required="true" requiredMessage="Nome obbligatorio" id="nome"/> 
				
				Descrizione:
				<h:inputTextarea styleClass="form-control" rows="5" value="#{controllerTipologia.descrizione}"></h:inputTextarea>
				
				Costo: <strong><h:message for="costo" /></strong>
				<h:inputText value="#{controllerTipologia.costo}" styleClass="form-control"
				required="true" requiredMessage="Valore obbligatorio" id="costo" 
				validatorMessage="Inserisci un numero"> 
				<f:convertNumber/>
				</h:inputText>
				
				
				<h4>Prerequisiti</h4>
				<div class="row">
					
					<div class="col-sm-3">
						Nome:
						<input type="text" class="form-control" id="pre-name"></input>
					</div>
					<div class="col-sm-6">
						Valore:
						<input type="text" class="form-control" id="pre-value"></input>
					</div>
					<div class="col-sm-3">
						<br />
						<button type="button" class="btn btn-default" id="inserisciTipologia">aggiungi <span class="glyphicon glyphicon-chevron-right"></span></button>
					</div>
				</div>
				
				<!-- Lista popolata tramite JS -->
				<ul id="riepilogo" class="list-group">
						
				</ul>
				
				<h4>Indicatori Risultato</h4>
				<div class="row">
					
					<div class="col-sm-9">
						Nome:
						<input type="text" class="form-control" id="indicatore"></input>
					</div>
					<div class="col-sm-3">
						<br />
						<button type="button" class="btn btn-default" id="inserisciIndicatore">aggiungi <span class="glyphicon glyphicon-chevron-right"></span></button>
					</div>
				</div>
				
				<ul id="riepilogoIndicatori" class="list-group">
				
				</ul>
				
				<h:commandLink action="#{controllerTipologia.inserisci}"
						value="Inserisci tipologia" styleClass="submit-button btn btn-primary" id="submit"/>
			</div>
			
			<!-- Campi usati per le informazioni lista: prerequisiti e indicatori -->
			<h:inputHidden value="#{controllerTipologia.prerequisiti}" id="prereqInput"></h:inputHidden>
			<h:inputHidden value="#{controllerTipologia.indicatori}" id="indicatoriInput"></h:inputHidden>
			</h:form>
			</f:view>
		</div>
	</div>

</body>
</html>