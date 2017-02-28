<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html ng-app="angularTable">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<%@include file="includes/style.jsp"%>

<link rel="icon" type="image/x-icon" href="images/logo_sqli.png">

</head>

<body>
	<div id="mainWrapper" ng-controller="listdata">
		<div class="titre-login panel col-md-6 col-md-offset-3" style="color: #3a4554;">
			<h1 class=" text-center"
				style="font-style: normal; font-weight: bold;">GESTION
				DES EVOLUTIONS</h1>
		</div>


			<div class="login-card col-md-4 col-md-offset-4 panel">
				<div class="row">
					<div  class="col-md-1 col-md-offset-4">
						<img height="20%" alt="" src="images/user.png">
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-3">
						<h4 class="titre-formulaire-login" style="color: white;">
							Veuillez vous connecter</h4>
					</div>
				</div>
				<div class="row col-md-10 col-md-offset-1 ">
					
					<c:url var="loginUrl" value="/login" />
					<form action="${loginUrl}" method="post" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Erreur, veuillez contacter l'administrateur</p>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>Vous avez été déconnecté avec succès</p>
							</div>
						</c:if>


						<div class="input-group input-sm  col-md-offset2">
							<label class="input-group-addon" for="username"><img
								alt="" src="images/user16.png"></label>
								
								 <input ng-model="use"
								type="text" class="form-control" id="username" name="ssoId"
								placeholder="Enter Username" required>
						</div>

						<div class="input-group input-sm col-md-offset2">
							<label class="input-group-addon" for="password"><img
								alt="" src="images/key.png"></label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Enter Password" required>
						</div>
						<div class="input-group input-sm  col-md-offset2">
						
							<div class="mt-checkbox-inline">
								<label  style="color:white" class="mt-checkbox">
								 <input type="checkbox"
									id="rememberme" name="remember-me">  Enregistrer votre mot de passe <span></span>
								</label>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							
						<div class="form-actions">
							<button type="submit" class=" btn-default btn btn-block">Se connecter</button>
						</div>
						</form>
				</div>

			</div>

		</div>





	<script src="lib/angular/angular.js"></script>
	<script src="lib/angular/angular-route.min.js"></script>

	<script type="text/javascript">
		angular
				.element(document.getElementsByTagName('head'))
				.append(
						angular
								.element('<base href="' + window.location.pathname + '" />'));
	</script>

	<script src="lib/jquery.js"></script>
	<script src="lib/bootstrap/bootstrap.js"></script>

	<script src="lib/xeditable.js"></script>

	<script src="lib/dirPagination.js"></script>
	<script src="app/app.js"></script>
</body>
</html>