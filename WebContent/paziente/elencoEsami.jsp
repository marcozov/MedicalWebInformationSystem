<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clinica Chescio Rescio</title>
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
</head>
<body> 
	<div class="container">
		<div class="page-header">
			<h1>Elenco Esami</h1>
		</div>
		
		<table class="table table-striped">
			<tr>
				<th>Nome</th>
			</tr>
			
			<tr>
				<td><a href="dettagliEsame.jsp">Sangue</a></td>
			</tr>
			
			<tr>
				<td><a href="#demo" data-toggle="collapse">Sangue2</a>
  					<div id="demo" class="collapse">
    					<table class="table table-striped">
    						<tr>
    							<th>Data Prenotazione</th>
    							<th>Data Esame</th>
    							<th>Medico</th>
    						</tr>
    						
    						<tr>
    							<td>lol1</td>
    							<td>lol2</td>
    							<td>lol3</td>
    						</tr>
    					</table>
  					</div>
				</td>
			</tr>
			
			<tr>
				<td><a href="#demo2" data-toggle="collapse">Sangue3</a>
					<div id="demo2" class="collapse">
						<p>	
							<b>Data Prenotazione</b>: boh<br />
							<b>Data Esame</b>: boh<br />
							<b>Medico</b>: Pippo<br />
						</p>
					</div>
				</td>
			</tr>
		</table>
		
		<a href="#"><button type="button" class="btn btn-default">Indietro</button></a>
		
	</div>

</body>
</html>