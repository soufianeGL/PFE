	<!-- BEGIN CONTAINER -->

	<div ng-show="showEvolution" ng-cloak class="ng-cloak">
	
	

			
			<div class="row"  ng-show="showTableEvolution">
				<div class="col-md-12" >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Gestion des évolutions
							</div>
							<div class="tools">
							<div class="btn-group">
                                            <a title="Exporter la sélection" class="btn red btn-outline btn-circle" href="javascript:;" data-toggle="dropdown">
                                                <i class="fa fa-share"></i>
                                                <span class="hidden-xs"> Exporter</span>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right" id="sample_3_tools">
                                                <li>
                                                    <a title="sauvegarder les colonnes à exporter" class="btn red btn-outline sbold" data-toggle="modal" href="" ng-click="saveChexboxesColumns()" data-action="0" class="tool-action">
                                                           Sauvegarder</a>
                                                </li>
                                                  <li class="divider"> </li>
                                                <li>
                                                    <a href="evols.pdf" target="_blank" data-action="2" class="tool-action">
                                                        <i  class="fa fa-file-pdf-o"></i> PDF</a>
                                                </li>
                                                <li>
                                                    <a href="evols.xls" data-action="3" class="tool-action">
                                                        <i class="fa fa-file-excel-o"></i> Excel</a>
                                                </li>
                                                
                                                   <li>
	                                                    <a href="" ng-click="initialiserSelection()" data-action="0" class="tool-action">
	                                                          <i class="fa fa-close"></i>Réinitialiser</a>
	                                                </li>
                                             
                                               
                                            </ul>
                                        </div>
							</div>
						</div>
					</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageEvol" ng-init="nombrePageEvol=10">
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                    <option value="40">40</option>
	                                </select></div>
	                        </div>
                   </div>
                   <div class="col-md-1">
                    
                   	<button title="ajouter une évolution" class="btn btn-success btn-outline btn-circle" ng-click="showAddEvolutionFormAction()"><i class="fa fa-plus"></i></button>
                   </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input onclick="this.focus();this.select()" type="text" ng-model="searchEvol"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body">
							

					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
								<th>
									<!--<input type="checkbox"
									ng-model="model.allItemsSelected" ng-change="selectAll()">  -->
								</th>



								<th style="min-width: 200px" ng-show="themen[0].checked" ng-click="sortEvol('refEvolution')">Réference
									<i class="fa sort-icon"
									ng-show="sortKeyEvol=='refEvolution'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[1].checked" ng-click="sortEvol('description')">Description
									<i class="fa sort-icon"
									ng-show="sortKeyEvol=='description'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th width="60px" ng-show="themen[2].checked" ng-click="sortEvol('cpsi.username')">CP SI <i class="fa sort-icon"
									ng-show="sortKeyEvol=='cpsi.username'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[3].checked">CP Recette</th>
								<th ng-show="themen[4].checked"
									ng-click="sortEvol('etatLivraison.etatLivraison')">Etat Livraison <i
									class="fa sort-icon" ng-show="sortKeyEvol=='etatLivraison.etatLivraison'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>


								<th ng-show="themen[5].checked" ng-click="sortEvol('dateMepSouhaitee')">Date
									MEP <i class="fa sort-icon"
									ng-show="sortKeyEvol=='dateMepSouhaitee'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[6].checked" ng-click="sortEvol('dateDebutTests')">Date
									DEB <i class="fa sort-icon"
									ng-show="sortKeyEvol=='dateDebutTests'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[7].checked" ng-click="sortEvol('dateFinTests')">Date
									FIN PR <i class="fa sort-icon"
									ng-show="sortKeyEvol=='dateFinTests'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[8].checked"
									ng-click="sortEvol('dateFinEffective')">Date FIN EFF <i
									class="fa sort-icon"
									ng-show="sortKeyEvol=='dateFinEffective'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[9].checked"
									ng-click="sortEvol('datePrevuCahier')">Date Test PR
									 <i class="fa sort-icon"
									ng-show="sortKeyEvol=='datePrevuCahier'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[10].checked"
									ng-click="sortEvol('dateEffectiveCahier')">Date Test EFF
									 <i class="fa sort-icon"
									ng-show="sortKeyEvol=='dateEffectiveCahier'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th width="120px" ng-show="themen[11].checked" ng-click="sortEvol('avancement')">Avancement
									<i class="fa sort-icon"
									ng-show="sortKeyEvol=='avancement'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[12].checked">Commentaires</th>
								<th ng-show="themen[13].checked" ng-click="sortEvol('chargeJH')">Charge
									JH <i class="fa sort-icon"
									ng-show="sortKeyEvol=='chargeJH'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[14].checked" ng-click="sortEvol('rafJH')">RAF JH <i
									class="fa sort-icon" ng-show="sortKeyEvol=='rafJH'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[15].checked"
									ng-click="sortEvol('nombreCasTests')">NB Cas tests <i
									class="fa sort-icon" ng-show="sortKeyEvol=='nombreCasTests'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<th ng-show="themen[16].checked" ng-click="sortEvol('rafEnCasTests')">RAF
									Cas Test<i class="fa sort-icon"
									ng-show="sortKeyEvol=='rafEnCasTests'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>

								<th ng-click="sortEvol('etatRecette')">Etat Recette <i
									class="fa sort-icon" ng-show="sortKeyEvol=='etatRecette'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								</th>
								<!-- 
								<th ng-click="sortEvol('created')">Crée le
								<i class="fa" ng-show="sortKeyEvol=='created'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								
								</th>
								 -->
								<th ng-click="sortEvol('updated')">Modifié le
								<i class="fa" ng-show="sortKeyEvol=='updated'"
									ng-class="{'fa-arrow-up':reverseEvol,'fa-arrow-down':!reverseEvol}"></i>
								
								</th>
								

							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="user in users|orderBy:sortKeyEvol:reverseEvol|filter:searchEvol|itemsPerPage:nombrePageEvol" pagination-id="EvolsAdmin">
								<td>
								<label  class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
									<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"
									ng-model="user.evolutionSelected" ng-true-value=1
									ng-false-value=0
									ng-change="selectionner(user.idEvolution, user.evolutionSelected)">
                                                 <span></span>
                               </label>
							
								</td>

								<td class="ref-evolution" ng-show="themen[0].checked"><b> <span ng-bind-html="user.refEvolution | highlight:searchEvol" >{{user.refEvolution}}</span></b> <br>
								 <a title="Voir l'historique  class="link-inwi"  ng-click="LoadAudit($index,user.idEvolution)"><img alt="" src="images/plus_hist.png"></a>
								<a title="Cacher l'historique" class="link-inwi" ng-click="showacceptation[$index]=false"><img alt="" src="images/minus.png"></a>
								
								<br> <br>
									 <span class="historique" ng-show="showacceptation[$index]" >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.1.username|uppercase}} le {{a.1.timestamp |date:"dd/MM/yyyy"}} : {{a.2}}  <br></span>
									</span>
								
								</td>
								<td ng-bind-html="user.description | highlight:searchEvol" ng-show="themen[1].checked">{{user.description}}</td>
								<td ng-bind-html="user.cpsi.usernameCpsi | highlight:searchEvol" ng-show="themen[2].checked">{{user.cpsi.usernameCpsi}}</td>
								<td ng-show="themen[3].checked"><div
										ng-repeat="cpr in user.cprecettes ">
										<tt  ng-bind-html="cpr.ssoId | highlight:searchEvol" >{{cpr.ssoId}}</tt>
									</div></td>
								<td ng-show="themen[4].checked">{{user.etatLivraison.etatLivraison}}</td>

								<td ng-show="themen[5].checked">{{user.dateMepSouhaitee|date:"dd/MM/yyyy"}}
			
								  <br> <br><br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateMepSouhaitee |date:"dd/MM/yyyy"}} <br></span>
									</span>
								</td>
								<td ng-show="themen[6].checked">
									{{user.dateDebutTests|date:"dd/MM/yyyy"}}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span  class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateDebutTests |date:"dd/MM/yyyy"}} <br></span>
									</span>
									</td>
								<td ng-show="themen[7].checked">{{user.dateFinTests|date:"dd/MM/yyyy"}}
									<br> <br> <br>
									 <span  class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateFinTests |date:"dd/MM/yyyy"}} <br></span>
									</span>
								</td>
								<td ng-show="themen[8].checked">{{user.dateFinEffective|date:"dd/MM/yyyy"}}
								  <br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateFinEffective |date:"dd/MM/yyyy"}} <br></span>
									</span>
								</td>
								<td ng-show="themen[9].checked">{{user.datePrevuCahier|date:"dd/MM/yyyy"}}
								  <br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.datePrevuCahier |date:"dd/MM/yyyy"}} <br></span>
									</span>
								
								</td>
								<td ng-show="themen[10].checked">{{user.dateEffectiveCahier|date:"dd/MM/yyyy"}}
								   <br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateEffectiveCahier |date:"dd/MM/yyyy"}} <br></span>
									</span>
								
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
			
			
									<div  class="avancement-space">
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.avancement}} <br></span>
									</span>
									</div>
								</td>
								<td ng-bind-html="user.commentaires| highlight:searchEvol" ng-show="themen[12].checked">{{user.commentaires}}</td>

								<td ng-show="themen[13].checked">{{user.chargeJH}}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.chargeJH}} <br></span>
									</span>
								</td>
								<td ng-show="themen[14].checked">{{user.rafJH }}
								<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.rafJH}} <br></span>
									</span>
								</td>
								<td ng-show="themen[15].checked">{{user.nombreCasTests}}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.nombreCasTests}} <br></span>
									</span>
								</td>
								<td ng-show="themen[16].checked">{{user.rafEnCasTests}}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									       {{a.0.rafEnCasTests}} <br></span>
									</span>
								</td>
								<td
									ng-class="{jaune : user.etatRecette=='MAUVAISE', vert: user.etatRecette=='BONNE', rouge: user.etatRecette=='CRITIQUE'}"></td>
								<!-- <td >{{user.created|date:"dd/MM/yyyy"}}</td> -->
								<td >{{user.updated|date:"dd/MM/yyyy HH:mm:ss"}}</td>
								
									
									<td>
									<a title="Editer" class="btn btn-circle btn-icon-only btn-info" href="" ng-click="edit2(user.idEvolution)">
										<i class="icon-note"></i>
									</a></td>
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="EvolsAdmin"> </dir-pagination-controls>
				
						</div>
					
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
			
		</div>
	</div>
	
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <br>
                    <div class="row" ng-show='showModifForm'>
                        <div class="col-md-9 col-md-offset-1">
                            <!-- BEGIN PORTLET-->
                            <div id="update-form-evolution" class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold uppercase">&nbsp; MODIFICATION D'UNE EVOLUTION</span>
                                    </div>
                                    <div class="actions">
                                     <a class="btn btn-wanring btn-outline btn-circle" ng-click="showEvolsForm()" href="javascript:;"data-toggle="dropdown" >
                                           <i class="fa fa-arrow-left"></i>
                                           <span class="hidden-xs"> Retour</span>
                     				  </a>
                                        
                                  <!-- actions button
                                        <div class="btn-group">
                                            <a class="btn red btn-outline btn-circle btn-sm uppercase sbold" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;"> Option 1</a>
                                                </li>
                                                <li class="divider"> </li>
                                                <li>
                                                    <a href="javascript:;">Option 2</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">Option 3</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">Option 4</a>
                                                </li>
                                            </ul>
                                        </div>
                                   -->
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form name="evolutionEditForm"  class="form-horizontal form-bordered" novalidate>
			                            <div class="form-body">
											<div class="form-group">
                                                <label class="control-label col-md-3">Référence</label>
											      <div class="col-md-4">
												     <input  placeholder="REF"
														type="text" ng-model="evolution.refEvolution"
														class="form-control" required="required">
										
										          </div>
										     </div>
											<div class="form-group">
                                                <label class="control-label col-md-3">Description</label>
                                                <div class="col-md-8">
                                                
												 <input type="text"
													name="description" ng-model="evolution.description"
													class="form-control" placeholder="Description" >
												</div>
											</div>
					
											<div class="form-group">
		                                        <label for="multiple" class="control-label col-md-3">CP Recette</label>
		                                        <div class="col-md-5">
			                                        <select ng-model="evolution.cprecettes" class="form-control" multiple>
			                                              <option ng-repeat="cpr in cprs" value="{{cpr}}">{{cpr.ssoId}}</option>
			                                        </select>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label for="single" class="col-md-3 control-label">CP SI </label>
		                                        <div class="col-md-3">
			                                        <select  ng-model="evolution.cpsi" class="form-control">
														<option ng-repeat="cp in cps" value="{{cp}}">{{cp.usernameCpsi}}</option>
		                                    		</select>
	                                    		</div>
	                                    	</div>														
											<div class="form-group">
                                                <label class="control-label col-md-3">Date début des tests </label>
                                                <div class="col-md-3">
                                                    <input ng-model="evolution.dateDebutTests" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date début</span>
                                                </div>
                                            </div>
													     
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Date fin des tests</label>
                                                <div class="col-md-4">
                                                    <input ng-model="evolution.dateFinTests" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                <span class="help-block"> Date fin prévue pour les tests</span>
                                                </div>
                                                 <div class="col-md-4 col-md-offset-1">
                                                    <input ng-model="evolution.dateFinEffective" class="form-control  input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date de fin effective pour les tests</span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Date MEP</label>
                                                <div class="col-md-4">
                                                    <input ng-model="evolution.dateMepSouhaitee" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date MEP</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Date du cahier de tests</label>
                                                <div class="col-md-4">
                                                    <input ng-model="evolution.datePrevuCahier" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date prévue pour le cahier de tests</span>
                                                </div>
                                                 <div class="col-md-4 col-md-offset-1">
                                                    <input ng-model="evolution.dateEffectiveCahier" class="form-control  input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date effective pour le cahier de tests </span>
                                                </div>
                                            </div>
                                            
                                         	<div class="form-group">
		                                        <label for="single" class="col-md-3 control-label">Etat livraison </label>
		                                        <div class="col-md-4">
			                                        <select  required="required" ng-model="evolution.etatLivraison" class="form-control">
														<option ng-repeat="livraison in livraisons" value="{{livraison}}" >{{livraison.etatLivraison}}</option>
		                                    		</select>
	                                    		</div>
	                                    	</div>	
														
											<div class="form-group">
												<label  class="control-label col-md-3">Charge JH</label>
												<div class="col-md-3">
												 <input  type="number"
													class="form-control" onclick="this.focus();this.select()"  ng-model="evolution.chargeJH"
													name="chargeJH" min="0" max="100" placeholder="chargeJH"
													required>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3">Nombre de cas de tests </label>
													<div class="col-md-4">
														 <input type="number"
															class="form-control" ng-model="evolution.nombreCasTests"
															name="nombreCasTests" onclick="this.focus();this.select()"  placeholder="nombreCasTests">
													</div>
											</div>
										
											<div class="form-group">
												<label class="control-label col-md-3"> RAF</label> 
												<div class="col-md-4">
												<input type="number" class="form-control"
													ng-model="evolution.rafJH" onclick="this.focus();this.select()"  name="rafJH" min="0" max="100"
													placeholder="RAF JH">
													 <span class="help-block"> Selectionner RAF JH</span>
												</div>
												<div class="col-md-4 col-md-offset-1">
													 <input type="number"
														class="form-control" ng-model="evolution.rafEnCasTests"
														name="rafEnCasTests" onclick="this.focus();this.select()"  placeholder="RAF en cas de tests">
													<span class="help-block"> Selectionner RAF en cas de tests</span>
													</div>
													 
											</div>
											
									
										
											<div class="form-group  ">
												<label class="control-label col-md-3" >Avancement</label>
													 <div class="col-md-3">
														 <input type="number"
															class="form-control" ng-model="evolution.avancement"
															name="avancement" onclick="this.focus();this.select()"  min="0" max="100" placeholder="avancement"
															required>
													
									
													</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3"  >Commentaires</label>
												<div class="col-md-6">
													<textarea  id="texbox-commentaires" class="text-box" ng-model="evolution.commentaires" rows="5" cols="72"></textarea>
												</div>
											</div>
											                                         
                                   	 </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button ng-click="update(evolution)"  type="submit" class="btn btn-success">
                                                        <i class="fa fa-check"></i> Valider</button>
                                                    <button ng-click="showEvolsForm()" type="button" class="btn btn-default">Annuler</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <!-- END FORM-->
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                    </div>
                    
                    <div class="row" >
                        <div class="col-md-10" ng-show="showAddEvolutionForm">
                            <!-- BEGIN PORTLET-->
                            <div id="update-form-evolution" class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold uppercase">&nbsp; AJOUTER UNE EVOLUTION</span>
                                    </div>
                                    <div class="actions">
                                    <a class="btn btn-warning btn-outline btn-circle" ng-click="returnHomeFromAddFormEvolution()" >
                                           <i class="fa fa-arrow-left"></i>
                                           <span class="hidden-xs"> Retour</span>
                     				  </a>
                                        
                                  <!-- actions button
                                        <div class="btn-group">
                                            <a class="btn red btn-outline btn-circle btn-sm uppercase sbold" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;"> Option 1</a>
                                                </li>
                                                <li class="divider"> </li>
                                                <li>
                                                    <a href="javascript:;">Option 2</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">Option 3</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">Option 4</a>
                                                </li>
                                            </ul>
                                        </div>
                                   -->
                                    </div>
                                </div>
                                
                          <!-- BEGIN ADD EVOLUTION FORM -->
                                <div class="portlet-body form " >
                                    <!-- BEGIN FORM-->
                                    <form name="evolutionAddForm"  class="form-horizontal form-bordered ">
			                            <div class="form-body " >
				                           
											<div class="form-group">
		                                        <label for="single" class="col-md-3 control-label">Type d'évolution </label>
		                                        <div class="col-md-4">
			                                        <select id="single"  required="required" ng-model="newEvolution.typeEvolution"  ng-options="type as type.type for type in types" class="typeEvolutionAdd form-control">
		                                    		</select>
	                                    		</div>
	                                    		   <div class="col-md-1 ">
												    <a class="btn btn-success" data-target="#stack1" data-toggle="modal"><i class="fa fa-plus"></i> Ajouter une réference</a>
										          </div>
										          
										          
	                                    	</div>	
											<div class="form-group">
                                                <label class="control-label col-md-3">Numéro de Réference</label>
											      <div class="col-md-4">
												     <input  name="referenceEvolution" id="type1" placeholder="REF"
														type="number" 
														class="form-control" required="required">
										          </div>
										        
										     </div>
											<div class="form-group">
                                                <label class="control-label col-md-3">Description</label>
                                                <div class="col-md-8">
												 <input type="text"
													name="description" ng-model="newEvolution.description"
													class="form-control" placeholder="Description" >
												</div>
											</div>
											<div class="form-group">
		                                        <label for="multiple" class="control-label col-md-3">CP Recette</label>
		                                        <div class="col-md-4">
			                                        <select ng-model="newEvolution.cprecettes" class="form-control" multiple>
			                                              <option ng-repeat="cpr in cprs" value="{{cpr}}">{{cpr.ssoId}}</option>
			                                        </select>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label for="single" class="col-md-3 control-label">CPSI </label>
		                                        <div class="col-md-4">
			                                        <select required="required" ng-model="newEvolution.cpsi" class="form-control">
			                                         <option value=""> --- Sélectionner un CP SI ---</option>
														<option ng-repeat="cp in cps" value="{{cp}}" >{{cp.usernameCpsi}}</option>
		                                    		</select>
	                                    		</div>
	                                    		  <div class="col-md-1 ">
												    <a class="btn btn-success" data-target="#stackCpsi" data-toggle="modal"><i class="fa fa-plus"></i> Ajouter un CPSI</a>
										          </div>
	                                    	</div>														
											<div class="form-group">
                                                <label class="control-label col-md-3">Date début</label>
                                                <div class="col-md-3">
                                                    <input ng-model="newEvolution.dateDebutTests" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date début des tests</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Date fin des tests</label>
                                                <div class="col-md-3">
                                                    <input ng-model="newEvolution.dateFinTests" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date fin prévue</span>
                                                </div>
                                                 <div class="col-md-3 col-md-offset-1">
                                                    <input ng-model="newEvolution.dateFinEffective" class="form-control  input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date fin effective</span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Date MEP</label>
                                                <div class="col-md-3">
                                                    <input ng-model="newEvolution.dateMepSouhaitee" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date MEP souhaitée</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3"> Date du cahier de tests </label>
                                                <div class="col-md-3">
                                                    <input ng-model="newEvolution.datePrevuCahier" class="form-control form-control-inline input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date  prévue</span>
                                                </div>
                                                 <div class="col-md-3 col-md-offset-1">
                                                    <input ng-model="newEvolution.dateEffectiveCahier" class="form-control  input-medium date-picker" data-date-format="yyyy-mm-dd" size="16" type="text" value="" />
                                                    <span class="help-block"> Date  effective </span>
                                                </div>
                                            </div>
                                            
                                       		<div class="form-group">
		                                        <label for="single" class="col-md-3 control-label">Etat livraison </label>
		                                        <div class="col-md-4">
			                                        <select id="single"  ng-model="newEvolution.etatLivraison" class="form-control">7
			                                         <option value=""> --- Sélectionner une état ---</option>
														<option ng-repeat="livraison in livraisons" value="{{livraison}}" >{{livraison.etatLivraison}}</option>
		                                    		</select>
	                                    		</div>
	                                    		<div class="col-md-1 ">
												    <a class="btn btn-success" data-target="#stack2" data-toggle="modal"><i class="fa fa-plus"></i> Ajouter une état de livraison</a>
										          </div>
	                                    	</div>	
														
											<div class="form-group">
												<label  class="control-label col-md-3">Charge JH</label>
												<div class="col-md-3">
												 <input  type="number"
													class="form-control" onclick="this.focus();this.select()"  ng-model="newEvolution.chargeJH"
													name="chargeJH" ng-init="newEvolution.chargeJH=0" min="0" max="100" placeholder="chargeJH"
													required >
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3">Nombre de cas de tests  </label>
													<div class="col-md-3">
														 <input type="number"
															class="form-control" ng-model="newEvolution.nombreCasTests"
															name="nombreCasTests" ng-init="newEvolution.nombreCasTests=0"  onclick="this.focus();this.select()"  placeholder="nombreCasTests">
													</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3"> RAF</label> 
												<div class="col-md-3">
												<input type="number" class="form-control"
													ng-model="newEvolution.rafJH" onclick="this.focus();this.select()"  name="rafJH" min="0" max="100"
													placeholder="RAF JH" ng-init="newEvolution.rafJH=0">
													 <span class="help-block"> RAF JH</span>
												</div>
												<div class="col-md-3 col-md-offset-1">
													 <input type="number"
														class="form-control" ng-model="newEvolution.rafEnCasTests"
														name="rafEnCasTests" ng-init="newEvolution.rafEnCasTests=0" onclick="this.focus();this.select()"  placeholder="RAF CAS TEST">
													 <span class="help-block"> RAF en cas de tests</span>
												</div>
													
											</div>
										
											<div class="form-group  ">
												<label class="control-label col-md-3" >Avancement</label>
													 <div class="col-md-3">
														 <input type="number"
															class="form-control" ng-model="newEvolution.avancement"
															name="avancement" ng-init="newEvolution.avancement=0" onclick="this.focus();this.select()"  min="0" max="100" placeholder="avancement"
															required>
													
									
													</div>
											</div>
                                   	 </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button ng-click="saveEvolution()"  type="submit" class="btn btn-success">
                                                        <i class="fa fa-check"></i> Valider</button>
                                                    <button ng-click="returnHomeFromAddFormEvolution()" type="button" class="btn btn-default">Annuler</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div  id="stack1" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Ajouter un nouveau type de réference </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="TypeReferenceForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Type de réference</label>
						                                                <div class="col-md-6">
																		 <input type="text"
																			 ng-model="NewTypeEvolution.type"
																			class="form-control" placeholder="type" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="saveTypeEvolutionAction()" data-dismiss="modal"  type="submit" class="btn btn-success">
						                                                        <i class="fa fa-check"></i> Valider</button>
						                                                    <button data-dismiss="modal" type="button" class="btn btn-default btn-outline">Annuler</button>
						                                                </div>
						                                            </div>
						                                        </div>
						                                        
						                                    </form>
                                                          
                                                        </div>
                                                    </div>
                                                    <!-- 
                                                    <a class="btn green" data-toggle="modal" href="#stack2"> Launch modal </a> -->
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- DEB FORM LIVRAISON -->
                                    
                                     <div  id="stack2" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Ajouter une nouvelle état de livraison </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="livraisonForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Etat de livraison</label>
						                                                <div class="col-md-6">
																		 <input type="text"
																			 ng-model="livraison.etatLivraison"
																			class="form-control" placeholder="Etat livraison" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="saveEtatLivraisonAction()" data-dismiss="modal"  type="submit" class="btn btn-success">
						                                                        <i class="fa fa-check"></i> Valider</button>
						                                                    <button data-dismiss="modal" type="button" class="btn btn-default btn-outline">Annuler</button>
						                                                </div>
						                                            </div>
						                                        </div>
						                                        
						                                    </form>
                                                          
                                                        </div>
                                                    </div>
                                                    <!-- 
                                                    <a class="btn green" data-toggle="modal" href="#stack2"> Launch modal </a> -->
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div  id="stackCpsi" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Ajouter un nouveau CP SI </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="FormCpsiCreation"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Username</label>
						                                                <div class="col-md-6">
																		 <input type="text"
																			 ng-model="NewCpsi.usernameCpsi"
																			class="form-control" placeholder="username" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="saveCpsiAction()" data-dismiss="modal"  type="submit" class="btn btn-success">
						                                                        <i class="fa fa-check"></i> Valider</button>
						                                                    <button data-dismiss="modal" type="button" class="btn btn-default btn-outline">Annuler</button>
						                                                </div>
						                                            </div>
						                                        </div>
						                                        
						                                    </form>
                                                          
                                                        </div>
                                                    </div>
                                                    <!-- 
                                                    <a class="btn green" data-toggle="modal" href="#stack2"> Launch modal </a> -->
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- END FORM LIVRAISON -->
                                    <!-- END FORM-->
                                </div>
                        <!-- END ADD EVOLUTION FORM -->
                            </div>
                            <!-- END PORTLET-->
                        </div>
                    </div>
						<!--<pre>user = {{evolution | json}}</pre>  -->
			</div>

		
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- END PAGE BASE CONTENT -->
			
			
	<!-- END CONTAINER -->
	<!-- BEGIN QUICK SIDEBAR -->

	