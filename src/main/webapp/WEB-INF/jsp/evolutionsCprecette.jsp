
	<!-- BEGIN CONTAINER -->
	<div ng-show="showEvolutionCPR" class="container-fluid" ng-cloak class="ng-cloak">
		<div class="page-content page-content-popup">
			
			<div class="page-sidebar-wrapper">
				<!-- BEGIN SIDEBAR -->
				<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
				<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
				<!-- END SIDEBAR -->
			</div>

			<!-- BEGIN PAGE BASE CONTENT -->
			<!-- 
                    <div class="m-heading-1 border-green m-bordered">
                        <h3>DataTables Rowreorder Extension</h3>
                        <p> RowReorder adds the ability for rows in a DataTable to be reordered through user interaction with the table (click and drag / touch and drag). </p>
                        <p> For more info please check out
                            <a class="btn red btn-outline" href="http://datatables.net/extensions/rowreorder" target="_blank">the official documentation</a>
                        </p>
                    </div>
                     -->
			<div class="row" >
			
		
			
				<div class="col-md-12" >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Table des évolutions
							</div>
							<div class="tools">
							<div class="btn-group">
                                            <a class="btn red btn-outline btn-circle" href="javascript:;" data-toggle="dropdown">
                                                <i class="fa fa-share"></i>
                                                <span class="hidden-xs"> Exporter</span>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right" id="sample_3_tools">
                                                <li>
                                                    <a class="btn red btn-outline sbold" data-toggle="modal" href="" ng-click="saveChexboxesColumns()" data-action="0" class="tool-action">
                                                           Sauvegarder</a>
                                                </li>
                                                  <li class="divider"> </li>
                                                <li>
                                                    <a href="evols.pdf" target="_blank" data-action="2" class="tool-action">
                                                        <i class="fa fa-file-pdf-o"></i> PDF</a>
                                                </li>
                                                <li>
                                                    <a href="evols.xls" data-action="3" class="tool-action">
                                                        <i class="fa fa-file-excel-o"></i> Excel</a>
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
                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageCPR" ng-init="nombrePageCPR=10">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                </select></div>
                        </div>
                    </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input type="text" ng-model="searchCPR"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body">
							

					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example" pagination-id="EvolsCPR">
						<thead class="table-evolution-head">
							<tr>
								<th>
									<!--<input type="checkbox"
									ng-model="model.allItemsSelected" ng-change="selectAll()">  -->
								</th>



								<th style="min-width: 200px" ng-show="themen[0].checked" ng-click="sortCPR('refEvolution')">Réference
									<i class="fa"
									ng-show="sortKeyCPR=='refEvolution'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[1].checked" ng-click="sortCPR('description')">Description
									<i class="fa"
									ng-show="sortKeyCPR=='description'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th width="60px" ng-show="themen[2].checked" ng-click="sortCPR('cpsi.username')">CP SI <i class="fa"
									ng-show="sortKeyCPR=='cpsi.username'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[3].checked">CP Recette</th>
								<th ng-show="themen[4].checked"
									ng-click="sortCPR('etatLivraison')">Etat Livraison 
									<i class="fa" ng-show="sortKeyCPR=='etatLivraison'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>


								<th ng-show="themen[5].checked" ng-click="sortCPR('dateMepSouhaitee')">Date
									MEP <i class="fa"
									ng-show="sortKeyCPR=='dateMepSouhaitee'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[6].checked" ng-click="sortCPR('dateDebutTests')">Date
									DEB <i class="fa"
									ng-show="sortKeyCPR=='dateDebutTests'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[7].checked" ng-click="sortCPR('dateFinTests')">Date
									FIN PR <i class="fa"
									ng-show="sortKeyCPR=='dateFinTests'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th  ng-show="themen[8].checked"
									ng-click="sortCPR('dateFinEffective')">Date FIN EFF 
									<i class="fa"
									ng-show="sortKeyCPR=='dateFinEffective'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[9].checked"
									ng-click="sortCPR('datePrevuCahier')">Date Test PR
									 <i class="fa"
									ng-show="sortKeyCPR=='datePrevuCahier'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[10].checked"
									ng-click="sortCPR('dateEffectiveCahier')">Date Test EFF
									 <i class="fa"
									ng-show="sortKeyCPR=='dateEffectiveCahier'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th width="120px" ng-show="themen[11].checked" ng-click="sortCPR('avancement')">% OK
									<i class="fa"
									ng-show="sortKeyCPR=='avancement'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th width="120px" ng-show="themen[11].checked" ng-click="sortCPR('koPourcentage')">% KO
									<i class="fa"
									ng-show="sortKeyCPR=='koPourcentage'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
							
								<th ng-show="themen[12].checked">Commentaires</th>
								<th ng-show="themen[13].checked" ng-click="sortCPR('chargeJH')">Charge
									JH <i class="fa"
									ng-show="sortKeyCPR=='chargeJH'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[14].checked" ng-click="sortCPR('rafJH')">RAF JH 
								<i class="fa" ng-show="sortKeyCPR=='rafJH'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[15].checked"
									ng-click="sortCPR('nombreCasTests')">Nbre Cas tests  
									<i class="fa" ng-show="sortKeyCPR=='nombreCasTests'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								<th ng-show="themen[16].checked" ng-click="sortCPR('rafEnCasTests')"> RAF
									Cas Test <i class="fa"
									ng-show="sortKeyCPR=='rafEnCasTests'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>

								<th ng-click="sortCPR('etatRecette')">Etat Recette
								 <i class="fa" ng-show="sortKeyCPR=='etatRecette'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								</th>
								
								<th ng-click="sortCPR('updated')">Modifié le
								<i class="fa" ng-show="sortKeyCPR=='updated'"
									ng-class="{'fa-arrow-up':reverseCPR,'fa-arrow-down':!reverseCPR}"></i>
								
								 </th>

							</tr>
						</thead>
						<tbody>
				
							<tr
								dir-paginate="user in users|orderBy:sortKeyCPR:reverseCPR|filter:searchCPR|itemsPerPage:nombrePageCPR" pagination-id="EvolsCPR">
								<td>
								<label  class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
									<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"
									ng-model="user.evolutionSelected" ng-true-value=1
									ng-false-value=0
									ng-change="selectionner(user.idEvolution, user.evolutionSelected)">
                                                 <span></span>
                               </label>
							
								</td>

								<td class="ref-evolution" ng-show="themen[0].checked"> <span ng-bind-html="user.refEvolution | highlight:searchCPR" >{{user.refEvolution}}</span> <br>
								 <a class="link-inwi"  ng-click="LoadAudit($index,user.idEvolution)"><img alt="" src="images/plus_hist.png"></a>
								<a class="link-inwi" ng-click="showacceptation[$index]=false"><img alt="" src="images/minus.png"></a>
								
								<br> <br>
									 <span ng-show="showacceptation[$index]" >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.1.username|uppercase}} le {{a.1.timestamp |date:"dd/MM/yyyy"}} : {{a.2}}  <br></span>
									</span>
								
								</td>
								<td ng-bind-html="user.description | highlight:searchCPR" ng-show="themen[1].checked">{{user.description}}</td>
								<td ng-bind-html="user.cpsi.username | highlight:searchCPR" ng-show="themen[2].checked">{{user.cpsi.username}}</td>
								<td ng-show="themen[3].checked"><div
										ng-repeat="cpr in user.cprecettes ">
										<tt  ng-bind-html="cpr.ssoId | highlight:searchCPR" >{{cpr.ssoId}}</tt>
									</div></td>
								<td ng-show="themen[4].checked">{{user.etatLivraison.livraison}}</td>

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
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.dateDebutTests |date:"dd/MM/yyyy"}} <br></span>
									</span>
									</td>
								<td ng-show="themen[7].checked">{{user.dateFinTests|date:"dd/MM/yyyy"}}
									<br> <br> <br>
									 <span ng-show="showacceptation[$index]"  >
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
											style="width: {{user.avancement}}%"><a class="link-white" href="#"
												editable-number="user.avancement">{{user.avancement}}%</a></div>
									
									</div> 
									<div ng-if="user.avancement <75 && user.avancement >20 " class="progress">
										<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
											aria-valuenow="user.avancement" aria-valuemin="0" aria-valuemax="100"
											style="width: {{user.avancement}}%"><a class="link-white" href="#"
												editable-number="user.avancement">{{user.avancement}}%</a></div>
									</div> 
									
										<div ng-show="user.avancement <=20"  class="progress">
										<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
											aria-valuenow="user.avancement" aria-valuemin="0" aria-valuemax="100"
											style="color:#48225c; width: {{user.avancement}}%"></div>
												<a href="#"
												editable-number="user.avancement">{{user.avancement}}%</a>
									</div> 
									<div  class="avancement-space">
										 <span class="historique" ng-show="showacceptation[$index]"  >
										
										  <span class="historique" ng-repeat="a in EvolutionAudit" >
										  
										       {{a.0.avancement}} <br></span>
										</span>
									</div>
								</td>
							
								<td ng-show="themen[11].checked">
									<div ng-if="user.koPourcentage >=75 " class="progress span-avancement">
										<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
											aria-valuenow="user.koPourcentage" aria-valuemin="0" aria-valuemax="100"
											style="width: {{user.koPourcentage}}%"><a class="link-white" href="#"
												editable-number="user.koPourcentage">{{user.koPourcentage}}%</a></div>
									
									</div> 
									<div ng-if="user.koPourcentage <75 && user.koPourcentage >20 " class="progress">
										<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
											aria-valuenow="user.koPourcentage" aria-valuemin="0" aria-valuemax="100"
											style="width: {{user.koPourcentage}}%"><a class="link-white" href="#"
												editable-number="user.koPourcentage">{{user.koPourcentage}}%</a></div>
									</div> 
									
										<div ng-show="user.koPourcentage <=20"  class="progress">
										<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
											aria-valuenow="user.koPourcentage" aria-valuemin="0" aria-valuemax="100"
											style="color:#48225c; width: {{user.koPourcentage}}%"></div>
												<a  href="#"
												editable-number="user.koPourcentage">{{user.koPourcentage}}%</a>
									</div> 
								
								</td>
								<td ng-show="themen[12].checked">
								<a href="#" editable-textarea="user.commentaires">{{ user.commentaires || 'vide'}}</a>
								</td>
								<td ng-show="themen[13].checked">{{user.chargeJH}}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									       {{a.0.chargeJH}} <br></span>
									</span>
								</td>
								<td ng-show="themen[14].checked"><a href="#"
									editable-number="user.rafJH"  >{{user.rafJH }}</a>
								<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									       {{a.0.rafJH}} <br></span>
									</span>
								</td>
								<!-- e-style="width: 120px" -->
								<td ng-show="themen[15].checked">{{user.nombreCasTests }}
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.nombreCasTests}} <br></span>
									</span>
								</td>
								<td ng-show="themen[16].checked"><a href="#"
									editable-number="user.rafEnCasTests">{{user.rafEnCasTests}}</a>
									<br> <br> <br>
									 <span class="historique" ng-show="showacceptation[$index]"  >
									
									  <span class="historique" ng-repeat="a in EvolutionAudit" >
									  
									       {{a.0.rafEnCasTests}} <br></span>
									</span>
								</td>
								<td
									ng-class="{jaune : user.etatRecette=='MAUVAISE', vert: user.etatRecette=='BONNE', rouge: user.etatRecette=='CRITIQUE'}"></td>
									
								<td >{{user.updated|date:"dd/MM/yyyy HH:mm:ss"}}
								
								</td>
								
									<td><a class="btn btn-default" href=""
									ng-click="save(user.idEvolution, user.avancement,user.koPourcentage, user.rafJH, user.rafEnCasTests, user.commentaires)"><img alt="not found" src="images/valid.png">&nbsp; Valider</a></td>
									
							
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="EvolsCPR"> </dir-pagination-controls>
				
						</div>
					
			
			
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
			
		</div>
	</div>
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    
                    
                    
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- END PAGE BASE CONTENT -->
			
			<!-- BEGIN FOOTER -->
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
			<!-- END FOOTER -->
		</div>
		
		<!-- END CONTAINER -->
	<!-- BEGIN QUICK SIDEBAR -->
	
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
						<br>
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
					
						<br><br>
					
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
	</div>
	