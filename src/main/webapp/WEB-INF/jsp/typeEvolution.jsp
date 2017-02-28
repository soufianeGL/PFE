	<!-- BEGIN CONTAINER -->

	<div ng-show="showTypeEvolution" ng-cloak class="ng-cloak">
	
	
			
			<div class="row">
				<div class="col-md-12" >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Types d'évolution
							</div>
						</div>
					</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageTypeEvolution" ng-init="nombrePageTypeEvolution=10">
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                    <option value="40">40</option>
	                                </select></div>
	                                
	                              
	                        </div>
                   </div>
                   <div class="col-md-1">
                    
                   	<button title="ajouter un type d'évolution" class="btn btn-success btn-outline btn-circle"  data-target="#stackTypeAddEvolutionForm" data-toggle="modal"><i class="fa fa-plus"></i></button>
                   </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input onclick="this.focus();this.select()" type="text" ng-model="searchTypeEvolution"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body col-md-8 col-md-offset-2">
							

					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
								<th  width="30%"  ng-click="sortTypeEvolution('id')">ID
									<i class="fa sort-icon"
									ng-show="sortKeyEvol=='id'"
									ng-class="{'fa-arrow-up':reverseTypeEvolution,'fa-arrow-down':!reverseTypeEvolution}"></i>
								</th>
								<th  width="50%" ng-click="sortTypeEvolution('type')">Type
									<span class="fa sort-icon"
									ng-show="sortKeyTypeEvolution=='type'"
									ng-class="{'fa-arrow-up':reverseTypeEvolution,'fa-arrow-down':!reverseTypeEvolution}"></span>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="type in types|orderBy:sortKeyTypeEvolution:reverseTypeEvolution|filter:searchTypeEvolution|itemsPerPage:nombrePageTypeEvolution" pagination-id="TypeEvolution">
								<td>{{type.id}}</td>
								<td>{{type.type}}</td>
								<td>
									<a title="Editer" data-target="#stackTypeEditEvolutionForm" data-toggle="modal" class="btn btn-circle btn-icon-only btn-info"  href="" ng-click="editTypeEvolution(type.id)">
										 <i class="icon-note"></i>
									</a>
									<a title="Supprimer" href="" class="btn btn-circle btn-icon-only btn-danger"  ng-click="supprimerTypeEvolution(type.id)">
										 <i class="icon-trash"></i>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="TypeEvolution"> </dir-pagination-controls>
				
						</div>
					
			
                                    <div  id="stackTypeAddEvolutionForm" class="modal fade" tabindex="-1" data-width="400">
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
																		 <input onclick="this.focus();this.select()" type="text"
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
                                    
                                    
                                    <div  id="stackTypeEditEvolutionForm" class="modal fade" tabindex="-1" data-width="400">
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
						                                                <label class="control-label col-md-4">Type de réference</label>
						                                                <div class="col-md-6">
																		 <input  type="text"
																			 ng-model="EditedType.type"
																			class="form-control" placeholder="type" >
																		</div>
																	</div>
						                                   	 </div>
						                                        <div class="form-actions">
						                                            <div class="row">
						                                                <div class="col-md-offset-3 col-md-9">
						                                                    <button ng-click="updateTypeEvolutionAction(EditedType)" data-dismiss="modal"  type="submit" class="btn btn-success">
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

	