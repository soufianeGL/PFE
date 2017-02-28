
	<!-- BEGIN CONTAINER -->
	<div ng-show="showKpis" ng-cloak class="ng-cloak">
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
			
                        <div class="col-md-12" ng-show="formKpi">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold ">KPI 2 : Délai de tests des livrables selon planning convenu</span>
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
                                                        <input ng-model="option" ng-init="option='mois'" type="radio" value="mois" name="option" />
                                                        <span></span>
                                                    </label>
                                                    <label class="mt-radio col-md-3"> Période
                                                        <input ng-model="option" ng-init="option='mois'" type="radio" value="periode" name="option" />
                                                        <span></span>
                                                    </label>
                                                
                                                </div>
                                            </div>
                                            <div class="form-group" ng-show="option=='mois'">
                                                <label class="control-label col-md-3">Mois</label>
                                                <div class="col-md-3">
                                            <select id="select2-single-input-sm" ng-init="optionMois=00" ng-model="optionMois" class="form-control input-sm select2-multiple">
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
                                            <div class="form-group" ng-show="option=='periode'">
                                                <label class="control-label col-md-3">Période</label>
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        	<input  ng-model="optionPeriodeFrom"
																class="form-control form-control-inline input-medium date-picker"
																data-date-format="mm/dd/yyyy" size="20" type="text" value="" /> 
                                                        <span class="input-group-addon"> jusqu'au </span>
                                                       	<input  ng-model="optionPeriodeTo"
																class="form-control form-control-inline input-medium date-picker"
																data-date-format="mm/dd/yyyy" size="20" type="text" value="" /> </div>
                                                    <!-- /input-group -->
                                                    <span class="help-block"> Sélectionner une période </span>
                                                </div>
                                            </div>
                                             <div class="form-actions" ng-show="option=='mois'">
                                                <button type="Valider" ng-click="saveKpi2Mois(option,optionMois)" class="btn btn-success">Valider</button>
                                                <button ng-click="hideKpiForm()" type="button" class="btn btn-default">Annuler</button>
                                                <!-- <button ng-click="clicked=true" type="button" class="btn default">Show Tables</button>  -->
                                                
                                            </div>
                                             <div class="form-actions" ng-show="option=='periode'">
                                                <button type="Valider" ng-click="saveKpi2Periode(option,optionPeriodeFrom,optionPeriodeTo)" class="btn btn-success">Valider</button>
                                                <button ng-click="hideKpiForm()" type="button" class="btn btn-default">Annuler</button>
                                                <!-- <button ng-click="clicked=true" type="button" class="btn default">Show Tables</button>  -->
                                                
                                            </div>
                                            
                                        </div>
                                    </form>
                                    
                                  
                                   
                                </div>
                            </div>
                            <!-- END PORTLET-->
                        </div>
                        
            <div class="row"  ng-show="showTableKpiOK" >
		                <h4 ng-if="kpisOK.length<=0" class="alert alert-danger col-md-5 col-md-offset-3">Aucune évolution valide trouvée </h4>
		            
		                <div class="col-md-12" ng-show="kpisOK.length>0" >
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
		                    <div class="portlet light portlet-fit portlet-datatable bordered">
		                        <div class="portlet-title">
		                         <div class="caption ">
		                                  <i class="fa fa-check-square-o font-green"></i>
		                                    <span class="caption-subject font-green sbold ">Liste des évolutions valides</span>
		                              </div>
		                              
		                            <div class="tools">
		                            <button class="btn btn-default btn-outline btn-circle" ng-click="returnKpiHomePage()"><i class="fa fa-arrow-left"></i> Retour</button>
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
		                                                        <i class="icon-doc"></i> PDF</a>
		                                                </li>
		                                                <li>
		                                                    <a href="evols.xls" data-action="3" class="tool-action">
		                                                        <i class="icon-paper-clip"></i> Excel</a>
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
		
		
		
		                                <th style="min-width: 200px"  ng-click="sort2('refEvolution')">REF
		                                    <i class="fa"
		                                    ng-show="sortKey2=='refEvolution'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                                <th  ng-click="sort2('description')">Description
		                                    <i class="fa"
		                                    ng-show="sortKey2=='description'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                                <th width="60px"  ng-click="sort2('cpsi.usernameCpsi')">CP SI <i class="fa"
		                                    ng-show="sortKey2=='cpsi.usernameCpsi'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                                <th >CP Recette</th>
		                            
		                                <th  ng-click="sort2('dateDebutTests')">Date
		                                    DEB <i class="fa"
		                                    ng-show="sortKey2=='dateDebutTests'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                                <th  ng-click="sort2('dateFinTests')">Date
		                                    FIN PR <i class="fa"
		                                    ng-show="sortKey2=='dateFinTests'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                                <th 
		                                    ng-click="sort2('dateFinEffective')">Date FIN EFF 
		                                    <i class="fa"
		                                    ng-show="sortKey2=='dateFinEffective'"
		                                    ng-class="{'fa-arrow-up':reverse2,'fa-arrow-down':!reverse2}"></i>
		                                </th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                
		                            <tr
		                                dir-paginate="user in kpisOK|orderBy:sortKey2:reverse2|filter:search2|itemsPerPage:nombrePage2" pagination-id="OK">
		                                <td>
		                                <label  class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
		                                    <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"
		                                    ng-model="user.evolutionSelected" ng-true-value=1
		                                    ng-false-value=0
		                                    ng-change="selectionner(user.idEvolution, user.evolutionSelected)">
		                                                 <span></span>
		                               </label>
		                            
		                                </td>
		
		                                <td class="ref-evolution" ><b> <span ng-bind-html="user.refEvolution | highlight:search2" >{{user.refEvolution}}</span></b> <br>
		                                
		                                </td>
		                                <td ng-bind-html="user.description | highlight:search2" >{{user.description}}</td>
		                                <td ng-bind-html="user.cpsi.usernameCpsi | highlight:search2" >{{user.cpsi.usernameCpsi}}</td>
		                                <td ><div
		                                        ng-repeat="cpr in user.cprecettes ">
		                                        <tt  ng-bind-html="cpr.ssoId | highlight:search2" >{{cpr.ssoId}}</tt>
		                                    </div></td>
		
		                                <td >
		                                    {{user.dateDebutTests|date:"dd/MM/yyyy"}}
		                                
		                                    </td>
		                                <td >{{user.dateFinTests|date:"dd/MM/yyyy"}}
		                                    
		                                </td>
		                                    <td >{{user.dateFinEffective|date:"dd/MM/yyyy"}}
		                                    
		                                </td>
		                    
		                    
		
		                            
		                            </tr>
		                        </tbody>
		                    </table>
		                    <dir-pagination-controls max-size="5" direction-links="true"
		                        boundary-links="true" pagination-id="OK"> </dir-pagination-controls>
		                
		                        </div>
		                    
		            
		            
		        </div>
		        
		        <!-- END EXAMPLE TABLE PORTLET-->
		            
		        </div>
		            
                       
                       	
   			</div>
		   
		    <div class="row"  ng-show="showTableKpiKO">
		    
		    	
            <h4 ng-if="kpisKO.length<=0" class="alert alert-danger col-md-5 col-md-offset-3">Aucune évolution non valide trouvée </h4>
    
                <div class="col-md-12" ng-show="kpisKO.length>0">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                         <div class="caption ">
                                  <i class="fa fa-close font-red"></i>
                                    <span class="caption-subject font-red sbold ">Liste des évolutions non valides</span>
                              </div>
                            <div class="tools">
                            <button class="btn btn-default btn-outline btn-circle" ng-click="returnKpiHomePage()">  
                             <i class="fa fa-arrow-left"></i> Retour</button>
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
                                                        <i class="icon-doc"></i> PDF</a>
                                                </li>
                                                <li>
                                                    <a href="evols.xls" data-action="3" class="tool-action">
                                                        <i class="icon-paper-clip"></i> Excel</a>
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
                            

                    <table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
                        id="dataTables-example">
                        <thead class="table-evolution-head">
                            <tr>
                                <th>
                                    <!--<input type="checkbox"
                                    ng-model="model.allItemsSelected" ng-change="selectAll()">  -->
                                </th>



                                <th style="min-width: 200px"  ng-click="sortKpiKo('refEvolution')">Réference
                                    <i class="fa"
                                    ng-show="sortKeyKpiKo=='refEvolution'"
                                    ng-class="{'fa-arrow-up':reverseKpiKo,'fa-arrow-down':!reverseKpiKo}"></i>
                                </th>
                                <th  ng-click="sortKpiKo('description')">Déscription
                                    <i class="fa"
                                    ng-show="sortKeyKpiKo=='description'"
                                    ng-class="{'fa-arrow-up':reverse,'fa-arrow-down':!reverseKpiKo}"></span>
                                </th>
                                <th width="60px"  ng-click="sortKpiKo('cpsi.usernameCpsi')">CP SI <i class="fa"
                                    ng-show="sortKeyKpiKo=='cpsi.usernameCpsi'"
                                    ng-class="{'fa-arrow-up':reverseKpiKo,'fa-arrow-down':!reverseKpiKo}"></i>
                                </th>
                                <th >CP Recette</th>
                                <th  ng-click="sortKpiKo('dateFinTests')">Date
                                    prévue <i class="fa"
                                    ng-show="sortKeyKpiKo=='dateFinTests'"
                                    ng-class="{'fa-arrow-up':reverseKpiKo,'fa-arrow-down':!reverseKpiKo}"></i>
                                </th>
                            
                                <th  ng-click="sortKpiKo('dateDebutTests')">Date
                                    début <i class="fa"
                                    ng-show="sortKeyKpiKo=='dateDebutTests'"
                                    ng-class="{'fa-arrow-up':reverseKpiKo,'fa-arrow-down':!reverseKpiKo}"></i>
                                </th>
                            
                                <th 
                                    ng-click="sortKpiKo('dateFinEffective')">Date fin 
                                    <i class="fa"
                                    ng-show="sortKeyKpiKo=='dateFinEffective'"
                                    ng-class="{'fa-arrow-up':reverseKpiKo,'fa-arrow-down':!reverseKpiKo}"></i>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                
                            <tr
                                dir-paginate="user in kpisKO|orderBy:sortKeyKpiKo:reverseKpiKo|filter:searchKpiKo|itemsPerPage:nombrePageKpiKo" pagination-id="KO">
                                <td>
                                <label  class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"
                                    ng-model="user.evolutionSelected" ng-true-value=1
                                    ng-false-value=0
                                    ng-change="selectionner(user.idEvolution, user.evolutionSelected)">
                                                 <span></span>
                               </label>
                            
                                </td>

                                <td class="ref-evolution" ><b> <span ng-bind-html="user.refEvolution | highlight:nombrePageKpiKo" >{{user.refEvolution}}</span></b> <br>
                                
                                </td>
                                <td ng-bind-html="user.description | highlight:nombrePageKpiKo" >{{user.description}}</td>
                                <td ng-bind-html="user.cpsi.usernameCpsi | highlight:nombrePageKpiKo" >{{user.cpsi.usernameCpsi}}</td>
                                <td ><div
                                        ng-repeat="cpr in user.cprecettes ">
                                        <tt  ng-bind-html="cpr.ssoId | highlight:nombrePageKpiKo" >{{cpr.ssoId}}</tt>
                                    </div></td>
                                <td >{{user.dateFinTests|date:"dd/MM/yyyy"}}
                                    
                                </td>

                                <td >
                                    {{user.dateDebutTests|date:"dd/MM/yyyy"}}
                                
                                    </td>
                                    <td >{{user.dateFinEffective|date:"dd/MM/yyyy"}}
                                    
                                </td>
                    
                    

                            
                            </tr>
                        </tbody>
                    </table>
                    <dir-pagination-controls max-size="5" direction-links="true"
                        boundary-links="true" pagination-id="KO"> </dir-pagination-controls>
                
                        </div>
        
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
            
        </div>
        <div class="portlet-title">
                                
              <div class="actions">
              
                <h5 ng-show='(kpisOK.length/(kpisOK.length + kpisKO.length) * 100)<95' class=" col-md-2 col-md-offset-9 alert alert-danger btn-outline btn-circle"><b>KPI 2 = {{kpisOK.length/(kpisOK.length + kpisKO.length) | percentage:2 }} </b></h5>
                <h5 ng-show='((kpisOK.length/(kpisOK.length + kpisKO.length) * 100)>95)' class=" col-md-2 col-md-offset-9 alert alert-success btn-outline btn-circle"><b>KPI 2 = {{kpisOK.length/(kpisOK.length + kpisKO.length) | percentage:2 }} </b></h5>
              
              </div>
          </div>
    
		    
		    
		    
		    </div>
                    <!--  <div ng-show="clicked==true">aaaaaaaaaa</div> -->
                        
                    
	
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <br>
                   



		
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- END PAGE BASE CONTENT -->
			<div ng-show="showButtonRetourNoResult">
			 <button  ng-if="(kpisKO.length<=0) && (kpisOK.length<=0) " class="col-md-offset-8 btn btn-lg btn-default btn-outline btn-circle" ng-click="returnKpiHomePage()"><i class="fa fa-arrow-left"></i> Retour</button>
			</div>
			<!-- BEGIN FOOTER -->
			
			<!-- END FOOTER -->
		</div>
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN QUICK SIDEBAR -->
	
	