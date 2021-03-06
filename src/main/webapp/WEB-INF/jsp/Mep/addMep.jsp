
<div ng-show="showMep" ng-cloak class="ng-cloak" class="row">
	<div class="col-md-12">

		<!-- 
                            <div class="m-heading-1 border-green m-bordered">
                                <h3>Twitter Bootstrap Wizard Plugin</h3>
                                <p> This twitter bootstrap plugin builds a wizard out of a formatter tabbable structure. It allows to build a wizard functionality using buttons to go through the different wizard steps and using events allows to hook into
                                    each step individually. </p>
                                <p> For more info please check out
                                    <a class="btn red btn-outline" href="http://vadimg.com/twitter-bootstrap-wizard-example" target="_blank">the official documentation</a>
                                </p>
                            </div>
                            
                         -->
		<div class="portlet light bordered" id="form_wizard_1">
			<div class="portlet-title">
				<div class="caption">
					<i class=" icon-layers font-red"></i> <span
						class="caption-subject font-red bold uppercase"> Formulaire
						MEP - <span class="step-title"> Etape 1 / 4 </span>
					</span>
				</div>
			</div>
			<div class="portlet-body form">
				<form class="form-horizontal" name="mepAddform" action="#" id="submit_form"
					method="POST">
					<div class="form-wizard">
						<div class="form-body">
							<ul class="nav nav-pills nav-justified steps">
								<li><a href="#tab1" data-toggle="tab" class="step"> <span
										class="number"> 1 </span> <span class="desc"> <i
											class="fa fa-check"></i> MEP
									</span>
								</a></li>
								<li><a href="#tab2" data-toggle="tab" class="step"> <span
										class="number"> 2 </span> <span class="desc"> <i
											class="fa fa-check"></i> Scope de la MEP
									</span>
								</a></li>
								<li><a href="#tab3" data-toggle="tab" class="step active">
										<span class="number"> 3 </span> <span class="desc"> <i
											class="fa fa-check"></i> TNR Prod
									</span>
								</a></li>
								<li><a href="#tab4" data-toggle="tab" class="step"> <span
										class="number"> 4 </span> <span class="desc"> <i
											class="fa fa-check"></i> Confirmer
									</span>
								</a></li>
							</ul>
							<div id="bar" class="progress progress-striped"
								role="progressbar">
								<div class="progress-bar progress-bar-success"></div>
							</div>
							<div class="tab-content">
								<div class="alert alert-danger display-none">
									<button class="close" data-dismiss="alert"></button>
									Veuillez compl�ter le formulaire de la MEP
								</div>
								<div class="tab-pane active" id="tab1">
									<h3 class="block">MEP</h3>
									<div class="form-group">
										<label class="control-label col-md-3">Date MEP <span
											class="required"> * </span>
										</label>
										<div class="col-md-4">
											<input name="date_mep" ng-model="dateMep"
												class="form-control form-control-inline input-medium date-picker"
												data-date-format="yyyy-mm-dd" size="20" type="text" value="" />
											<span class="help-block"> S�lectionner la date MEP </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Astreintes</label>
										<div class="col-md-4">
											<select ng-model="newMep.astreinte" name="country" class="form-control"
												multiple="multiple">
												<option ng-repeat="cpr in cprs" value="{{cpr}}">{{cpr.ssoId}}</option>

											</select>
										</div>
									</div>
									<div class="form-group">
                                        <label class="control-label col-md-3">Heure D�but <span
											class="required"> * </span></label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input name="date_debut" type="text" ng-model="newMep.heureDebut" value="8:00" class="form-control timepicker timepicker-24">
                                                <span class="input-group-btn">
                                                    <button class="btn default" type="button">
                                                        <i class="fa fa-clock-o"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
									<div class="form-group">
                                        <label class="control-label col-md-3">Heure Fin <span
											class="required"> * </span></label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input name="date_fin" type="text" ng-model="newMep.heureFin" value="8:00" class="form-control timepicker timepicker-24">
                                                <span class="input-group-btn">
                                                    <button class="btn default" type="button">
                                                        <i class="fa fa-clock-o"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
								</div>
								<div class="tab-pane" id="tab2">
									<h3 class="block">Scope de la MEP</h3>
									<div class="form-group">
										<label class="control-label col-md-3">Usines impact�s
											<span class="required"> * </span>
										</label>
										<div  class="mt-checkbox-inline">
											
											<label ng-repeat="usine in usines" class="mt-checkbox">
											  <input id="inlineCheckbox2"  type="checkbox" data-checklist-model="newMep.usineImpactes" data-checklist-value="usine"> {{usine.nomUsine}} <span></span>
											</label>
										</div>
									</div>
									
									<!-- liste of evolutions and ds -->
									             
					            		<div class="row" >
							            
							                <div class="col-md-12">
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <div class="portlet light portlet-fit portlet-datatable bordered">
							                        <div class="portlet-title">
							                         <div class="caption ">
							                                  <i class="fa fa-check-square-o font-green"></i>
							                                    <span class="caption-subject font-green sbold ">Evolutions</span>
							                              </div>
							                              
							                        </div>
							                    </div>
							                <div class="form-group col-md-4">
							                <label class="col-md-4" style="margin-top:8px;">Elements</label>
							                        <div class="col-md-8">
							                            <div class="margin-bottom-10">
							                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageMgen" ng-init="nombrePageMgen=5">
							                                    <option value="5">5</option>
							                                    <option value="10">10</option>
							                                    <option value="15">15</option>
							                                    <option value="20">20</option>
							                                </select></div>
							                        </div>
							                    </div>
							                    <div class="form-group col-md-4 col-md-offset-4 ">
							                        <label style="margin-top:8px;" class="col-md-5 ">Recherche</label>
							                        
							                         <div class="col-md-7"> <input type="text" ng-model="searchMgen"
							                            class="form-control" placeholder="Rechercher"></div>
							                    </div>
							                <div id="table-evolution" class="table-responsive col-md-12">
							                    <div class="portlet-body">
							                            <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
							                        id="dataTables-example">
							                        <thead class="table-evolution-head">
							                            <tr>
							                                <th width="30%" ng-click="sortMgen('refEvolution')">R�ference
							                                    <i class="fa"
							                                    ng-show="sortKeyMgen=='refEvolution'"
							                                    ng-class="{'fa-arrow-up':reverseMgen,'fa-arrow-down':!reverseMgen}"></i>
							                                </th>
							                                <th  ng-click="sortMgen('description')">Description
							                                    <i class="fa"
							                                    ng-show="sortKeyMgen=='description'"
							                                    ng-class="{'fa-arrow-up':reverseMgen,'fa-arrow-down':!reverseMgen}"></i>
							                                </th>
							                            
							                                <th  ng-click="sortMgen('dateDebutTests')">Date
							                                    d�but <i class="fa"
							                                    ng-show="sortKeyMgen=='dateDebutTests'"
							                                    ng-class="{'fa-arrow-up':reverseMgen,'fa-arrow-down':!reverseMgen}"></i>
							                                </th>
							                          
							                                <th 
							                                    ng-click="sortMgen('dateFinEffective')">Date fin effective
							                                    <i class="fa"
							                                    ng-show="sortKeyMgen=='dateFinEffective'"
							                                    ng-class="{'fa-arrow-up':reverseMgen,'fa-arrow-down':!reverseMgen}"></i>
							                                </th>
							                            </tr>
							                        </thead>
							                        <tbody>
							                
							                            <tr
							                                dir-paginate="mgen in mgens|orderBy:sortKeyMgen:reverseMgen|filter:searchMgen|itemsPerPage:nombrePageMgen" pagination-id="mgens">
 															<td class="ref-evolution" ><b> <span ng-bind-html="mgen.refEvolution | highlight:searchMgen" >{{mgen.refEvolution}}</span></b> <br>							                                
							                                </td>
							                                <td ng-bind-html="mgen.description | highlight:searchMgen" >{{mgen.description}}</td>
							                                <td >
							                                    {{mgen.dateDebutTests|date:"dd/MM/yyyy"}}
							                                
							                                    </td>
							                           
							                                    <td >{{mgen.dateFinEffective|date:"dd/MM/yyyy"}}
							                                    
							                                </td>
							                            </tr>
							                        </tbody>
							                    </table>
							                    <dir-pagination-controls max-size="5" direction-links="true"
							                        boundary-links="true" pagination-id="mgens"> </dir-pagination-controls>
							                
							                        </div>
							                    
							            
							            
							        </div>
							        
							        <!-- END EXAMPLE TABLE PORTLET-->
							            
							        </div>
							            
					                       	
					   			</div>
					   			<!-- END TABLE EVOLUTIONS -->
					   			
					   <!--  begin table of ds -->
  			            <div class="row" >
		            
		                <div class="col-md-12">
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <div class="portlet light portlet-fit portlet-datatable bordered">
		                        <div class="portlet-title">
		                         <div class="caption ">
		                                  <i class="fa fa-check-square-o font-green"></i>
		                                    <span class="caption-subject font-green sbold ">Demandes Standards</span>
		                              </div>
		                        </div>
		                    </div>
		                <div class="form-group col-md-4">
		                <label class="col-md-4" style="margin-top:8px;">Elements</label>
		                        <div class="col-md-8">
		                            <div class="margin-bottom-10">
		                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageDS" ng-init="nombrePageDS=5">
		                                    <option value="5">5</option>
		                                    <option value="10">10</option>
		                                    <option value="15">15</option>
		                                    <option value="20">20</option>
		                                </select></div>
		                        </div>
		                    </div>
		                    <div class="form-group col-md-4 col-md-offset-4 ">
		                        <label style="margin-top:8px;" class="col-md-5 ">Recherche</label>
		                        
		                         <div class="col-md-7"> <input type="text" ng-model="searchDS"
		                            class="form-control" placeholder="Rechercher"></div>
		                    </div>
		                <div id="table-evolution" class="table-responsive col-md-12">
		                    <div class="portlet-body">
		                            <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
		                        id="dataTables-example">
		                        <thead class="table-evolution-head">
		                            <tr>
		                                <th width="30%"  ng-click="sortDS('refEvolution')"> R�ference
		                                    <i class="fa"
		                                    ng-show="sortKeyDS=='refEvolution'"
		                                    ng-class="{'fa-arrow-up':reverseDS,'fa-arrow-down':!reverseDS}"></i>
		                                </th>
		                                <th  ng-click="sortDS('description')">Description
		                                    <i class="fa"
		                                    ng-show="sortKeyDS=='description'"
		                                    ng-class="{'fa-arrow-up':reverseDS,'fa-arrow-down':!reverseDS}"></i>
		                                </th>
		                            
		                                <th  ng-click="sortDS('dateDebutTests')">Date
		                                    D�but <i class="fa"
		                                    ng-show="sortKeyDS=='dateDebutTests'"
		                                    ng-class="{'fa-arrow-up':reverseDS,'fa-arrow-down':!reverseDS}"></i>
		                                </th>
		                           
		                                <th 
		                                    ng-click="sortDS('dateFinEffective')">Date fin effective
		                                    <i class="fa"
		                                    ng-show="sortKeyDS=='dateFinEffective'"
		                                    ng-class="{'fa-arrow-up':reverseDS,'fa-arrow-down':!reverseDS}"></i>
		                                </th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                
		                            <tr
		                                dir-paginate="demande in ds|orderBy:sortKeyMgen:reverseDS|filter:searchDS|itemsPerPage:nombrePageDS" pagination-id="DS">
		                                <td class="ref-evolution" ><b> <span ng-bind-html="demande.refEvolution | highlight:searchDS" >{{demande.refEvolution}}</span></b> <br>
		                                
		                                </td>
		                                <td ng-bind-html="demande.description | highlight:searchDS" >{{demande.description}}</td>
		                         
		
		                                <td >
		                                    {{demande.dateDebutTests|date:"dd/MM/yyyy"}}
		                                
		                                    </td>
	
	
		                                    <td >{{demande.dateFinEffective|date:"dd/MM/yyyy"}}
		                                </td>
		                            </tr>
		                        </tbody>
		                    </table>
		                    <dir-pagination-controls max-size="5" direction-links="true"
		                        boundary-links="true" pagination-id="DS"> </dir-pagination-controls>
		                
		                        </div>
		                    
		            
		            
		        </div>
		        
		        <!-- END EXAMPLE TABLE PORTLET-->
		            
		        </div>
		            
                       
                       	
   			</div>
   			<!-- END TABLE DS -->
									
		</div>
		
								
								<div class="tab-pane" id="tab3">
									<h3 class="block">TNRs Prod</h3>
							
								
									<div class="form-group">
										<label class="control-label col-md-3">R�sultats</label>
										<div class="col-md-4">
											<select ng-model="newMep.resultat" name="country" class="form-control" ng-init="newMep.resultat='Choix1'">
												<option  value="Choix1">--- Choisir un r�sultat ---</option>
												<option  value="Concluant">Concluant</option>
												<option  value="Concluant Avec Reserve">Concluant avec r�serve</option>
												<option	 value="Non Concluant">Non concluant</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
								
					   			<!-- end table of problemes resolus -->
											
											<div id="form_payment_error"></div>
										</div>
									</div>
									
											  <!-- table of problemes r�solus -->
										<div class="row" >
							            
							          
							                <div class="col-md-12">
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <div class="portlet light portlet-fit portlet-datatable bordered">
							                        <div class="portlet-title">
							                         <div class="caption ">
							                                  <i class="fa fa-check-square-o font-green"></i>
							                                    <span class="caption-subject font-green sbold ">Probl�mes r�solus</span>
							                              </div>
							                              
							                        </div>
							                    </div>
							                <div class="form-group col-md-4">
							                <label class="col-md-4" style="margin-top:8px;">Elements</label>
							                        <div class="col-md-8">
							                            <div class="margin-bottom-10">
							                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageProblemeResolus" ng-init="nombrePageProblemeResolus=5">
							                                    <option value="5">5</option>
							                                    <option value="10">10</option>
							                                    <option value="15">15</option>
							                                    <option value="20">20</option>
							                                </select></div>
							                        </div>
							                    </div>
							                    <div class="form-group col-md-4 col-md-offset-4 ">
							                        <label style="margin-top:8px;" class="col-md-5 ">Recherche</label>
							                        
							                         <div class="col-md-7"> <input type="text" ng-model="searchProblemeResolus"
							                            class="form-control" placeholder="Rechercher"></div>
							                    </div>
							                <div id="table-evolution" class="table-responsive col-md-12">
							                    <div class="portlet-body col-md-8 col-md-offset-2">
							                            <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
							                        id="dataTables-example">
							                        <thead class="table-evolution-head">
							                            <tr>
							                                <th  ng-click="sortProblemeResolus('id')">ID
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeResolus=='id'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeResolus,'fa-arrow-down':!reverseProblemeResolus}"></i>
							                                </th>
							                                <th  ng-click="sortProblemeResolus('description')">Description
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeResolus=='description'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeResolus,'fa-arrow-down':!reverseProblemeResolus}"></i>
							                                </th>
							                            </tr>
							                        </thead>
							                        <tbody>
							                
							                            <tr
							                                dir-paginate="anomalieR in anomaliesResolus|orderBy:sortKeyProblemeResolu:reverseProblemeResolu|filter:searchProblemeResolu|itemsPerPage:nombrePageProblemeResolu" pagination-id="ProblemeResolu">
							                                <td ng-bind-html="anomalieR.id | highlight:searchProblemeResolu" >{{anomalieR.id}}</td>
							                                <td ng-bind-html="anomalieR.description | highlight:searchProblemeResolu" >{{anomalieR.description}}</td>
						                                     <td >
																<a title="Supprimer" href="" class="btn btn-default" ng-click="supprimerAnomamlieResolue(anomalieR)">
																	<img alt="not found" src="images/remove.png">
																</a>
							                                </td>
							                        </tbody>
							                    </table>
							                    <dir-pagination-controls max-size="5" direction-links="true"
							                        boundary-links="true" pagination-id="ProblemeResolu"> </dir-pagination-controls>
							                
							                        </div>
							                    
							            
							        </div>
							        
							        <!-- END EXAMPLE TABLE PORTLET-->
							        
							        <!-- FORM INLINE EXAMPLE ANOMALIE RESOLUE -->
										<div  class="row"> 
									        <div class="col-md-1">
									         <a href="" title="ajouter une anomalie r�solue" class="btn btn-success btn-outline btn-circle"  ng-click="addFormAnomalieResolueAction()" ><i class="fa fa-plus"></i></a>
									        </div>
									        <div class="col-md-12" ng-show="addFormAnomalieResolue" >
												<form name="anomalieOuvertAddForm"  class="form-horizontal">
							                            <div class="form-body">
							                            	<div class="form-group">
				                                                <label class="control-label col-md-1">Id</label>
				                                                <div class="col-md-2">
																 <input onclick="this.focus();this.select()" type="text"
																	 ng-model="newAnomalieResolue.id"
																	class="form-control" placeholder="ID" >
																</div>
																
													     	 <label class="control-label col-md-2">Commentaire</label>
			                                                <div class="col-md-6 ">
															 <input onclick="this.focus();this.select()" type="text"
																 ng-model="newAnomalieResolue.description"
																class="form-control" placeholder="description" >
															</div>
															
	                                                      	<div class="col-md-1">
															 <button ng-click="saveAnomalieResolus()"   type="submit" class="btn btn-success">
			                                                        <i class="fa fa-check"></i></button>
		                                                    </div>
														</div>
													
			                                   	 </div>
			                                    </form>									       
		                                     </div>
								        
								        </div>
								        
								        <!-- END FORM ANOMALIE RESOLUE -->
							            
							        </div>
							            
					                       
					                       	
					   			</div>
					   			<br>
					   			<!-- end table probleme resolus -->
					   			
					   		<!-- table of problemes ouvert -->
										<div class="row" >
							            
							          
							                <div class="col-md-12">
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <div class="portlet light portlet-fit portlet-datatable bordered">
							                        <div class="portlet-title">
							                         <div class="caption ">
							                                  <i class="fa fa-check-square-o font-green"></i>
							                                    <span class="caption-subject font-green sbold ">Probl�mes ouverts</span>
							                              </div>
							                        </div>
							                    </div>
							                <div class="form-group col-md-4">
							                <label class="col-md-4" style="margin-top:8px;">Elements</label>
							                        <div class="col-md-8">
							                            <div class="margin-bottom-10">
							                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageProblemeOuverts" ng-init="nombrePageProblemeOuverts=5">
							                                    <option value="5">5</option>
							                                    <option value="10">10</option>
							                                    <option value="15">15</option>
							                                    <option value="20">20</option>
							                                </select></div>
							                        </div>
							                    </div>
							                    <div class="form-group col-md-4 col-md-offset-4 ">
							                        <label style="margin-top:8px;" class="col-md-5 ">Recherche</label>
							                        
							                         <div class="col-md-7"> <input type="text" ng-model="searchProblemeOuverts"
							                            class="form-control" placeholder="Rechercher"></div>
							                    </div>
							                <div id="table-evolution" class="table-responsive col-md-12">
							                    <div class="portlet-body col-md-8 col-md-offset-2">
							                            <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
							                        id="dataTables-example">
							                        <thead class="table-evolution-head">
							                            <tr>
							                                <th  ng-click="sortProblemeOuverts('id')">ID
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeOuverts=='id'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeOuverts,'fa-arrow-down':!reverseProblemeOuverts}"></i>
							                                </th>
							                                <th  ng-click="sortProblemeOuverts('description')">Description
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeOuverts=='description'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeOuverts,'fa-arrow-down':!reverseProblemeOuverts}"></i>
							                                </th>
							                            </tr>
							                        </thead>
							                        <tbody>
							                
							                            <tr
							                                dir-paginate="anomalieO in anomaliesOuverts|orderBy:sortKeyProblemeOuverts:reverseProblemeOuverts|filter:searchProblemeOuverts|itemsPerPage:nombrePageProblemeOuverts" pagination-id="ProblemeOuverts">
							                                <td ng-bind-html="anomalieO.id | highlight:searchProblemeOuverts" >{{anomalieO.id}}</td>
							                                <td ng-bind-html="anomalieO.description | highlight:searchProblemeOuverts" >{{anomalieO.description}}</td>
							                                <td >
																<a title="Supprimer" href="" class="btn btn-default" ng-click="supprimerAnomalieOverte(anomalieO)">
																	<img alt="not found" src="images/remove.png">
																</a>
															                                
							                                </td>
							                                
							                        </tbody>
							                    </table>
							                    <dir-pagination-controls max-size="5" direction-links="true"
							                        boundary-links="true" pagination-id="ProblemeOuverts"> </dir-pagination-controls>
							                
							                        </div>
							                    
							            
							        </div>
							        
							        <!-- END EXAMPLE TABLE PORTLET-->
							        
							        <!-- FORM INLINE EXAMPLE ANOMALIE RESOLUE -->
								        <div  class="row"> 
									        <div class="col-md-1">
									         <a href="" title="ajouter une anomalie r�solue" class="btn btn-success btn-outline btn-circle"  ng-click="addFormAnomalieOuverteAction()" ><i class="fa fa-plus"></i></a>
									        </div>
									        <div class="col-md-12" ng-show="addFormAnomalieOuverte" >
												<form name="anomalieOuvertAddForm"  class="form-horizontal">
							                            <div class="form-body">
							                            	<div class="form-group">
				                                                <label class="control-label col-md-1">Id</label>
				                                                <div class="col-md-2">
																 <input onclick="this.focus();this.select()" type="text"
																	 ng-model="newAnomalieOuvert.id"
																	class="form-control" placeholder="ID" >
																</div>
																
													     	 <label class="control-label col-md-2">Commentaire</label>
			                                                <div class="col-md-6 ">
															 <input onclick="this.focus();this.select()" type="text"
																 ng-model="newAnomalieOuvert.description"
																class="form-control" placeholder="description" >
															</div>
															
	                                                      	<div class="col-md-1">
															 <button ng-click="saveAnomalieOuverts()"   type="submit" class="btn btn-success">
			                                                        <i class="fa fa-check"></i></button>
		                                                    </div>
														</div>
													
			                                   	 </div>
			                                    </form>									       
		                                     </div>
								        
								        </div>
								        
								        <!-- END FORM ANOMALIE RESOLUE -->
							            
							        </div>
							            
					                       
					                       	
					   			</div>
					   			<!-- END TABLE PROBLEMES OUVERTS -->
					   			<br>
			   				   		<!-- TABLE PROBLEMES EN ESCALADE -->
										<div class="row" >
							            
							          
							                <div class="col-md-12">
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
							                    <div class="portlet light portlet-fit portlet-datatable bordered">
							                        <div class="portlet-title">
							                         <div class="caption ">
							                                  <i class="fa fa-check-square-o font-green"></i>
							                                    <span class="caption-subject font-green sbold ">Probl�mes en escalade</span>
							                              </div>
							                              
							                        </div>
							                    </div>
							                <div class="form-group col-md-4">
							                <label class="col-md-4" style="margin-top:8px;">Elements</label>
							                        <div class="col-md-8">
							                            <div class="margin-bottom-10">
							                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageProblemeEscalades" ng-init="nombrePageProblemeEscalades=5">
							                                    <option value="5">5</option>
							                                    <option value="10">10</option>
							                                    <option value="15">15</option>
							                                    <option value="20">20</option>
							                                </select></div>
							                        </div>
							                    </div>
							                    <div class="form-group col-md-4 col-md-offset-4 ">
							                        <label style="margin-top:8px;" class="col-md-5 ">Recherche</label>
							                        
							                         <div class="col-md-7"> <input type="text" ng-model="searchProblemeEscalades"
							                            class="form-control" placeholder="Rechercher"></div>
							                    </div>
							                <div id="table-evolution" class="table-responsive col-md-12">
							                    <div class="portlet-body col-md-8 col-md-offset-2">
							                            <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
							                        id="dataTables-example">
							                        <thead class="table-evolution-head">
							                            <tr>
							                                <th  ng-click="sortProblemeEscalades('id')">ID
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeEscalades=='id'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeEscalades,'fa-arrow-down':!reverseProblemeEscalades}"></i>
							                                </th>
							                                <th  ng-click="sortProblemeEscalades('description')">Description
							                                    <i class="fa"
							                                    ng-show="sortKeyProblemeEscalades=='description'"
							                                    ng-class="{'fa-arrow-up':reverseProblemeEscalades,'fa-arrow-down':!reverseProblemeEscalades}"></i>
							                                </th>
							                            </tr>
							                        </thead>
							                        <tbody>
							                
							                            <tr
							                                dir-paginate="anomalieE in anomaliesEscalades|orderBy:sortKeyProblemeEscalades:reverseProblemeEscalades|filter:searchProblemeEscalades|itemsPerPage:nombrePageProblemeEscalades" pagination-id="ProblemeEscalades">
							                                <td ng-bind-html="anomalieE.id | highlight:searchProblemeEscalades" >{{anomalieE.id}}</td>
							                                <td ng-bind-html="anomalieE.description | highlight:searchProblemeEscalades" >{{anomalieE.description}}</td>
							                                <td >
																<a title="Supprimer" href="" class="btn btn-default" ng-click="supprimerAnomalieEscalade(anomalieE)">
																	<img alt="not found" src="images/remove.png">
																</a>
															                                
							                                </td>
							                        </tbody>
							                    </table>
							                    <dir-pagination-controls max-size="5" direction-links="true"
							                        boundary-links="true" pagination-id="ProblemeEscalades"> </dir-pagination-controls>
							                
							                        </div>
							                        
							                        
							                     <!-- FORM INLINE EXAMPLE ANOMALIE RESOLUE -->
							        </div>
							        
							        <!-- END EXAMPLE TABLE PORTLET-->
							            <div  class="row"> 
									        <div class="col-md-1">
									         <a href="" title="ajouter une anomalie en escalade" class="btn btn-success btn-outline btn-circle"  ng-click="addFormAnomalieEscaladeAction()" ><i class="fa fa-plus"></i></a>
									        </div>
									        <div class="col-md-12" ng-show="addFormAnomalieEscalade" >
												<form name="anomalieEscaladeAddForm" class="form-horizontal">
							                            <div class="form-body">
							                            	<div class="form-group">
				                                                <label class="control-label col-md-1">Id</label>
				                                                <div class="col-md-2">
																 <input onclick="this.focus();this.select()" type="text"
																	 ng-model="newAnomalieEscalade.id"
																	class="form-control" placeholder="ID" >
																</div>
																
													     	 <label class="control-label col-md-2">Commentaire</label>
			                                                <div class="col-md-6 ">
															 <input onclick="this.focus();this.select()" type="text"
																 ng-model="newAnomalieEscalade.description"
																class="form-control" placeholder="description" >
															</div>
															 <button ng-click="saveAnomalieEscalade()"   type="submit" class="btn btn-success">
		                                                        <i class="fa fa-check"></i></button>
														</div>
														<div class="form-group">
			                                          
												
														</div>
			                                   	 </div>
			                                    </form>									       
		                                     </div>
								        
								        </div>
								        
								        <!-- END FORM ANOMALIE RESOLUE -->    
							                        
		                        	<div class="form-group">
										<label class="control-label col-md-3">R�gression</label>
										<div class="col-md-4">
											<select ng-model="newMep.regression" name="country" class="form-control">
												<option  value=1>OUI</option>
												<option  value=0>NON</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Commentaire</label>
										<div class="col-md-5">
										<textarea  class="text-box" ng-model="newMep.commentaire" rows="5" cols="70"></textarea>
										</div>
									</div>
							                    
							        </div>
							            
					                       
					                       	
					   			</div>
					   			<!-- end table probleme en escalade -->
					   			
								</div>
								<!--  -->
								<div class="tab-pane" id="tab4">
								<!-- 
									<h3 class="block">Confirmer</h3>
									<h4 class="form-section">Account</h4>
									<div class="form-group">
										<label class="control-label col-md-3">Username:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="username"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Email:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="email"></p>
										</div>
									</div>
									<h4 class="form-section">Profile</h4>
									<div class="form-group">
										<label class="control-label col-md-3">Fullname:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="fullname"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Remarks:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="remarks"></p>
										</div>
									</div>
									<h4 class="form-section">Billing</h4>
									<div class="form-group">
										<label class="control-label col-md-3">Card Holder
											Name:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="card_name">
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Card Number:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="card_number">
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">CVC:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="card_cvc"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Expiration:</label>
										<div class="col-md-4">
											<p class="form-control-static"
												data-display="card_expiry_date"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Payment Options:</label>
										<div class="col-md-4">
											<p class="form-control-static" data-display="payment[]">
											</p>
										</div>
									</div>
									 -->
								</div>
							</div>
						</div>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-3 col-md-9">
									<a href="javascript:;" class="btn btn-default button-previous">
										<i class="fa fa-angle-left"></i> Retour
									</a> <a href="javascript:;"
										ng-click="sendDS(dateMep);sendMgen(dateMep)"
										class="btn btn-outline green button-next"> Suivant <i
										class="fa fa-angle-right"></i>
									</a> <a href="javascript:;" ng-click="saveMep()" class="btn green button-submit">
										Valider <i class="fa fa-check"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
</div>
 					
</div>
