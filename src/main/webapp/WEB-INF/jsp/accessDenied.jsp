<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>AccessDenied page</title>
    <link rel="icon"
              type="image/x-icon"
              href="images/icons/options.ico">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    
</head>
<body>

<div class="alert alert-danger">
<h2>
    Bonjour <strong>${user}</strong>, Vous n'avez pas le droit d'accéder à cette page
    <a href="<c:url value="logout" />">Se Déconnecter</a></h2></div>
</body>
</html>