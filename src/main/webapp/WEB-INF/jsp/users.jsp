
	<!-- BEGIN CONTAINER -->
	<div ng-show="showUsers" ng-cloak class="ng-cloak">
		
			<div class="row"  ng-show="showTableUsers">
			
				<div class="col-md-12 " >
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit portlet-datatable bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i> Gestion des utilisateurs
							</div>
							<!--  
							<div class="tools">
							aaa
							</div>
							-->
						</div>
					</div>
					<div class="form-group col-md-3">
					<label class="col-md-4" style="margin-top:8px;">Elements</label>
	                        <div class="col-md-8">
	                            <div class="margin-bottom-10">
	                                <select class="bs-select form-control" data-width="40px" ng-model="nombrePageUser" ng-init="nombrePageUser=10">
	                                    <option value="10">10</option>
	                                    <option value="20">20</option>
	                                    <option value="30">30</option>
	                                    <option value="40">40</option>
	                                </select></div>
	                        </div>
                   </div>
                   <div class="col-md-1">
                    
                   	<button title="ajouter un utilisateur" class="btn btn-success btn-outline btn-circle" ng-click="showAddUserFormAction()"><i class="fa fa-plus"></i></button>
                   </div>
                    <div class="form-group col-md-3 col-md-offset-5">
						<label style="margin-top:8px;" class="col-md-4 ">Recherche</label>
						
						 <div class="col-md-8"> <input type="text" ng-model="searchUser"
							class="form-control" placeholder="Rechercher"></div>
					</div>
				<div id="table-evolution" class="table-responsive col-md-12">
					<div class="portlet-body">
							

					<table class="table table-striped table-bordered table-hover table-hover table-checkable order-column"
						id="dataTables-example">
						<thead class="table-evolution-head">
							<tr>
				   				<th  ng-click="sortUser('lastName')">Nom
									<i class="fa sort-icon"
									ng-show="sortKeyUser=='lastName'"
									ng-class="{'fa-arrow-up':reverseUser,'fa-arrow-down':!reverseUser}"></i>
								</th>
								<th ng-click="sortUser('firstName')">Prénom
									<i class="fa sort-icon"
									ng-show="sortKeyUser=='firstName'"
									ng-class="{'fa-arrow-up':reverseUser,'fa-arrow-down':!reverseUser}"></i>
								</th>
								<th   ng-click="sortUser('ssoId')">Username <i class="fa sort-icon"
									ng-show="sortKeyUser=='ssoId'"
									ng-class="{'fa-arrow-up':reverseUser,'fa-arrow-down':!reverseUser}"></i>
								</th>
								<th   ng-click="sortUser('email')">Email <i class="fa sort-icon"
									ng-show="sortKeyUser=='email'"
									ng-class="{'fa-arrow-up':reverseUser,'fa-arrow-down':!reverseUser}"></i>
								</th>
								<th >Roles</th>
								
								<th  ng-click="sortUser('state')" >Etat <i
									class="fa sort-icon" ng-show="sortKeyUser=='state'"
									ng-class="{'fa-arrow-up':reverseUser,'fa-arrow-down':!reverseUser}"></i>
								</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr
								dir-paginate="utilis in utilisateurs|orderBy:sortKeyUser:reverseUser|filter:searchUser|itemsPerPage:nombrePageUser" pagination-id="users">

							

							<td ng-bind-html="utilis.lastName | highlight:searchUser" >{{utilis.lastName}}</td>
								<td ng-bind-html="utilis.firstName | highlight:searchUser" >{{utilis.firstName}}</td>
								<td ng-bind-html="utilis.ssoId| highlight:searchUser">{{utilis.ssoId}}</td>
							
								<td ng-bind-html="utilis.email| highlight:searchUser">{{utilis.email}}</td>

									<td><div
										ng-repeat="u in utilis.userProfiles ">
										<tt ng-bind-html="u.type| highlight:searchUser">{{u.type}}</tt>
									</div></td>
									
									<td ng-bind-html="utilis.state| highlight:searchUser">{{utilis.state}}</td>
									<td>
										<a title="Editer" class="btn btn-circle btn-icon-only btn-info" href=""
										ng-click="editUser(utilis.id)">
										 <i class="icon-note"></i>
										</a>
										
									</td>
									
							</tr>
						</tbody>
					</table>
					<dir-pagination-controls max-size="5" direction-links="true"
						boundary-links="true" pagination-id="users"> </dir-pagination-controls>
				
						</div>
					
			
			
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
			
		</div>
	</div>
	
	
	
                    <!-- BEGIN PAGE BASE CONTENT -->
                    <br>
                    <div class="row" ng-show='showModifFormUser'>
                        <div class="col-md-9 col-md-offset-1">
                            <!-- BEGIN PORTLET-->
                            <div id="update-form-evolution" class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold uppercase">&nbsp; MODIFICATION D'UN UTILISATEUR</span>
                                    </div>
                                    <div class="actions">
                                     <a class="btn btn-default btn-outline btn-circle" ng-click="HideEditUserFormAction()" >
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
                                     <form action="#" id="form_sample_1" name="formUserModification" class="form-horizontal">
                                        <div class="form-body">
                                         
      
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Profil
                                                </label>
                                                <div class="col-md-5">
                                               	   <select  ng-model="utilisateur.userProfiles" class="form-control" multiple >
			                                            	 <option ng-repeat="up in userProfiles" value="{{up}}">{{up.type}}</option>
			                                        </select>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Nom
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text"  ng-model="utilisateur.lastName" name="lastname"  class="form-control" /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Prénom
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text"  ng-model="utilisateur.firstName" name="firstname" class="form-control" /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Email
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input  name="email" ng-model="utilisateur.email" type="text" class="form-control" /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Username
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input name="username" ng-model="utilisateur.ssoId" type="text" class="form-control" /> </div>
                                            </div>
                                            <div class="form-group">
                                               <label class="control-label col-md-3">Password
                                                   <span class="required"> * </span>
                                               </label>
                                               <div class="col-md-5">
                                                   <input ng-model="utilisateur2.password" ng-init=""  type="password" class="form-control" name="newPassword" id="submit_form_password2" />
                                                   <span class="help-block">Choisir un nouveau password</span>
                                               </div>
                                           </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Confirmer le password
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="password" ng-model="newRpassword" class="form-control" name="newRpassword" />
                                                    <span class="help-block"> Confirmer le password </span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Etat utilisateur
                                                </label>
                                                <div class="col-md-5">
												 <select   class="form-control" 
														 ng-model="utilisateur.state" ng-init="NewUser.state='Active'">
														<option value="">---Sélectionner l'état de l'utilisateur ---</option>
														<option value="Active">Active</option>
														<option value="Inactive">Inactive</option>
													</select>                                                    
                                                </div>
                                            </div>
                       
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button ng-click="updateUser()"  type="Valider" class="btn btn-success">
                                                        <i class="fa fa-check"></i> Valider</button>
                                                    <a ng-click="HideEditUserFormAction()" type="button" class="btn btn-default">Annuler</a>
                                                </div>
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
                        <div class="col-md-9 col-md-offset-1" ng-show="showAddUserForm">
                            <!-- BEGIN PORTLET-->
                            <div  id="update-form-evolution" class="portlet light form-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-pin font-red"></i>
                                        <span class="caption-subject font-red sbold uppercase">&nbsp; AJOUT D'UN UTILISATEUR</span>
                                    </div>
                                    <div class="actions">
                                    <a class="btn btn-default btn-outline btn-circle" ng-click="HideAddUserFormAction()" >
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
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                     <form  id="form_sample_2" name="formUserCreation" class="form-horizontal" method="post">
                                        <div class="form-body">
                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button> Formulaire incorrecte </div>
      
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Profil
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                               	   <select name="profile1"  ng-model="NewUser.userProfiles" class="form-control" multiple >
			                                            	 <option ng-repeat="up in userProfiles" value="{{up}}">{{up.type}}</option>
			                                        </select>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Nom
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text"  ng-model="NewUser.lastName" name="lastname1"  class="form-control" /> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Prénom
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="text"  ng-model="NewUser.firstName" name="firstname1" class="form-control" /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Email
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input  name="email1" ng-model="NewUser.email" type="text" class="form-control" /> </div>
                                            </div>
                                      
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Username
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input name="username1" ng-model="NewUser.ssoId" type="text" class="form-control" /> </div>
                                            </div>
                                     
                                            <div class="form-group">
                                               <label class="control-label col-md-3">Password
                                                   <span class="required"> * </span>
                                               </label>
                                               <div class="col-md-5">
                                                   <input ng-model="NewUser.password" type="password" class="form-control" name="password1" id="submit_form_password1" />
                                                   <span class="help-block">Saisir le password </span>
                                               </div>
                                           </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Confirmer Password
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
                                                    <input type="password" ng-model="rpassword" class="form-control" name="rpassword1" />
                                                    <span class="help-block"> Confirmer le password </span>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Etat utilisateur
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-5">
												 <select  name="etat1" class="form-control" 
														 ng-model="NewUser.state" ng-init="NewUser.state='Active'">
														<option value="">---Sélectionner l'état de l'utilisateur ---</option>
														<option value="Active">Active</option>
														<option value="Inactive">Inactive</option>
													</select>                                                    
                                                </div>
                                            </div>
                                       
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                     <div class="col-md-offset-3 col-md-9">
                                                    <button ng-click="saveUser1()"  type="Valider" class="btn btn-success">
                                                        <i class="fa fa-check"></i> Valider</button>
                                                    <a ng-click="HideAddUserFormAction()" type="button" class="btn btn-default">Annuler</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <!-- END FORM-->
                                </div>
                        <!-- END ADD EVOLUTION FORM -->
                            </div>
                            <!-- END PORTLET-->
                        </div>
                    </div>
						<!--<pre>user = {{evolution | json}}</pre>  -->
           					


		
	
      
                    
                    
                    
                    <!-- END PAGE BASE CONTENT -->
                
			<!-- END PAGE BASE CONTENT -->
			
			<!-- BEGIN FOOTER -->
			
			<!-- END FOOTER -->
		</div>
