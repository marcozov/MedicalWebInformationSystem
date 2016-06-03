<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Tipologia</title>
</head>
<body>
<f:view>
<h1>${controllerTipologia.tipologia.nome}</h1>
<h2>Details</h2>
<div>Code: ${controllerTipologia.tipologia.codice}</div>
<div>Price: ${controllerTipologia.tipologia.costo}</div>
<div>Description: ${controllerTipologia.tipologia.descrizione}</div>
</f:view>
</body>
</html>