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

<link rel="stylesheet" type="text/css" href="style.css">

<!-- Per responsiveness 
	width=device-width specifica che la larghezza della pagina deve seguire la larghezza dello schermo del device
	initial-scale=1 setta lo zoom iniziale -->
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="col-sm-6 col-sm-offset-3">
		<div class="page-header">

			<h1>Admin Login</h1>

		</div>

		<form action="loginAdmin" method="post">
			<div class="form-group thumbnail">
				<!--  <c:if test="${logError != null}">
					<div class="alert alert-warning fade in">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<p>c'è un errore nella password o nell' id</p>
					</div>
				</c:if> -->
				Id: <input type="text" class="form-control" name="id"
					value="${param['id']}"></input>
				<!-- non mi sembra reale sta cosa
													certo, sicuramente non deve essere quello
													assegnato dal db -->
				Password: <input type="password" name="password"
					class="form-control"></input>
				<div class="checkbox">
					<label><input type="checkbox" value="ok"
						name="keeploggedin">Rimani Connesso</label>
				</div>
				<button type="submit" class="submit-button btn btn-primary">Log
					in</button>
			</div>
		</form>
		</div>
	</div>



</body>
</html>