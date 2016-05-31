<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

 				var nome = $(this).find("td[name='nome']").find("a").text().toLowerCase();
 				var cognome = $(this).find("td[name='cognome']").find("a").text().toLowerCase();
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
 		
 		$(".clickable-row").click(function() {
 	        window.document.location = $(this).data("href");
 	    });
 	});
</script>


</head>
<body>
	<div class="container">
		<div class="col-sm-6 col-sm-offset-3">
			<div class="page-header">
				<h1>Medici</h1>
			</div>
			<input type="text" class="form-control" placeholder="cerca medico" id="cerca" autocomplete="off"></input>
			<table class="table table-striped" id="medici">
				<c:forEach var="medico" items="${medici}">
					<tr class='clickable-row' data-href='medico/${medico.id}'>
						<td name="nome">${medico.nome}</td> <td name="cognome">${medico.cognome}</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>

</body>
</html>