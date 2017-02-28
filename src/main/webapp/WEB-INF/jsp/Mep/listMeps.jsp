
<!-- BEGIN CONTAINER -->

<div ng-show="showListMeps" ng-cloak class="ng-cloak">




	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<div class="portlet light portlet-fit portlet-datatable bordered">
				<div class="portlet-title">
					<div class="caption">
								<i class="fa fa-globe"></i> Liste des MEPs
					</div>
				</div>
			</div>
			<div class="form-group col-md-3">
				<label class="col-md-4" style="margin-top: 8px;">Elements</label>
				<div class="col-md-8">
					<div class="margin-bottom-10">
						<select class="bs-select form-control" data-width="40px"
							ng-model="nombrePageMeps" ng-init="nombrePageMeps=10">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-md-1">

			
			</div>
			<div class="form-group col-md-3 col-md-offset-5">
				<label style="margin-top: 8px;" class="col-md-4 ">Recherche</label>

				<div class="col-md-8">
					<input onclick="this.focus();this.select()" type="text"
						ng-model="searchMeps" class="form-control"
						placeholder="Rechercher">
				</div>
			</div>
			<div id="table-evolution" class="table-responsive col-md-12">
				<div class="portlet-body">


					<table
						class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
							
								<th  width="15%"
									ng-click="sortMeps('dateMep')">Date MEP <i
									class="fa sort-icon" ng-show="sortKeyMeps=='dateMep'"
									ng-class="{'fa-arrow-up':reverseMeps,'fa-arrow-down':!reverseMeps}"></i>
								</th>
								<th width="15%"
									ng-click="sortMeps('heureDebut')">Heure début<i
									class="fa sort-icon" ng-show="sortKeyMeps=='heureDebut'"
									ng-class="{'fa-arrow-up':reverseMeps,'fa-arrow-down':!reverseMeps}"></i>
								</th>
								<th width="10%"
									ng-click="sortMeps('heureFin')">Heure Fin<i
									class="fa sort-icon" ng-show="sortKeyMeps=='heureFin'"
									ng-class="{'fa-arrow-up':reverseMeps,'fa-arrow-down':!reverseMeps}"></i>
								</th>
								<th width="10%"
									ng-click="sortMeps('resultat')">Résultat <i
									class="fa sort-icon" ng-show="sortKeyMeps=='resultat'"
									ng-class="{'fa-arrow-up':reverseMeps,'fa-arrow-down':!reverseMeps}"></i>
								</th>
								<th width="10%"
									ng-click="sortMeps('regression')">Régression
									<i class="fa sort-icon"
									ng-show="sortKeyMeps=='regression'"
									ng-class="{'fa-arrow-up':reverseMeps,'fa-arrow-down':!reverseMeps}"></i>
								</th>
								<th width="30%" >Commentaire 
								</th>
							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="mep in meps|orderBy:sortKeyMeps:reverseMeps|filter:searchMeps|itemsPerPage:nombrePageMeps"
								pagination-id="Meps">
								<td class="ref-evolution" ><b>
										<span>{{mep.dateMep |date:"dd/MM/yyyy"}}</span>
								</td>
									
								<td ng-bind-html="mep.heureDebut | highlight:searchMeps"
									>{{mep.heureDebut}}</td>
									
						
								<td ng-bind-html="mep.heureFin | highlight:searchMeps">{{mep.heureFin}}</td>
								
								<td ng-bind-html="mep.resultat| highlight:searchMeps"
									>{{mep.resultat}}</td>
									
								<td><i class="fa"  ng-class="{ 'fa-check' : mep.regression==1}" ></i>
								</td>
								<td ng-bind-html="mep.commentaire| highlight:searchMeps"
									>{{mep.commentaire}}</td>
								<td>
								
									 <a title="Voir la mep" ng-click="showMepDetails(mep.idMep);sendMgen(mep.dateMep);sendDS(mep.dateMep)" data-toggle="modal" href="#long" class="btn btn-circle btn-icon-only btn-primary" href="javascript:;">
                                           <i class="fa fa-eye" aria-hidden="true"></i>
                                     </a>
								    <a title="Editer" ng-click="editMep(mep.idMep)" class="btn btn-circle btn-icon-only btn-info" href="javascript:;">
                                           <i class="icon-note"></i>
                                     </a>
                                     
								</td>

					</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="Meps">
					</dir-pagination-controls>

				</div>

			</div>
			<!-- END EXAMPLE TABLE PORTLET-->
			
			 <div  id="long" class="modal fade modal-scroll" tabindex="-1" data-replace="true">
                     <div class="modal-dialog">
                     
                         <div class="modal-content">
                             <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                 <h4 class="modal-title">Bilan de la MEP &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a title="Imprimer la MEP" ng-click="dowloandPdfMep()" class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                            <i class="fa fa-print" aria-hidden="true"></i>
                                        </a>
                                 
                                 </h4>
                                
                             </div>
                             <div class="modal-body" id="mep-details">
                             
                             
                             <!-- MEP -->
		                       <div class="panel panel-primary">
		                            <div class="panel-heading">
		                                <h3 class="panel-title">MEP</h3>
		                            </div>
		                            <div class="panel-body"> 
		                            	<div class="col-md-4"><b>Date MEP</b> :</div>
		                            	<div class="col-md-4 col-md-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{showedMep.dateMep |date:"dd/MM/yyyy"}}</div><br><br>
		                            	
		                            	<div class="col-md-4"><b>Heure Début</b> : </div>
		                            	<div class="col-md-3 col-md-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{showedMep.heureDebut}}</div><br><br>
		                            	
		                            	<div class="col-md-4"><b>Heure Fin </b> :</div>
		                            	<div class="col-md-3 col-md-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{showedMep.heureFin}}</div><br><br>
		                            	
		                            	<div class="col-md-4"><b>Astreintes</b> :</div>
		                            	<div class="col-md-4 col-md-2">
		                            		<ul ng-repeat="cpr2 in showedMep.astreinte">
		                            			<tt>{{cpr2.ssoId}}</tt>
		                            		</ul>
		                            	</div><br><br>
		                            </div>
		                        </div>
		                        <!-- END MEP -->
		                        
		                        <!-- MEP -->
		                       <div class="panel panel-primary">
		                            <div class="panel-heading">
		                                <h3 class="panel-title">Détails</h3>
		                            </div>
		                            <div class="panel-body"> 
		                            <div class="col-md-4"><b>Usines impactées</b> :</div>
		                            	<div class="col-md-4 col-md-2">
		                            		<ul ng-repeat="usineImp in showedMep.usineImpactes">
		                            			<tt>{{usineImp.nomUsine}}</tt>
		                            		</ul>
		                            	</div><br><br>
		                            	<div class="row">
								            <div class="col-md-3 col-md-offset-5"><b>Résultat</b> :</div>
			                            	<div class="col-md-4" >{{showedMep.resultat}}</div>
		                            	</div>
		                            	<br>
		                       			<div class="row">
								            <div class="col-md-3 col-md-offset-5"><b>Régression</b> :</div>
			                            	<div style="color:red" class="col-md-1" ng-show="showedMep.regression==1" >OUI</div>
			                            	<div style="color:green" ng-show="showedMep.regression==0" >NON</div><br><br>
		                            	</div>
		                            	
		                            	<div class="col-md-4"><b>Commentaire </b> :</div>
		                            	<div class="col-md-8">{{showedMep.commentaire}}</div><br><br>
		                            	
		                            	
		                            
		                            </div>
		                        </div>
		                        <!-- END MEP -->
		                       
		                        
                             </div>
                             <div class="modal-footer">
                                 <button type="button" data-dismiss="modal" class="btn dark btn-outline">Fermer</button>
                             </div>
                         </div>
                     </div>
              </div>
		</div>
	</div>
</div>

