	<!-- BEGIN CONTAINER -->

	<div ng-show="showUsine" ng-cloak class="ng-cloak">
	
	
			
			<div class="row">
				<div class="col-md-12" >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Usines
							</div>
							<div class="tools">
							</div>
						</div>
					</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageUsine" ng-init="nombrePageUsine=5">
	                                    <option value="5">5</option>
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                </select></div>
	                                
	                              
	                        </div>
                   </div>
                   <div class="col-md-1">
                    
                   	<button  title="ajouter une usine" class="btn btn-success btn-outline btn-circle"  data-target="#stackUsineAddForm" data-toggle="modal"><i class="fa fa-plus"></i></button>
                   </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input onclick="this.focus();this.select()" type="text" ng-model="searchUsine"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body col-md-8 col-md-offset-2">
							
					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
								<th   width="30%" ng-click="sortUsine('id')">ID
									<i class="fa sort-icon"
									ng-show="sortKeyUsine=='id'"
									ng-class="{'fa-arrow-up':reverseUsine,'fa-arrow-down':!reverseUsine}"></i>
								</th>
								<th  width="50%" ng-click="sortUsine('etatUsine')">Usine
									<i class="fa sort-icon"
									ng-show="sortKeyUsine=='etatUsine'"
									ng-class="{'fa-arrow-up':reverseUsine,'fa-arrow-down':!reverseUsine}"></i>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="usine in usines|orderBy:sortKeyUsine:reverseUsine|filter:searchUsine|itemsPerPage:nombrePageUsine" pagination-id="Usine">
								<td>{{usine.idUsine}}</td>
								<td>{{usine.nomUsine}}</td>
								<td>
									<a title="Editer" data-target="#stackUsineEditForm" class="btn btn-circle btn-icon-only btn-info" data-toggle="modal"  href="" ng-click="editUsine(usine.idUsine)">
 										<i class="icon-note"></i>
									</a>
									<a title="Supprimer" href="" class="btn btn-circle btn-icon-only btn-danger"  ng-click="supprimerUsine(usine.idUsine)">
										 <i class="icon-trash"></i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="Usine"> </dir-pagination-controls>
				
						</div>
					
			
                                    <div  id="stackUsineAddForm" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Ajouter une nouvelle de Usine</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="UsineForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Nom de Usine</label>
						                                                <div class="col-md-6">
																		 <input onclick="this.focus();this.select()" type="text"
																			 ng-model="NewUsine.nomUsine"
																			class="form-control" placeholder="choisir un nom" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="saveUsineAction()" data-dismiss="modal"  type="submit" class="btn btn-success">
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
                                    
                                    
                                    <div  id="stackUsineEditForm" class="modal fade" tabindex="-1" data-width="400">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Modifier une usine  </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-10">
                                                            <form name="myForm"  class="form-horizontal form-bordered">
									                            <div class="form-body">
																	<div class="form-group">
						                                                <label class="control-label col-md-4">Nom de l'usine</label>
						                                                <div class="col-md-6">
																		 <input type="text"
																			 ng-model="EditedUsine.nomUsine"
																			class="form-control" placeholder="choisir un nom" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="updateUsineAction(EditedUsine)" data-dismiss="modal"  type="submit" class="btn btn-success">
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

	