			<sec:authorize
				access="(hasRole('ADMIN')
							or hasRole('CPR') )">
			
			<ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				              	<sec:authorize
										access="(hasRole('ADMIN')) 
											or (hasRole('ADMIN') and hasRole('CPR'))
											or (hasRole('ADMIN') and hasRole('CPR'))">
		                            <li class="nav-item start ">
			                                <a ng-click="showEvolutionAction()" class="nav-link nav-toggle">
			                                    <i class="icon-graph"></i>
			                                    <span class="title">Evolutions</span>
			                                </a>
		                            </li>
		                             <li class="nav-item start ">
			                                <a ng-click="showUsersAction()" class="nav-link nav-toggle">
			                                    <i class="icon-user"></i>
			                                    <span class="title">Utilisateurs</span>
			                                </a>
	                            	</li>
	                            	<li class="nav-item  ">
		                                <a href="javascript:;" class="nav-link nav-toggle">
		                                  <i class="icon-calendar"></i>
		                                    <span class="title">MEP</span>
		                                    <span class="arrow"></span>
		                                </a>
		                               
		                                <ul class="sub-menu">
		                                
		                                   <li class="nav-item  ">
		                                        <a ng-click="showMepAction()" class="nav-link ">
		                                         <i class="icon-plus"></i>
		                                            <span class="title"> Ajouter</span>
		                                        </a>
		                                    </li>
		                                    
		                                    <li class="nav-item  ">
		                                        <a ng-click="showListMepsAction()" class="nav-link ">
		                                        <i class="icon-notebook"></i>
		                                            <span class="title">Lister</span>
		                                        </a>
		                                    </li>
		                       			</ul>
		                       		
		                      		</li>
			                       <li class="nav-item  ">
		                                <a href="javascript:;" class="nav-link nav-toggle">
		                                    <i class="icon-bar-chart"></i>
		                                    <span class="title">KPIs</span>
		                                    <span class="arrow"></span>
		                                </a>
		                                <ul class="sub-menu">
		                               
		                                    <li class="nav-item  ">
		                                        <a ng-click="showKpisAction()" class="nav-link ">
		                                            <span class="title">KPI 2</span>
		                                        </a>
		                                    </li>
		                                    <li class="nav-item  ">
		                                        <a ng-click="showKpis3Action()" class="nav-link ">
		                                            <span class="title">KPI 3</span>
		                                        </a>
		                                    </li>
		                              
		                       			</ul>
		                      		</li>
		                      		<li class="nav-item  ">
		                                <a href="javascript:;" class="nav-link nav-toggle">
		                                    <i class="icon-settings"></i>
		                                    <span class="title">Paramètres</span>
		                                    <span class="arrow"></span>
		                                </a>
		                               
		                                <ul class="sub-menu">
		                                
		                                   <li class="nav-item  ">
		                                        <a ng-click="showCPSIAction()" class="nav-link ">
		                                        <i class="icon-users"></i>
		                                            <span class="title"> CP SI</span>
		                                        </a>
		                                    </li>
		                                    
		                                    <li class="nav-item  ">
		                                        <a ng-click="showTypeEvolutionAction()" class="nav-link ">
		                                         <i class="icon-puzzle"></i>
		                                            <span class="title">Type d'évolution</span>
		                                        </a>
		                                    </li>
		                                     <li class="nav-item  ">
		                                        <a ng-click="showStatutAnomalieAction()" class="nav-link ">
		                                         <i class="icon-info"></i>
		                                            <span class="title">Statut d'anomalie</span>
		                                        </a>
		                                    </li>
		                                    
		                           
	                                       <li class="nav-item  ">
		                                        <a ng-click="showUsineAction()" class="nav-link ">
		                                        <i class="icon-home"></i>
		                                            <span class="title"> Usines</span>
		                                        </a>
		                                    </li>
		                                    <li class="nav-item  ">
		                                        <a ng-click="showLivraisonAction()" class="nav-link ">
		                                         <i class="icon-basket"></i>
		                                            <span class="title"> Livraison</span>
		                                        </a>
		                                    </li>
		                                   
		                       			</ul>
		                       		
		                      		</li>
								</sec:authorize>
                       
                            
                            
                            
                            
		                           
		                            
                            
                            <!-- 
                            <li class="nav-item  ">
                                <a href="javascript:;" class="nav-link nav-toggle">
                                    <i class="icon-puzzle"></i>
                                    <span class="title">Components</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="sub-menu">
                                    <li class="nav-item  ">
                                        <a href="components_date_time_pickers.html" class="nav-link ">
                                            <span class="title">Date & Time Pickers</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_color_pickers.html" class="nav-link ">
                                            <span class="title">Color Pickers</span>
                                            <span class="badge badge-danger">2</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_select2.html" class="nav-link ">
                                            <span class="title">Select2 Dropdowns</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_select.html" class="nav-link ">
                                            <span class="title">Bootstrap Select</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_multi_select.html" class="nav-link ">
                                            <span class="title">Multi Select</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_select_splitter.html" class="nav-link ">
                                            <span class="title">Select Splitter</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_typeahead.html" class="nav-link ">
                                            <span class="title">Typeahead Autocomplete</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_tagsinput.html" class="nav-link ">
                                            <span class="title">Bootstrap Tagsinput</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_switch.html" class="nav-link ">
                                            <span class="title">Bootstrap Switch</span>
                                            <span class="badge badge-success">6</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_maxlength.html" class="nav-link ">
                                            <span class="title">Bootstrap Maxlength</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_fileinput.html" class="nav-link ">
                                            <span class="title">Bootstrap File Input</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_bootstrap_touchspin.html" class="nav-link ">
                                            <span class="title">Bootstrap Touchspin</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_form_tools.html" class="nav-link ">
                                            <span class="title">Form Widgets & Tools</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_context_menu.html" class="nav-link ">
                                            <span class="title">Context Menu</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_editors.html" class="nav-link ">
                                            <span class="title">Markdown & WYSIWYG Editors</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_code_editors.html" class="nav-link ">
                                            <span class="title">Code Editors</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_ion_sliders.html" class="nav-link ">
                                            <span class="title">Ion Range Sliders</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_noui_sliders.html" class="nav-link ">
                                            <span class="title">NoUI Range Sliders</span>
                                        </a>
                                    </li>
                                    <li class="nav-item  ">
                                        <a href="components_knob_dials.html" class="nav-link ">
                                            <span class="title">Knob Circle Dials</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            -->
                            
                        </ul>
                        <!-- END SIDEBAR MENU -->
                     
 </sec:authorize>