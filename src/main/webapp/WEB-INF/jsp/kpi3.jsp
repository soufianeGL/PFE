
	<!-- BEGIN CONTAINER -->
	<div ng-show="showKpis3" ng-cloak class="ng-cloak">
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
			
                        <div class="col-md-12" ng-show="formKpi3">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold ">KPI 3 : Nombre de régressions critiques détectées Post TNR MEP</span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form class="form-horizontal form-bordered" method="POST">
                                        <div class="form-body">
                                            
                                            <div class="form-group">
                                           
                                                <div >
                                                    <h4>Choisir une option </h4>
                                                
                                                </div>
                                            </div>
                                           <div class="form-group">
                                           
                                                <div class="mt-radio-list">
                                                    <label class="mt-radio col-md-3 col-md-offset-3 "> Mois
                                                        <input ng-model="option2" ng-init="option='mois'" type="radio" value="mois" />
                                                        <span></span>
                                                    </label>
                                                    <label class="mt-radio col-md-3"> Période
                                                        <input ng-model="option2" ng-init="option2='mois'" type="radio" value="periode" />
                                                        <span></span>
                                                    </label>
                                                
                                                </div>
                                            </div>
                                            <div class="form-group" ng-show="option2=='mois'">
                                                <label class="control-label col-md-3">Mois</label>
                                                <div class="col-md-3">
                                            <select  ng-init="optionMois2=00" ng-model="optionMois2" class="form-control input-sm">
                                                <optgroup label="Sélectionner un mois "> 
                                                    <option value="00">Janvier</option>
                                                    <option value="01">Février</option>
                                                    <option value="02">Mars</option>
                                                    <option value="03">Avril</option>
                                                    <option value="04">Mai</option>
                                                    <option value="05">Juin</option>
                                                    <option value="06">Juillet</option>
                                                    <option value="07">Août</option>
                                                    <option value="08">Septembre</option>
                                                    <option value="09">Octobre</option>
                                                    <option value="10">Novembre</option>
                                                    <option value="11">Décembre</option>
                                                </optgroup>
                                            </select>
                                              <span class="help-block"> Sélectionner un mois </span>
                                        </div>
                                            </div>
                                            <div class="form-group" ng-show="option2=='periode'">
                                                <label class="control-label col-md-3">Période</label>
                                                <div class="col-md-4">
                                                    <div class="input-group " >
                                                        	<input  ng-model="optionPeriodeFrom2"
																class="form-control form-control-inline input-medium date-picker"
																data-date-format="mm/dd/yyyy" size="20" type="text" value="" />
                                                        <span class="input-group-addon"> jusqu'au </span>
                                                        	<input  ng-model="optionPeriodeTo2"
																class="form-control form-control-inline input-medium date-picker"
																data-date-format="mm/dd/yyyy" size="20" type="text" value="" /></div>
                                                    <!-- /input-group -->
                                                    <span class="help-block"> Sélectionner une période </span>
                                                </div>
                                            </div>
                                             <div class="form-actions" ng-show="option2=='mois'">
                                                <button type="Valider" ng-click="saveKpi3Mois(option2,optionMois2)" class="btn btn-success">Valider</button>
                                                <button ng-click="hideKpi3Form()" type="button" class="btn btn-default">Annuler</button>
                                                <!-- <button ng-click="clicked=true" type="button" class="btn default">Show Tables</button>  -->
                                                
                                            </div>
                                             <div class="form-actions" ng-show="option2=='periode'">
                                                <button type="Valider" ng-click="saveKpi3Periode(option2,optionPeriodeFrom2,optionPeriodeTo2)" class="btn btn-success">Valider</button>
                                                <button ng-click="hideKpi3Form()" type="button" class="btn btn-default">Annuler</button>
                                                <!-- <button ng-click="clicked=true" type="button" class="btn default">Show Tables</button>  -->
                                                
                                            </div>
                                            
                                        </div>
                                    </form>
                                    
                                  
                                   
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        
            <div class="row"  ng-show="showTableKpi3OK" >
		                <h4 ng-if="kpis3OK.length<=0" class="alert alert-danger col-md-5 col-md-offset-3">Aucune MEP sans régression trouvée </h4>
		            
		                <div class="col-md-12" ng-show="kpis3OK.length>0" >
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <div class="portlet light portlet-fit portlet-datatable bordered">
		                        <div class="portlet-title">
		                         <div class="caption ">
		                                  <i class="fa fa-check-square-o font-green"></i>
		                                    <span class="caption-subject font-green sbold ">Liste des MEPs sans régression</span>
		                              </div>
		                              
		                            <div class="tools">
		                            <button class="btn btn-default btn-outline btn-circle" ng-click="returnKpi3HomePage()"><i class="fa fa-arrow-left"></i> Retour</button>
		                            </div>
		                        </div>
		                    </div>
		                <div class="form-group col-md-3">
		                <label class="col-md-4" style="margin-top:8px;">Elements</label>
		                        <div class="col-md-8">
		                            <div class="margin-bottom-10">
		                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePage2" ng-init="nombrePage2=10">
		                                    <option value="10">10</option>
		                                    <option value="20">20</option>
		                                    <option value="30">30</option>
		                                    <option value="40">40</option>
		                                </select></div>
		                        </div>
		                    </div>
		                    <div class="form-group col-md-3 col-md-offset-6">
		                        <label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
		                        
		                         <div class="col-md-8"> <input type="text" ng-model="search2"
		                            class="form-control" placeholder="Rechercher"></div>
		                    </div>
		                <div  class="table-responsive col-md-12">
		                    <div class="portlet-body">
		               <table
						class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
							
								<th  width="15%"
									>Date MEP 
								</th>
								<th width="15%"
									>Heure début
								</th>
								<th width="10%"
									>Heure Fin
								</th>
								<th width="10%"
									>Résultat 
								</th>
								<th width="10%"
									>Régression
						
								</th>
								<th width="30%" >Commentaire 
								</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="mep in kpis3OK">
								<td class="ref-evolution" ><b>
										<span>{{mep.dateMep |date:"dd/MM/yyyy"}}</span>
								</td>
									
								<td
									>{{mep.heureDebut}}</td>
									
						
								<td >{{mep.heureFin}}</td>
								
								<td ng-bind-html="mep.resultat| highlight:searchMeps"
									>{{mep.resultat}}</td>
									
								<td><i class="fa"  ng-class="{ 'fa-check' : mep.regression==1}" ></i>
								</td>
								<td >{{mep.commentaire}}</td>

					</tbody>
					</table>
			
		                        </div>
		                    
		            
		            
		        </div>
		        
		        <!-- END EXAMPLE TABLE PORTLET-->
		            
		        </div>
		            
                       
                       	
   			</div>
		   
		    <div class="row"  ng-show="showTableKpi3KO">
		    
		    	
            <h4 ng-if="kpis3KO.length<=0" class="alert alert-danger col-md-5 col-md-offset-3">Aucune MEP avec régression trouvée </h4>
    
                <div class="col-md-12" ng-show="kpis3KO.length>0">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                         <div class="caption ">
                                  <i class="fa fa-close font-red"></i>
                                    <span class="caption-subject font-red sbold ">Liste des MEPs avec régression</span>
                              </div>
                            <div class="tools">
                            <button class="btn btn-default btn-outline btn-circle" ng-click="returnKpi3HomePage()">  
                             <i class="fa fa-arrow-left"></i> Retour</button>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                    <label class="col-md-4" style="margin-top:8px;">Elements</label>
                        <div class="col-md-8">
                            <div class="margin-bottom-10">
                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageKpiKo" ng-init="nombrePageKpiKo=10">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                </select></div>
                        </div>
                    </div>
                    <div class="form-group col-md-3 col-md-offset-6">
                        <label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
                        
                         <div class="col-md-8"> <input type="text" ng-model="searchKpiKo"
                            class="form-control" placeholder="Rechercher"></div>
                    </div>
                <div id="table-evolution" class="table-responsive col-md-12">
                    <div class="portlet-body">
                            

                   <table
						class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
							
								<th  width="15%"
								>Date ME
								</th>
								<th width="15%"
									>Heure début
								</th>
								<th width="10%"
									>Heure Fin
								</th>
								<th width="10%"
									>Résultat 
								</th>
								<th width="10%"
									>Régression
								</th>
								<th width="30%" >Commentaire 
								</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="mep in kpis3KO" >
								<td  ><b>
										<span>{{mep.dateMep |date:"dd/MM/yyyy"}}</span>
								</td>
									
								<td
									>{{mep.heureDebut}}</td>
									
						
								<td >{{mep.heureFin}}</td>
								
								<td 
									>{{mep.resultat}}</td>
									
								<td><i class="fa"  ng-class="{ 'fa-check' : mep.regression==1}" ></i>
								</td>
								<td 
									>{{mep.commentaire}}</td>

					</tbody>
				</table>
		  </div>
        
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
            
        </div>
       
    
		    
		    
		    
		    </div>
                    <!--  <div ng-show="clicked==true">aaaaaaaaaa</div> -->
                        
                    
	
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <br>
                   



		
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- BEGIN FOOTER -->
			<div ng-show="showButtonRetourNoResult2">
			 <button  ng-if="(kpis3KO.length<=0) && (kpis3OK.length<=0) " class="col-md-offset-8 btn btn-lg btn-default btn-outline btn-circle" ng-click="returnKpi3HomePage()"><i class="fa fa-arrow-left"></i> Retour</button>
			</div>
			<!-- END FOOTER -->
		</div>
		 <div class="portlet-title">
                                
              <div class="actions">
              
                <h5 ng-show='(kpis3OK.length/(kpis3OK.length + kpis3KO.length) * 100)<95' class=" col-md-2 col-md-offset-9 alert alert-danger btn-outline btn-circle"><b>KPI 3 = {{kpis3OK.length/(kpis3OK.length + kpis3KO.length) | percentage:2 }} </b></h5>
                <h5 ng-show='((kpis3OK.length/(kpis3OK.length + kpis3KO.length) * 100)>95)' class=" col-md-2 col-md-offset-9 alert alert-success btn-outline btn-circle"><b>KPI 3 = {{kpis3OK.length/(kpis3OK.length + kpis3KO.length) | percentage:2 }} </b></h5>
              
              </div>
          </div>
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN QUICK SIDEBAR -->
	
	</div>