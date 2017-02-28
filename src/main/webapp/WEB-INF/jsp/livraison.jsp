	<!-- BEGIN CONTAINER -->

	<div ng-show="showLivraison" ng-cloak class="ng-cloak">
	
	
			
			<div class="row">
				<div class="col-md-12" >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Livraisons
							</div>
							<div class="tools">
						
							</div>
						</div>
					</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageLivraison" ng-init="nombrePageLivraison=10">
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                    <option value="40">40</option>
	                                </select></div>
	                                
	                              
	                        </div>
                   </div>
                   <div class="col-md-1">
                    
                   	<button class="btn btn-success btn-outline btn-circle"  data-target="#stackLivraisonAddForm" data-toggle="modal"><i class="fa fa-plus"></i></button>
                   </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input onclick="this.focus();this.select()" type="text" ng-model="searchLivraison"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body col-md-8 col-md-offset-2">
							

					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
								<th  width="30%"  ng-click="sortLivraison('id')">ID
									<i class="fa sort-icon"
									ng-show="sortKeyLivraison=='id'"
									ng-class="{'fa-arrow-up':reverseLivraison,'fa-arrow-down':!reverseLivraison}"></i>
								</th>
								<th  width="50%" ng-click="sortLivraison('etatLivraison')">Etat livraison
									<i class="fa sort-icon"
									ng-show="sortKeyLivraison=='etatLivraison'"
									ng-class="{'fa-arrow-up':reverseLivraison,'fa-arrow-down':!reverseLivraison}"></i>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="livraison in livraisons|orderBy:sortKeyLivraison:reverseLivraison|filter:searchLivraison|itemsPerPage:nombrePageLivraison" pagination-id="Livraison">
								<td>{{livraison.id}}</td>
								<td>{{livraison.etatLivraison}}</td>
								<td>
									<a title="Editer" data-target="#stackLivraisonEditForm" class="btn btn-circle btn-icon-only btn-info" data-toggle="modal"  href="" ng-click="editLivraison(livraison.id)">
										<i class="icon-note"></i>
									</a>
									<a title="Supprimer" href="" class="btn btn-circle btn-icon-only btn-danger" ng-click="supprimerLivraison(livraison.id)">
										<i class="icon-trash"></i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="Livraison"> </dir-pagination-controls>
				
						</div>
					
			
                                    <div  id="stackLivraisonAddForm" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button title="ajouter une état de livraison" type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Ajouter un nouveau type de livraison</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="livraisonForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Etat de livraison</label>
						                                                <div class="col-md-6">
																		 <input onclick="this.focus();this.select()" type="text"
																			 ng-model="livraison.etatLivraison"
																			class="form-control" placeholder="Etat de livraison" >
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
                                    
                                    
                                    <div  id="stackLivraisonEditForm" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Modifier un type de réference </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="myForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Etat de livraison</label>
						                                                <div class="col-md-6">
																		 <input type="text"
																			 ng-model="EditedLivraison.etatLivraison"
																			class="form-control" placeholder="Etat de livraison" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="updateLivraisonAction(EditedLivraison)" data-dismiss="modal"  type="submit" class="btn btn-success">
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
			</div>
			
		</div>
	</div>
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <br>
          
						<!--<pre>user = {{evolution | json}}</pre>  -->
			</div>

		
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- END PAGE BASE CONTENT -->
			
			
	<!-- END CONTAINER -->
	<!-- BEGIN QUICK SIDEBAR -->

	