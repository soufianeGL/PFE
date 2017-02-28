<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html lang="en" ng-app="angularTable">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>

<%@include file="includes/style.jsp" %>

<style type="text/css">
[ng\:cloak], [ng-cloak], .ng-cloak {
	display: none !important;
}
</style>
  <style>
      .highlighted { background: yellow }
   </style>
</head>
<!-- END HEAD -->


			<h3 ng-show="loading"  class="float-center col-md-5" aria-hidden="true"> <br> <br> Chargement de la page ... <br></h3>

<body class="" ng-controller="listdata" >


	
	
	<!--  -->
	<div>
	<%@include file="includes/header.jsp" %>
 	</div>
		
		<div  class="container-fluid"  >
			<div class="page-content page-content-popup">
		
				<div class="page-content-fixed-header">
					<!-- BEGIN BREADCRUMBS -->
						<!-- 
					<ul class="page-breadcrumb">
						<li><a href="#">Evolution</a></li>
						<li>Liste des évolutions</li>
	
					</ul>
					-->
					<!-- END BREADCRUMBS -->
					<div class="content-header-menu">
					<%@include file="includes/roleMenus.jsp" %>
					</div>
				</div>
				<sec:authorize access="(hasRole('ADMIN')) or (hasRole('ADMIN') and hasRole('CPR'))">
				
			
				<div class="page-sidebar-wrapper">
					
					<div class="page-sidebar navbar-collapse collapse">
						
                        <!-- BEGIN SIDEBAR MENU -->
                        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                        <%@include file="includes/sidebar.jsp" %>
                    
						
					</div>
				</div>
				</sec:authorize>
		<sec:authorize access="(hasRole('ADMIN')) or (hasRole('ADMIN') and hasRole('CPR'))">
		<div class="page-fixed-main-content" >
		</sec:authorize>

		
		
			<div ng-show="showHome" ng-cloak class="ng-cloak" >
					<div class="row">
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light portlet-fit portlet-datatable bordered">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i> Liste des évolutions
								</div>
                                    <div class="actions">
                                        <a title="Imprimer la liste" ng-click="dowloandPdf()" class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                            <i class="fa fa-print" aria-hidden="true"></i>
                                        </a>
                                    </div>
							</div>
						</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageWelcome" ng-init="nombrePageWelcome=10">
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                    <option value="40">40</option>
	                                </select></div>
	                                
	                        </div>
	                    </div>
	                    <div class="form-group col-md-3 col-md-offset-6">
							<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
							
							 <div class="col-md-8"> <input type="text" ng-model="search"
								class="form-control" placeholder="Rechercher"></div>
						</div>
					<div id="table-evolution" class="table-responsive col-md-12">
						<div class="portlet-body">
						
						
								
	
						<table  class="table  table-bordered"
							id="dataTables-example">
							<thead class="table-evolution-head">
								<tr>
									<th  width="160px" ng-show="themen[0].checked" ng-click="sort('refEvolution')">Réference
										<i class="fa"
										ng-show="sortKey=='refEvolution'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[1].checked" ng-click="sort('description')">Description
										<i class="fa"
										ng-show="sortKey=='description'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th width="60px" ng-show="themen[2].checked" ng-click="sort('cpsi.usernameCpsi')">CP SI <i class="fa"
										ng-show="sortKey=='cpsi.usernameCpsi'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[3].checked">CP Recette</th>
									<th ng-show="themen[4].checked"
										ng-click="sort('etatLivraison.etatLivraison')">Etat Livraison <i class="fa" ng-show="sortKey=='etatLivraison.etatLivraison'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
	
	
									<th ng-show="themen[5].checked" ng-click="sort('dateMepSouhaitee')">Date
										MEP <i class="fa"
										ng-show="sortKey=='dateMepSouhaitee'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[6].checked" ng-click="sort('dateDebutTests')">Date
										DEB <i class="fa"
										ng-show="sortKey=='dateDebutTests'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[7].checked" ng-click="sort('dateFinTests')">Date
										FIN PR <i class="fa"
										ng-show="sortKey=='dateFinTests'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[8].checked"
										ng-click="sort('dateFinEffective')">Date FIN EFF 
										<i class="fa"
										ng-show="sortKey=='dateFinEffective'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[9].checked"
										ng-click="sort('datePrevuCahier')">Date Test PR
										 <i class="fa"
										ng-show="sortKey=='datePrevuCahier'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[10].checked"
										ng-click="sort('dateEffectiveCahier')">Date Test EFF
										 <i class="fa"
										ng-show="sortKey=='dateEffectiveCahier'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th width="120px" ng-show="themen[11].checked" ng-click="sort('avancement')">% OK
										<i class="fa"
										ng-show="sortKey=='avancement'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[12].checked">Commentaires</th>
									<th ng-show="themen[13].checked" ng-click="sort('chargeJH')">Charge
										JH <i class="fa"
										ng-show="sortKey=='chargeJH'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[14].checked" ng-click="sort('rafJH')">RAF JH
									 <i class="fa" ng-show="sortKey=='rafJH'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[15].checked"
										ng-click="sort('nombreCasTests')">Nombre Cas tests <i class="fa" ng-show="sortKey=='nombreCasTests'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
									<th ng-show="themen[16].checked" ng-click="sort('rafEnCasTests')">RAF
										Cas Test<i class="fa"
										ng-show="sortKey=='rafEnCasTests'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
	
									<th ng-click="sort('etatRecette')">Etat Recette <i class="fa" ng-show="sortKey=='etatRecette'"
										ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverse}"></i>
									</th>
								</tr>
							</thead>
							<tbody >
								<tr
									dir-paginate="user in users|orderBy:sortKey:reverse|filter:search|itemsPerPage:nombrePageWelcome" pagination-id="Welcome">
							
									<td class="ref-evolution" ng-show="themen[0].checked"> <span ><b>{{user.refEvolution}}</b></span> <br>
									</td>
									<td ng-show="themen[1].checked">{{user.description}}</td>
									<td ng-show="themen[2].checked">{{user.cpsi.usernameCpsi}}</td>
									<td ng-show="themen[3].checked"><div
											ng-repeat="cpr in user.cprecettes ">
											<tt  ng-bind-html="cpr.ssoId | highlight:search" >{{cpr.ssoId}}</tt>
										</div></td>
									<td ng-show="themen[4].checked">{{user.etatLivraison.etatLivraison}}</td>
	
									<td ng-show="themen[5].checked">{{user.dateMepSouhaitee|date:"dd/MM/yyyy"}}
				
									  <br> <br><br>
										 <span ng-show="showacceptation[$index]"  >
										
										  <span class="historique" ng-repeat="a in EvolutionAudit" >
										  
										       {{a.0.dateMepSouhaitee |date:"dd/MM/yyyy"}} <br></span>
										</span>
									</td>
									<td ng-show="themen[6].checked">
										{{user.dateDebutTests|date:"dd/MM/yyyy"}}
					
										</td>
									<td ng-show="themen[7].checked">{{user.dateFinTests|date:"dd/MM/yyyy"}}
									
									</td>
									<td ng-show="themen[8].checked">{{user.dateFinEffective|date:"dd/MM/yyyy"}}
								
									</td>
									<td ng-show="themen[9].checked">{{user.datePrevuCahier|date:"dd/MM/yyyy"}}
								
									
									</td>
									<td ng-show="themen[10].checked">{{user.dateEffectiveCahier|date:"dd/MM/yyyy"}}
								
									
									</td>
					
									<td ng-show="themen[11].checked">
										<div ng-if="user.avancement >=75 " class="progress span-avancement">
											<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
												aria-valuenow="user.avancement" aria-valuemin="0" aria-valuemax="100"
												style="width: {{user.avancement}}%">{{user.avancement}}%</div>
										
										</div> 
										<div ng-if="user.avancement <75 && user.avancement >20 " class="progress">
											<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
												aria-valuenow="user.avancement" aria-valuemin="0" aria-valuemax="100"
												style="width: {{user.avancement}}%">{{user.avancement}}%</div>
										</div> 
											<div ng-show="user.avancement <=20"  class="progress">
											<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
												aria-valuenow="user.avancement" aria-valuemin="0" aria-valuemax="100"
												style="color:#48225c; width: {{user.avancement}}%"></div>{{user.avancement}}%
										</div> 
										
									</td>
									<td ng-show="themen[12].checked">{{user.commentaires}}</td>
	
									<td ng-show="themen[13].checked">{{user.chargeJH}}
									</td>
									<td ng-show="themen[14].checked">{{user.rafJH }}
								
									</td>
									<td ng-show="themen[15].checked">{{user.nombreCasTests}}
									
									</td>
									<td ng-show="themen[16].checked">{{user.rafEnCasTests}}
									
									</td>
									<td
										ng-class="{jaune : user.etatRecette=='MAUVAISE', vert: user.etatRecette=='BONNE', rouge: user.etatRecette=='CRITIQUE'}"></td>
	
								</tr>
							</tbody>
						</table>
	
						<dir-pagination-controls max-size="5" direction-links="true"
							boundary-links="true" pagination-id="Welcome"> </dir-pagination-controls>
	
							</div>
							

						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div>
					
			
			
			
			</div>
				<a href="javascript:;" class="page-quick-sidebar-toggler"> <i
			class="icon-login"></i>
		</a>
		<div class="page-quick-sidebar-wrapper"
			data-close-on-body-click="false">
			<div class="page-quick-sidebar">
				<ul class="nav nav-tabs">
					<li><a href="javascript:;" data-target="#quick_sidebar_tab_3"
						data-toggle="tab"> <i class="icon-settings"></i> Outils
					</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active page-quick-sidebar-settings"
						id="quick_sidebar_tab_3">
						<div class="page-quick-sidebar-settings-list">
							
						<ul class="list-items borderless" ng-repeat="thema in themen track by $index">
							<li>
								<label  class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
									{{ thema.name }}
									
	                                   <input id="{{thema.id}}" ng-model="thema.checked"  type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"
	                                   ng-change="updateThemaLocalStorage(themen)" />
	                                                 <span></span>
	                               </label>
	                             
								</li>
							</ul>
							
							
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ADD PARTS  -->
		<%@include file="evolutionsCprecette.jsp" %>
		<%@include file="kpi.jsp" %>
		<%@include file="kpi3.jsp" %>
		<%@include file="users.jsp" %>
		<%@include file="evolutions.jsp" %>
		<%@include file="typeEvolution.jsp" %>
		<%@include file="livraison.jsp" %>
		<%@include file="cpsi.jsp" %>
		<%@include file="usine.jsp" %>
		<%@include file="statutAnomalie.jsp" %>
		<%@include file="Mep/addMep.jsp" %>
		<%@include file="Mep/listMeps.jsp" %>
		<%@include file="Mep/editMep.jsp" %>
		
		
		
		
		<%@include file="includes/footer.jsp" %>
		
		<button type="button" class="quick-sidebar-toggler"
					data-toggle="collapse">
					<span class="sr-only">Toggle Quick Sidebar</span> <i
						class="icon-logout"></i>
					<!-- 
	                    <div class="quick-sidebar-notification">
	                        <span class="badge badge-danger">7</span>
	                    </div>
	                     -->
		</button>
		
	<sec:authorize access="(hasRole('ADMIN')) or (hasRole('ADMIN') and hasRole('CPR'))">
	</div>
	</sec:authorize>
</div>
	


	<!-- END CONTAINER -->
	
	
	<!-- EVOLUTION CONTAINER -->

		
	<!-- END EVOLUTION CONTAINER -->
	<!-- END QUICK SIDEBAR -->
	<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
	<!-- BEGIN CORE PLUGINS -->
	<%@include file="includes/javascript.jsp" %>
	<script src="app/app.js"></script>
	
</body>

</html>