var app = angular.module('angularTable', [
		'angularUtils.directives.dirPagination','xeditable', 'ngRoute',"checklist-model"]);

app.run(function(editableOptions) {
	editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2',
	// 'default'
});



app.directive('capitalize', function() {
	return {
		require : 'ngModel',
		link : function(scope, element, attrs, modelCtrl) {
			var capitalize = function(inputValue) {
				if (inputValue == undefined)
					inputValue = '';
				var capitalized = inputValue.toUpperCase();
				if (capitalized !== inputValue) {
					modelCtrl.$setViewValue(capitalized);
					modelCtrl.$render();
				}
				return capitalized;
			}
			modelCtrl.$parsers.push(capitalize);
			capitalize(scope[attrs.ngModel]); // capitalize initial value
		}
	};
});



// to highlight search text
app.filter('highlight', function($sce) {
	return function(text, phrase) {
		if (phrase)
			text = text.replace(new RegExp('(' + phrase + ')', 'gi'),
					'<span class="highlighted">$1</span>')

		return $sce.trustAsHtml(text)
	}
});

app.filter('byTypeEvolution', function () {
    return function (users, refEvolution) {
        var items = {
            refEvolution: refEvolution,
            out: []
        };
        angular.forEach(users, function (value, key) {
            if (this.refEvolution[value.refEvolution] === true) {
                this.out.push(value);
            }
        }, items);
        return items.out;
    };
});

/**
 * Pourcetage filter
 */
app.filter('percentage',['$filter',function($filter){
	return function(input,decimal){
		return $filter('number')(input*100,decimal)+'%';
	};
}]);

app
		.controller(
				'listdata',
				function($scope,$route, $http, $timeout, $filter,$window,$anchorScroll,$location) {
					$scope.cprs = [];
					
					$scope.loading=true;
					// get list of evolutions with specific username in login
					// form
					

					//get types for evolutions
					$http.get("types").success(function(response) {
						$scope.types = response;


					}).error(function() {
						//console.log('not enter in types');
					});
					
					//get list of livraisons
					$http.get("livraisons").success(function(response) {
						$scope.livraisons = response;

					}).error(function() {
						//console.log('not enter in types');
					});
					$http.get("initialiser");
				
					//syncronise liste types
					$http.get("cpsis").success(function(response) {
						$scope.cps = response;

					});
					$http.get("cprecettes").success(function(response) {
						$scope.cprs = response;

					});
					
					$http.get("cpsis").success(function(response) {
						$scope.cps = response;
					
						}); 
					
					$http
					.get("usines")
					.success(
							function(response) {
								$scope.usines = response; // ajax
								// request
								// to
								// fetch

							}).error(function(){
								console.log('error getting usine id');
							});
					
					/**
					 * réinitialiser la selection des checkboxes
					 */
					$scope.initialiserSelection=function(){
						$http.get("initialiser").success(function(){
							angular.forEach($scope.users, function(item) {
								item.evolutionSelected = 0;
							});
						});
					}

					$scope.utilisateurs = [];
					// get users infos
					$http.get("users").success(function(response) {
						$scope.utilisateurs = response;
						// //console.log ($scope.utilisateurs);

					}).error(function() {
						//console.log('not get users infos');
					});
					
					/**
					 * Load cpsi
					 */
					
					$http.get("evolutions2/").success(function(response) {
						
						$scope.users = response;
						
						$scope.loading=false;
						
				

					}).error(function() {
						//console.log('not enter in evolution2');
					});
					
					$http.get("meps").success(function(response) {
						
						$scope.meps = response;
						
				

					});
					
					

					
					
					/**
					 * FILTER FUNCTIONS
					 */
					$scope.sortKey = '-dateMepSouhaitee';
					$scope.sortKey2 = '-dateMepSouhaitee';
					$scope.sortKeyKpi='-dateMepSouhaitee';
					
					/**
					 * SORT EVOLUTIONS
					 */
					$scope.sort = function(keyname) {
						$scope.sortKey = keyname; // set the sortKey to the
						// param passed
						$scope.reverse = !$scope.reverse; // if true make it
						// false and vice
						// versa
						$scope.nombrePage;
						$scope.typeEvolution;
					};

					
					/**
					 * SORT KPI OK
					 */
					$scope.sort2 = function(keyname) {
						$scope.sortKey2 = keyname; // set the sortKey to the
						// param passed
						$scope.reverse2 = !$scope.reverse2; // if true make it
						// false and vice
						// versa
						$scope.nombrePage2;
						$scope.typeEvolution;
					};
					
					/**
					 * Sort cpsi
					 */
					$scope.sortCPSI = function(keyname) {
						$scope.sortKeyCPSI = keyname; // set the sortKey to the
						// param passed
						$scope.reverseCPSI = !$scope.reverseCPSI; // if true make it
						// false and vice
						// versa
						$scope.nombrePageCPSI;
					};
					
					/**
					 * SORT KPI KO
					 */
					$scope.sortKpiKo = function(keyname) {
						$scope.sortKeyKpiKo = keyname; // set the sortKey to the
						// param passed
						$scope.reverseKpiKo = !$scope.reverseKpiKo; // if true make it
						// false and vice
						// versa
						$scope.nombrePageKpiKo;
						$scope.typeEvolution;
					};
					
					/**
					 * SORT USER FOR ADMIN
					 */
					$scope.sortUser = function(keyname) {
						$scope.sortKeyUser = keyname; // set the sortKey to the
						// param passed
						$scope.reverseUser = !$scope.reverseUser; // if true make it
						// false and vice
						// versa
						$scope.nombrePageUser;
						$scope.typeEvolution;
					};
					
					
					/**
					 * SORT USER FOR CPR
					 */
					$scope.sortCPR = function(keyname) {
						$scope.sortKeyCPR = keyname; // set the sortKey to the
						// param passed
						$scope.reverseCPR = !$scope.reverseCPR; // if true make it
						// false and vice
						// versa
						$scope.nombrePageCPR;
						$scope.typeEvolution;
					};
					
					/**
					 * SORT ADMIN
					 */
					$scope.sortEvol = function(keyname) {
						$scope.sortKeyEvol = keyname; // set the sortKey to the
						// param passed
						$scope.reverseEvol = !$scope.reverseEvol; // if true make it
						// false and vice
						// versa
						$scope.nombrePageEvol;
						$scope.typeEvolution;
					};
					
					/**
					 * SORT TYPE EVOLUTION
					 */
					$scope.sortTypeEvolution = function(keyname) {
						$scope.sortKeyTypeEvolution = keyname; // set the sortKey to the
						// param passed
						$scope.reverseTypeEvolution = !$scope.reverseTypeEvolution; // if true make it
						// false and vice
						// versa
						$scope.nombrePageTypeEvolution;
					};
					
					/**
					 * SORT LIVRAISON
					 */
					$scope.sortLivraison = function(keyname) {
						$scope.sortKeyLivraison = keyname; // set the sortKey to the
						// param passed
						$scope.reverseLivraison = !$scope.reverseLivraison; // if true make it
						// false and vice
						// versa
						$scope.nombrePageLivraison;
					};
					
						$scope.anomaliesResolus = [];

					$http.get("cprecettes").success(function(data) {
						$scope.cprs = data; // ajax request to fetch data into
						// $scope.data
					}).error(function() {
						//console.log("erreur cprecette get non valide");
					});
					
					/**
					 * SORT Mgens
					 */
					$scope.sortMgen = function(keyname) {
						$scope.sortKeyMgen = keyname; // set the sortKey to the
						// param passed
						$scope.reverseMgen = !$scope.reverseMgen; // if true make it
						// false and vice
						// versa
						$scope.nombrePageMgen;
					};
					
					/**
					 * SORT DS
					 */
					
					$scope.sortDS = function(keyname) {
						$scope.sortKeyDS = keyname; // set the sortKey to the
						// param passed
						$scope.reverseDS = !$scope.reverseDS; // if true make it
						// false and vice
						// versa
						$scope.nombrePageDS;
					};
					
					/**
					 * SORT problemes résolus for mep
					 */
				
					$scope.sortProblemeResolus = function(keyname) {
						$scope.sortKeyProblemeResolu = keyname; // set the sortKey to the
						// param passed
						$scope.reverseProblemeResolu = !$scope.reverseProblemeResolu; // if true make it
						// false and vice
						// versa
						$scope.nombrePageProblemeResolu;
					};
					
					/**
					 * SORT problemes ouvert for mep
					 */
					$scope.sortProblemeOuverts = function(keyname) {
						$scope.sortKeyProblemeOuverts = keyname; // set the sortKey to the
						// param passed
						$scope.reverseProblemeOuverts = !$scope.reverseProblemeOuverts; // if true make it
						// false and vice
						// versa
						$scope.nombrePageProblemeOuverts;
					};
					
					/**
					 * SORT LIST MEPS
					 */
					$scope.sortMeps = function(keyname) {
						$scope.sortKeyMeps = keyname; // set the sortKey to the
						// param passed
						$scope.reverseMeps = !$scope.reverseMeps; // if true make it
						// false and vice
						// versa
						$scope.nombrePageMeps;
					};



					$scope.clicked = false;

					// pour la vue avec table en saisie
					$scope.save = function(idEvolution, avancement, koPourcentage, rafJH, rafEnCasTests, commentaires) {
						
						if(koPourcentage == null){
							koPourcentage=0;
						};
						$http(
								{
									method : 'PUT',
									url : 'evolutions',
									data : "id=" + idEvolution 
									+"&avancement="+ avancement
									+"&koPourcentage="+ koPourcentage
									+ "&rafjh=" + rafJH
									+ "&rafcastest=" + rafEnCasTests
									+"&commentaires="+ commentaires,// forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function() {
											$scope.showModifForm = false;
											$scope.showTableEvolution = true;
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> L'évolution  a été bien modifié !</div>"
																+

																"<span ><i>Merci de patienter ... </i></span>" +
																'<img src="app/loading3.gif">',
														html : true,

														showConfirmButton : false,
											
													});

											$http
													.get("evolutions2/")
													.success(
															
															function(response) {
																
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																					
																			html: true,
																			showConfirmButton : false,
																			timer:100
																		});
																$scope.users = response;
															});

										})
								.error(
										function() {
											swal({
												title : "Opération  <small style='color:red'>échouée !</small>",
												text : "<span style='color:red'> L'évolution n'a pas été modifié </span> .",
												html : true
											});
										});

					};

					$scope.checkAll = function() {
						if ($scope.selectedAll) {
							$scope.selectedAll = false;
						} else {
							$scope.selectedAll = true;
						}
						angular.forEach($scope.themen, function(item) {
							item.checked = $scope.selectedAll;
						});
					}

					/**
					 * $scope.checkAllEvolutions = function () { if
					 * ($scope.selectAllEvolutions) { $scope.selectAllEvolutions =
					 * '0'; //console.log($scope.selectAllEvolutions); } else {
					 * $scope.selectAllEvolutions = '1';
					 * //console.log($scope.selectAllEvolutions); }
					 * angular.forEach($scope.users, function (item) {
					 * item.evolutionSelected = $scope.selectAllEvolutions;
					 * //console.log(item.evolutionSelected); }); }
					 * 
					 */

					// save checkboxes in session treeeeeeeeees important
					if ($window.localStorage.getItem('themen') === null) {
						$scope.themen = [ {
							name : "REF",
							checked : false,
							type : "optionRef"
						}, {
							name : "Description",
							checked : false,
							type : "optionDescription"

						}, {
							name : "CP SI",
							checked : false,
							type : "optionCpsi"

						}, {
							name : "CP Recette",
							checked : false,
							type : "optionCpr"

						}, {
							name : "Etat livraison",
							checked : false,
							type : "optionEtatLivraison"

						}, {
							name : "Date MEP",
							checked : false,
							type : "optionMep"

						}, {
							name : "Date début",
							checked : false,
							type : "optionDateDebut"

						}, {
							name : "Date fin prévue",
							checked : false,
							type : "optionDateFin"

						}, {
							name : "Date fin effective",
							checked : false,
							type : "optionDateFinEffective"

						}, {
							name : "Date prévue cahier de test",
							checked : false,
							type : "optionDatePrevueCahier"

						}, {
							name : "Date effective cahier de test",
							checked : false,
							type : "optionDateEffectiveCahier"

						}, {
							name : "Avancement",
							checked : false,
							type : "optionAvancement"

						}, {
							name : "Commentaires",
							checked : false,
							type : "optionCommentaires"

						}, {
							name : "Charge JH",
							checked : false,
							type : "optionChargeJH"

						}, {
							name : "RAF JH",
							checked : false,
							type : "optionRAFJH"

						}, {
							name : "Nombre de cas de tests",
							checked : false,
							type : "optionNbrCasTests"

						}, {
							name : "RAF en cas de tests",
							checked : false,
							type : "optionRAFCasTests"

						},

						];
					} else {
						$scope.themen = JSON
								.parse($window.localStorage['themen']);
					}
					;

					$scope.updateThemaLocalStorage = function(items) {
						$window.localStorage['themen'] = JSON.stringify(items);
					};

					//console.log($scope.themen);
					// ********************
					$scope.saveCpsi = function(refEvolution, chargeJH, rafJH,
							nombreCasTests, rafEnCasTests, dateMepSouhaitee,
							dateDebutTests, dateFinTests, avancement) {

						if (rafJH == null)
							rafJH = 0;

						if (dateMepSouhaitee == null)
							dateMepSouhaitee = dateFinTests;

						$http(
								{
									method : 'PUT',
									url : 'evolutionsCpsi',
									data : "refEvolution=" + refEvolution
											+ "&chargeJH=" + chargeJH
											+ "&rafJH=" + rafJH
											+ "&nombreCasTests="
											+ nombreCasTests
											+ "&rafEnCasTests=" + rafEnCasTests
											+ "&dateMepSouhaitee="
											+ dateMepSouhaitee
											+ "&dateDebutTests="
											+ dateDebutTests + "&dateFinTests="
											+ dateFinTests + "&avancement="
											+ avancement, // forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								}).success(function() {
						}).error(function() {
							alert("L'évolution n'a pas été modifiée");
						});

					};

					// getsuserProfiles
					$scope.userProfiles = [];
					$http.get("userProfiles").success(function(data) {
						$scope.userProfiles = data; // ajax request to fetch
						// data into
						//console.log("enter UserProfile");
						// $scope.data
					}).error(function() {
						//console.log("erreur userProfile get non valide");
					});

					// pour la redirection same page
					$scope.gotoUpEvolution = function() {
						// set the location.hash to the id of
						// the element you wish to scroll to.
						$location.hash('haut-page-evolution');

						// call $anchorScroll()
						$anchorScroll();
					};

					$scope.showModifForm = false;
					$scope.showTableEvolution = true;

					
					
					$scope.edit2 = function(id) {

						$scope.showModifForm = true;
						$scope.showTableEvolution = false;
					

						
						$http
								.get("evolutions/" + id)
								.success(
										function(response) {
											$scope.evolution = response; // ajax
											// request
											// to
											// fetch
											// data into
											// $scope.data
											

											// transmettre les date afin que
											// jakson les lise
											$scope.evolution.dateMepSouhaitee = $filter(
													'date')
													(
															$scope.evolution.dateMepSouhaitee,
															'yyyy-MM-dd');

											$scope.evolution.dateDebutTests = $filter(
													'date')
													(
															$scope.evolution.dateDebutTests,
															'yyyy-MM-dd');

											$scope.evolution.dateFinTests = $filter(
													'date')
													(
															$scope.evolution.dateFinTests,
															'yyyy-MM-dd');

											$scope.evolution.dateFinEffective = $filter(
													'date')
													(
															$scope.evolution.dateFinEffective,
															'yyyy-MM-dd');

											$scope.evolution.datePrevuCahier = $filter(
													'date')
													(
															$scope.evolution.datePrevuCahier,
															'yyyy-MM-dd');

											$scope.evolution.dateEffectiveCahier = $filter(
													'date')
													(
															$scope.evolution.dateEffectiveCahier,
															'yyyy-MM-dd');

											//console.log("enter edit function");

										}).error('errrrrr');

					};
					
					/**
					 * 
					 */

					// souvegarder checkboxes

					$scope.saveChexboxesColumns = function() {
						$http({
							method : 'POST',
							url : 'checkboxes',
							data : $scope.themen, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<div class='alert alert-success'>Les colonnes ont été bien sauvegardé </div>",
												html : true
											});
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												text : "<span>Les colonnes n'ont pas été enregistré <span> .",
												html : true
											});
										});

					};
					//

					/**
					 * UPDATE EVOLUTION
					 */
					$scope.showEvolsForm = function() {
						
						$scope.showModifForm = false;
						$scope.showTableEvolution = true;
						
					}
					$scope.update = function() {

						// calcul nombre de lignes dans un texbox
						var texbox = angular.element($('#texbox-commentaires'))
								.val();

						numberOfLineBreaks = (texbox.match(/\n/g) || 0).length;
						characterCount = texbox.length + numberOfLineBreaks;
						//console.log(numberOfLineBreaks + 1);
						$scope.evolution.kpi3 = numberOfLineBreaks + 1;
						

						$http({
							method : 'PUT',
							url : 'evolutions/' + $scope.evolution.idEvolution,
							data : $scope.evolution, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
										
										
											$scope.showModifForm = false;
											$scope.showTableEvolution = true;
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> L'évolution « <b>"
																+ $scope.evolution.refEvolution
																+ " » a été modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});
											

											$http
													.get("evolutions2/")
													.success(
															function(response) {
																$scope.users = response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																			showConfirmButton : false,
																			timer:100,
																		});
															});
										

										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												text : "<span style='color:red'> L'évolution « "
														+ $scope.evolution.refEvolution
														+ " » n'a pas été modifié </span> .",
												html : true
											});
										});

					}

					$scope.selectionner = function(id, selected) {
						$http(
								{
									method : 'PUT',
									url : 'selection',
									data : "id=" + id + "&selected=" + selected, // forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								}).success(function() {
							//console.log("success");
						}).error(function() {
							//console.log("erreur sending  data put");
						});
					};
					$scope.showacceptation = {};
					$scope.EvolutionAudit = [];

					$scope.LoadAudit = function(idx, idEvolution) {
						
						swal(
								{
									title : "<h3 style='color:green' >Chargement des données ...</h3>",
									text : "<img src=\"app/loading3.gif\">",
											
									html: true,
									showConfirmButton : false,
								});
						
					
									$http.get('revisionEvolution/' + idEvolution).success(
											function(response) {
												/**
												 * IMAGE LOADING
												 */
												$scope.EvolutionAudit = response;
												
												$scope.showacceptation[idx] = true;
												//console.log($scope.EvolutionAudit);
												swal(
														{
															title : "<h3 style='color:green' >Données chargées</h3>",
																	
															html: true,
															showConfirmButton : false,
															timer:100,
														});
												

											}).error('Audit Evolution failded');

						
						
					}

					/**
					 * EDIT USER
					 */

					// retour action
					$scope.HideEditUserFormAction = function() {
						$scope.showModifFormUser = false;
						$scope.showTableUsers = true;
					}
					// formulaire de modification du user
					$scope.utilisateur = [];
					$scope.editUser = function(id) {

						$scope.showModifFormUser = true;
						$scope.showTableUsers = false;
						$http.get("users/" + id).success(function(response) {
							$scope.utilisateur = response; // ajax request to
							// fetch
							// data into
							// $scope.data

							// transmettre les date afin que jakson les lise

							//console.log("enter edit User form \n");
							//console.log($scope.utilisateur);

						}).error('erreur getting user with id' + id);

					};
					/**
					 * CREATE USER
					 */

					// ajout action
					$scope.showAddUserFormAction = function() {
						$scope.showAddUserForm = true;
						$scope.showTableUsers = false;
						
					}
					// retour action
					$scope.HideAddUserFormAction = function() {
						$scope.showAddUserForm = false;
						$scope.showTableUsers = true;
						
					}
					$scope.saveUser1 = function() {

						$http({
							method : 'POST',
							url : 'user',
							data : $scope.NewUser, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}
						})
								.success(
										function() {
										
											$scope.showAddUserForm = false;
											
											$scope.showTableUsers = true;
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> L'utilisateur « <b>"
																+ $scope.NewUser.ssoId
																+ " » a été crée avec succès </div>"
																+

																'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});
											/**
											 * IMPORTANT
											 */
											$scope.formUserCreation.$setPristine();
											$scope.NewUser={};
											$scope.rpassword="";
											
											$http
													.get("users")
													.success(
															function(response) {
																$scope.utilisateurs = response;
																// //console.log
																// ($scope.utilisateurs);
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées !!</h3>",
																			html:true,
																			showConfirmButton : false,
																			timer:100
																		});

															})
													.error(
															function() {
																console
																		.log('unable to get user data');
															});
											$http.get("cprecettes").success(function(data) {
												$scope.cprs = data; // ajax request to fetch data into
												// $scope.data
											}).error(function() {
												//console.log("erreur cprecette get non valide");
											});

										});
								

					};

					/**
					 * UPDATE USER
					 */
					$scope.showModifFormUser = false;
					$scope.showTableUsers = true;

					// update user informations
					$scope.updateUser = function() {

					
						if ($scope.utilisateur2 != null) {
							$scope.utilisateur.password = $scope.utilisateur2.password;
						}

						$http({
							method : 'PUT',
							url : 'users/' + $scope.utilisateur.id,
							data : $scope.utilisateur, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}
						})
								.success(
										function() {
									
											$scope.showModifFormUser = false;
											$scope.showTableUsers = true;
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite !</h3>",
														text : "<div class='alert alert-success'> L'utilisateur « <b>"
																+ $scope.utilisateur.ssoId
																+ " » a été bien modifié </div>"
																+

																'<img src="app/loading3.gif">',
														html : true,

														showConfirmButton : false,
														
													});
													
											
											$http
													.get("users")
													.success(
															function(response) {
																$scope.utilisateurs = response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées !</h3>",

																			html : true,
																			timer:500,
																			showConfirmButton : false,
																			
																		});
																// //console.log
																// ($scope.utilisateurs);

															})
													.error(
															function() {
																console
																		.log('not get users infos');
															});
											
											$http.get("cprecettes").success(function(response) {
												$scope.cprs = response;

											});
											
											$scope.formUserModification.$setPristine();
											$scope.utilisateur={};
											$scope.newRpassword="";
											$scope.utilisateur2.password="";

										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée !</h3>",
												text : "<span style='color:red'> L'évolution « "
														+ $scope.evolution.refEvolution
														+ " » n'a pas été modifié </span> .",
												html : true
											});
										});

					}
					/**
					 * 
					 * ESPACE KPI2
					 */
					// save kpi2
					/**
					 * CALCUL KPI 2 PERIODE OPTION
					 */
					// pour la vue avec table en saisie option periode
					
					
					$scope.saveKpi2Periode = function(option,
							optionPeriodeFrom, optionPeriodeTo) {
						
						
			

						$scope.formKpi = false;
						$scope.showTableKpiOK = true;
						$scope.showTableKpiKO = true;
						$scope.showButtonRetourNoResult=true;
						$http(
								{
									method : 'PUT',
									url : 'kpi2Periode',
									data : "option=" + option
											+ "&optionPeriodeFrom="
											+ optionPeriodeFrom
											+ "&optionPeriodeTo="
											+ optionPeriodeTo,
									// forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function() {
											$http
													.get("kpi2OK")
													.success(
															function(response) {
																$scope.kpisOK = response;
																console
																		.log('kpi ok sucsess');
															})
													.error(
															function() {
																console
																		.log('kpi ok not entered');
															});
											$http
													.get("kpi2KO")
													.success(
															function(response) {
																$scope.kpisKO = response;
																console
																		.log('kpi periode ko sucsess');
															})
													.error(
															function() {
																console
																		.log('kpi periode ko not entered');
															});

											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<span> chargement du résultat  </span> ",
												html : true,
												showConfirmButton : false,
												timer : 2000

											});
											// alert("save kpi2");
										}).error(function() {
									// alert("erreur sending kpi2 data");
								});
						// $window.location.href = ('evolutionsCprecette')
					};

					// save kpi2
					// pour la vue avec table en saisie option Mois

					/**
					 * CALCUL DU KPI 2 MOIS OPTION
					 */
					$scope.formKpi = true;
					$scope.showTableKpiOK = false;
					$scope.showTableKpiKO = false;
					$scope.kpisOK = [];
					
					$scope.hideKpiForm=function(){
						$scope.showKpis = false;
						$scope.showHome=true;
						
					}

					$scope.returnKpiHomePage = function() {
						$scope.formKpi = true;
						$scope.showTableKpiOK = false;
						$scope.showTableKpiKO = false;
						$scope.showButtonRetourNoResult=false;
					}
					
			

					$scope.saveKpi2Mois = function(option, optionMois) {
						$scope.formKpi = false;
						$scope.showTableKpiOK = true;
						$scope.showTableKpiKO = true;
						$scope.showButtonRetourNoResult=true;
					

						$http(
								{
									method : 'PUT',
									url : 'kpi2Mois',
									data : "option=" + option + "&optionMois="
											+ optionMois,

									// forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function() {
											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<span>Chargement du résultat ...  </span> ",
												html : true,
												showConfirmButton : false,

											});
											$http
													.get("kpi2OK")
													.success(
															function(response) {
																swal({
																	title : "<h3 style='color:green'>Données chargées !</h3>",
																	html : true,

																});
																$scope.kpisOK = response;
																console
																		.log('kpi ok sucsess');
														
												

															})
													.error(
															function() {
																console
																		.log('kpi ok not entered');
															});
											$http
													.get("kpi2KO")
													.success(
															function(response) {
																$scope.kpisKO = response;
																console
																		.log('kpi periode ko sucsess');
																
															})
													.error(
															function() {
																console
																		.log('kpi periode ko not entered');
															});

											
										}).error(function() {
									// alert("erreur sending kpi2 data" +
									// optionMois);

								});

						// $window.location.href = ('evolutionsCprecette')
					};

					/**
					 * AJOUTER UNE EVOLUTION
					 */
					$scope.newEvolution = {};
					

					$scope.showAddEvolutionForm = false;

					// fonction pour changer en vue table evolution
					$scope.showAddEvolutionFormAction = function() {
						
				
						
						$scope.showTableEvolution = false;
						$scope.showAddEvolutionForm = true;
					};
					$scope.returnHomeFromAddFormEvolution = function() {
						$scope.showTableEvolution = true;
						$scope.showAddEvolutionForm = false;
					}
					// souvegarder Evolution
					/**
					 * ADD EVOLUTION
					 */
					$scope.saveEvolution = function() {
						
						var refType = angular.element($('.typeEvolutionAdd')).val();
						var ref = angular.element($('#type1')).val();
						$scope.newEvolution.refEvolution = $scope.newEvolution.typeEvolution.type +""+ref;
						$http({
							method : 'POST',
							url : 'evolutions',
							data : $scope.newEvolution, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											$scope.showAddEvolutionForm = false;
											$scope.showTableEvolution = true;
											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<span>Chargement du résultat ...  </span><br>" +
														'<img src="app/loading3.gif"> ',
												html : true,
												showConfirmButton : false,

											});
											


											$http
													.get("evolutions2/")
													.success(
															function(response) {
																$scope.users = response;
																swal({
																	title : "<h3 style='color:green'>Données chargées !</h3>",
																	html : true,

																});
															});
											$scope.evolutionAddForm.$setPristine();
											
											$scope.newEvolution={};
											$scope.newEvolution.avancement=0;
											$scope.newEvolution.chargeJH=0;
											$scope.newEvolution.nombreCasTests=0;
											$scope.newEvolution.rafJH=0;
											$scope.newEvolution.rafEnCasTests=0;
											var ref = angular.element($('#type1')).val('');
											
											

										})
								.error(

										function() {
											swal({
												title : "Opération  <small style='color:red'>échouée !</small>",
												text : "<span style='color:red'> L'évolution « "
														+ $scope.newEvolution.refEvolution
														+ " » n'a pas été crée </span> .",
												html : true
											});
											$scope.showAddEvolutionForm = false;
											$scope.showTableEvolution = true;
										});

					};
					
					/**
					 * SETTINGS FOR SIGLE PAGE LOAD
					 */
					
					//initialisation
					$scope.showHome=true;
					$scope.showEvolution=false;
					$scope.showEvolutionCPR=false;
					$scope.showKpis=false;
					$scope.showTypeEvolution=false;
					$scope.showUsers=false;
					$scope.showCPSI=false;
					$scope.showKpis3=false;
					
					//home fonction
					$scope.showListMeps=false;
					$scope.showHomeAction=function(){
						
						$scope.showHome=true;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showCPSI=false;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
						
					
					}
					$scope.showMep=false;
					//evolution fonction ADMIN
					$scope.showEvolutionAction=function(){
					
						
						swal(
								{
									title : "<h3 style='color:green'>Chargement des données</h3>",
									text : "<div > Merci de patienter ... </div><br>"
											
											+'<img src="app/loading3.gif">',
									html: true,
									showConfirmButton : false,
								});
						
			
						
						
						$http
						.get("evolutions2/")
						.success(
								function(response) {

									swal(
											{
												title : "<h3 style='color:green'>Données chargées</h3>",
														
												html: true,
												showConfirmButton : false,
												timer:100
											});
									$scope.users = response;
								
								});
			
						
						$scope.showHome=false
						$scope.showEvolution=true;
						$scope.showModifForm=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTableEvolution=true;
						$scope.showAddEvolutionForm=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
					}
					
					//Evolution function for CPR
					$scope.showEvolutionCPRAction=function(){
						
						
						$scope.showHome=false;
						$scope.showEvolutionCPR=true;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
						
					}
					
					//KPI function for ADMIN
					$scope.showKpisAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=true;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						
						$scope.showKpis3=false;
					}
					
					//KPI function for ADMIN
					$scope.showKpis3Action=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						
						$scope.showKpis3=true;
					}
					
					
					
					//Users function for Admin
					$scope.showUsersAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=true;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						
						$scope.showKpis3=false;
					};
					
					//livraison
					$scope.showLivraison=false;
					$scope.showLivraisonAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showCPSI=false;
						
						$scope.showLivraison=true;
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						
						$scope.showKpis3=false;
					}
					/**
					 * TYPE EVOLUTION SHOW
					 */
					
					$scope.showTypeEvolution=false;
					
					$scope.showTypeEvolutionAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=true;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
					}
					
					/**
					 * CPSI SHOW
					 */
					
					$scope.showCPSIAction=function(){
						
						
						
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=true;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
					}
					
					
					/**
					 * CPSI SHOW
					 */
					
					$scope.showListMepsAction=function(){
						
						
						
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=true;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
					}
					
					
					/**
					 * GESTION CPSI
					 */
					
			
					$scope.saveCpsiAction=function(){
						
						
						$http({
							method : 'POST',
							url : 'cpsis',
							data : $scope.NewCpsi, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											swal({
												title : "<h3 style='color:green'>CP SI ajouté !</h3>",
												text : '<img src="app/loading3.gif">',
												html : true,
												showConfirmButton : false,
											});
											//syncronise liste types
											$http.get("cpsis").success(function(response) {
												$scope.cps = response;
												swal({
													title : "<h3 style='color:green'>Opération terminée ! <h3>", 
													html : true
												}); 

											});
											
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});
						$scope.FormCpsiCreation.$setPristine();
						$scope.NewCpsi={};

					//
				}
					
					
					/**
					 * EDITER CPSI
					 */
					
					$scope.editCPSI=function(id){
						$http
						.get("cpsis/" + id)
						.success(
								function(response) {
									$scope.EditedCPSI = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									console.log('error getting cpsi');
								});

			
					}
					
					/**
					 * UPDATE CPSI
					 */
					
					$scope.updateCPSIAction=function(){
						
						$http({
							method : 'PUT',
							url : 'cpsis/' + $scope.EditedCPSI.id,
							data : $scope.EditedCPSI, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> CP SI modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});

											$http
													.get("cpsis")
													.success(
															function(response) {
																$scope.cps = response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																		});
															});
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});
						
					}
					
					/**
					 * DELETE CPSI
					 */
					
					/**
					 * Delete http example
					 */
					$scope.supprimerCPSI=function(id){
						$http({
							method : 'DELETE',
							url : 'cpsis/' + id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						}).success(function(){
								swal({
										title : "<h3 style='color:green'>Opération réussite !</h3>",
										text : "<div class='alert alert-success'> CP SI supprimée  </div>"
											
											+'<img src="app/loading3.gif">',
										html : true,
										showConfirmButton : false,
									});
								$http
								.get("cpsis/")
								.success(
										function(response) {
											$scope.cps = response;
											swal(
													{
														title : "<h3 style='color:green'>Données chargées</h3>",
														html: true,
														showConfirmButton : false,
														timer:100
													});
										});
								
						}).error(function(){
							swal({
								title : "<h3 style='color:red'>Impossible de supprimer CPSI !</h3>",
								html : true
							});
						})
					}
					
					
					
					/**
					 * GESTION DES TYPE EVOLUTION
					 */
					
					//ajouter une évolution
					
					$scope.saveTypeEvolutionAction=function(){
						
							
							$http({
								method : 'POST',
								url : 'types',
								data : $scope.NewTypeEvolution, // forms user object
								headers : {
									'Content-Type' : 'application/JSON'
								}

							})
									.success(
											function() {
												
												swal({
													title : "<h3 style='color:green'>Type d'évolution ajouté !</h3>",
													text : '<img src="app/loading3.gif">',
													html : true,
													showConfirmButton : false,
												});
										
												//syncronise liste types
												$http.get("types").success(function(response) {
													$scope.types = response;
													
													swal({
														title : "<h3 style='color:green'>Opération terminée ! <h3>", 
														html : true
													}); 
													
													$scope.TypeReferenceForm.$setPristine();
													$scope.NewTypeEvolution={};

												});
											
											})
									.error(
											function() {
												swal({
													title : "<h3 style='color:red'>Opération échouée</h3>",
													html : true
												});
											});

						//
					}
					
					//gestion du menu type Evolution
					
					
					
					
					/**
					 * GESTION DES LIVRAISONS
					 */
					
					//ajouter une évolution
					
					$scope.saveEtatLivraisonAction=function(){
						
							
							$http({
								method : 'POST',
								url : 'livraisons',
								data : $scope.livraison, // forms user object
								headers : {
									'Content-Type' : 'application/JSON'
								}

							})
									.success(
											function() {
												
												swal({
													title : "<h3 style='color:green'>Livraison ajoutée !</h3>",
													text : '<img src="app/loading3.gif">',
													html : true,
													showConfirmButton : false,
												});
												//syncronise liste types
												$http.get("livraisons").success(function(response) {
													$scope.livraisons = response;
													
													swal({
														title : "<h3 style='color:green'>Opération terminée ! <h3>", 
														html : true
													}); 
													$scope.livraisonForm.$setPristine();
													$scope.livraison={};

												});
											
											})
									.error(
											function() {
												swal({
													title : "<h3 style='color:red'>Opération échouée</h3>",
													html : true
												});
											});

						//
					}
					
					/**
					 * LIVRAISON
					 */
					
					
					/**
					 * EDITER TYPE EVOLUTION
					 */
					
					$scope.editTypeEvolution=function(id){
						$http
						.get("types/" + id)
						.success(
								function(response) {
									$scope.EditedType = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									alert('type not got');
								});

			
					}
					
					/**
					 * UPDATE LIVRAISON
					 */
					
					$scope.updateLivraisonAction=function(){
						
						$http({
							method : 'PUT',
							url : 'livraisons/' + $scope.EditedLivraison.id,
							data : $scope.EditedLivraison, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> Livraison modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});

											$http
													.get("livraisons/")
													.success(
															function(response) {
																$scope.livraisons = response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																			showConfirmButton : false,
																			timer:100
																		});
															});
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true,
												
											});
										});
						
					}
					
					
					
					/**
					 * EDITER LIVRAISON
					 */
					
					$scope.editLivraison=function(id){
						$http
						.get("livraisons/" + id)
						.success(
								function(response) {
									$scope.EditedLivraison = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									alert('livraison not got');
								});

					}
					
					
					/**
					 * Delete http example
					 */
					$scope.supprimerLivraison=function(id){
						$http({
							method : 'DELETE',
							url : 'livraisons/' + id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						}).success(function(){
								swal({
										title : "<h3 style='color:green'>Opération réussite !</h3>",
										text : "<div class='alert alert-success'> Livraison supprimée  </div>"
											
											+'<img src="app/loading3.gif">',
										html : true,
										showConfirmButton : false,
									});
								$http
								.get("livraisons/")
								.success(
										function(response) {
											$scope.livraisons = response;
											swal(
													{
														title : "<h3 style='color:green'>Données chargées</h3>",
														html: true,
														showConfirmButton : false,
														timer:100
													});
										});
								
						}).error(function(){
							swal({
								title : "<h3 style='color:red'>Impossible de supprimer cette livraison !</h3>",
								html : true
							});
						})
					}
					
					
					/**
					 * Delete type evolution
					 */

					/**
					 * Delete http example
					 */
					$scope.supprimerTypeEvolution=function(id){
						$http({
							method : 'DELETE',
							url : 'types/' + id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						}).success(function(){
								swal({
										title : "<h3 style='color:green'>Opération réussite !</h3>",
										text : "<div class='alert alert-success'> Type d'évolution supprimée  </div>"
											
											+'<img src="app/loading3.gif">',
										html : true,
										showConfirmButton : false,
									});
								$http
								.get("types/")
								.success(
										function(response) {
											$scope.types = response;
											swal(
													{
														title : "<h3 style='color:green'>Données chargées</h3>",
														html: true,
														showConfirmButton : false,
														timer:100
													});
										});
								
						}).error(function(){
							swal({
								title : "<h3 style='color:red'>Impossible de supprimer ce type !</h3>",
								html : true
							});
						})
					}
					
					/**
					 * UPDATE TYPE 
					 */
					
					$scope.updateTypeEvolutionAction=function(){
						
						$http({
							method : 'PUT',
							url : 'types/' + $scope.EditedType.id,
							data : $scope.EditedType, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'> Type d'évolution modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});

											$http
													.get("types/")
													.success(
															function(response) {
																$scope.types = response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																			showConfirmButton : false,
																			timer:100
																		});
															});
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												text : "<span style='color:red'> L'évolution « "
														+ $scope.evolution.refEvolution
														+ " » n'a pas été modifié </span> .",
												html : true
											});
										});
						
					}
					
					
					/**
					 * GESTION USINE
					 */
					
					//show Usine
					$scope.usines=[];
					
					$scope.showUsineAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						$scope.showUsine=true;
						
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						
						$scope.showKpis3=false;
						
						$http
						.get("usines")
						.success(
								function(response) {
									$scope.usines = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									console.log('error getting usine id');
								});

						
				
					}
					
					//ajouter usine
					
					$scope.saveUsineAction=function(){
						
							
							$http({
								method : 'POST',
								url : 'usines',
								data : $scope.NewUsine, // forms user object
								headers : {
									'Content-Type' : 'application/JSON'
								}

							})
									.success(
											function() {
												//syncronise liste usines
												$http.get("usines").success(function(response) {
													$scope.usines = response;
													swal({
														title : "<h3 style='color:green'>Usine « " + $scope.NewUsine.nomUsine+" » ajoutée !</h3>",
														html : true,
														showConfirmButton : false,
														timer:1000
													});
												
													
													$scope.UsineForm.$setPristine();
													$scope.NewUsine={};

												});
											
											})
									.error(
											function() {
												swal({
													title : "<h3 style='color:red'>Opération échouée</h3>",
													html : true
												});
											});

						//
					}
					
					
					/**
					 * EDITER USINE
					 */
					
					$scope.editUsine=function(id){
						$http
						.get("usines/" + id)
						.success(
								function(response) {
									$scope.EditedUsine = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									console.log('error getting usine id');
								});

			
					}
					
					/**
					 * UPDATE USINE
					 */
					
					$scope.updateUsineAction=function(){
						
						$http({
							method : 'PUT',
							url : 'usines/' + $scope.EditedUsine.idUsine,
							data : $scope.EditedUsine, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'>Usine modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});

											$http
													.get("usines/")
													.success(
															function(response) {
																$scope.usines= response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																			showConfirmButton : false,
																			timer:1000

																		});
															});
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});
						
					}
					
					/**
					 * DELETE USINE
					 */
					

					$scope.supprimerUsine=function(id){
						$http({
							method : 'DELETE',
							url : 'usines/' + id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						}).success(function(){
								swal({
										title : "<h3 style='color:green'>Opération réussite !</h3>",
										text : "<div class='alert alert-success'> Usine supprimée  </div>"
											
											+'<img src="app/loading3.gif">',
										html : true,
										showConfirmButton : false,
									});
								$http
								.get("usines/")
								.success(
										function(response) {
											$scope.usines = response;
											swal(
													{
														title : "<h3 style='color:green'>Données chargées</h3>",
														html: true,
														showConfirmButton : false,
														timer:1000
													});
										});
								
						}).error(function(){
							swal({
								title : "<h3 style='color:red'>Impossible de supprimer l'Usine !</h3>",
								html : true
							});
						})
					}
					
					

					/**
					 * GESTION STATUT Anomalies
					 */
					
					//show Anomalie
					$scope.statuts=[];
					
					$scope.showStatutAnomalieAction=function(){
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						$scope.showUsine=false;
						$scope.showStatutAnomalie=true;
						
						$scope.showMep=false;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
						
						$http
						.get("statusAnomalies")
						.success(
								function(response) {
									$scope.statuts = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									console.log('error getting statuts');
								});

						
				
					}
					
					//ajouter statut
					
					$scope.saveStatutAnomalieAction=function(){
						
							
							$http({
								method : 'POST',
								url : 'statusAnomalies',
								data : $scope.NewStatutAnomalie, // forms statut
								headers : {
									'Content-Type' : 'application/JSON'
								}

							})
									.success(
											function() {
												//syncronise liste usines
												$http.get("statusAnomalies").success(function(response) {
													$scope.statuts = response;
													swal({
														title : "<h3 style='color:green'>Usine « " + $scope.NewStatutAnomalie.statut+" » ajoutée !</h3>",
														html : true,
														showConfirmButton : false,
														timer:1000
													});
												
													
													$scope.stackStatutAnomlieForm.$setPristine();
													$scope.NewStatutAnomalie={};

												});
											
											})
									.error(
											function() {
												swal({
													title : "<h3 style='color:red'>Opération échouée</h3>",
													html : true
												});
											});

						//
					}
					
					
					/**
					 * EDITER STATUT
					 */
					
					$scope.editStatutAnomalie=function(id){
						$http
						.get("statusAnomalies/" + id)
						.success(
								function(response) {
									$scope.EditedStatutAnomalie = response; // ajax
									// request
									// to
									// fetch

								}).error(function(){
									console.log('error getting usine id');
								});

			
					}
					
					/**
					 * UPDATE STATUS ANOMALIE
					 */
					
					$scope.updateStatutAnomalieAction=function(){
						
						$http({
							method : 'PUT',
							url : 'statusAnomalies/' + $scope.EditedStatutAnomalie.id,
							data : $scope.EditedStatutAnomalie, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											swal(
													{
														title : "<h3 style='color:green'>Opération réussite</h3>",
														text : "<div class='alert alert-success'>Statut modifié avec succès </div>"
																
																+'<img src="app/loading3.gif">',
														html: true,
														showConfirmButton : false,
													});

											$http
													.get("statusAnomalies/")
													.success(
															function(response) {
																$scope.statuts= response;
																swal(
																		{
																			title : "<h3 style='color:green'>Données chargées</h3>",
																			html: true,
																			showConfirmButton : false,
																			timer:1000

																		});
															});
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});
						
					}
					
					/**
					 * Statut anomalie
					 */
					

					$scope.supprimerStatutAnomalie=function(id){
						$http({
							method : 'DELETE',
							url : 'statusAnomalies/' + id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						}).success(function(){
								swal({
										title : "<h3 style='color:green'>Opération réussite !</h3>",
										text : "<div class='alert alert-success'> Statut supprimée  </div>"
											
											+'<img src="app/loading3.gif">',
										html : true,
										showConfirmButton : false,
									});
								$http
								.get("statusAnomalies/")
								.success(
										function(response) {
											$scope.statuts = response;
											swal(
													{
														title : "<h3 style='color:green'>Données chargées</h3>",
														html: true,
														showConfirmButton : false,
														timer:1000
													});
										});
								
						}).error(function(){
							swal({
								title : "<h3 style='color:red'>Impossible de supprimer l'Usine !</h3>",
								html : true
							});
						})
					}
					
					/**
					 * ADD ANOMALIE RESOLUS FROM MEP
					 */
					$scope.anomaliesResolus=[];
					
					
					$scope.addFormAnomalieResolue=false;
					$scope.addFormAnomalieResolueAction=function(){
						$scope.addFormAnomalieResolue=true;
					}
					$scope.saveAnomalieResolus=function(){
						
					
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieResolue, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesResolus.push( $scope.newAnomalieResolue);
											
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie résolue a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											
										

																	
												$scope.anomalieOuvertAddForm.$setPristine();
												$scope.newAnomalieResolue={};
												$scope.addFormAnomalieResolue=false;
												

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie résolue
					 * 
					 */
					$scope.supprimerAnomamlieResolue=function(anomalieResolue){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieResolue.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesResolus.pop(anomalieResolue);
					}
					
					
					/**
					 * ADD ANOMALIE OUVERT FROM MEP
					 */
					$scope.anomaliesOuverts=[];
					$scope.addFormAnomalieOuverte=false;
					$scope.addFormAnomalieOuverteAction=function(){
						$scope.addFormAnomalieOuverte=true;
					};
					$scope.saveAnomalieOuverts=function(){
						
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieOuvert, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesOuverts.push( $scope.newAnomalieOuvert);
											
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie ouverte a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											
										
																	
												$scope.anomalieOuvertAddForm.$setPristine();
												$scope.newAnomalieOuvert={};
												$scope.addFormAnomalieOuverte=false;

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie ouverte
					 * 
					 */
					$scope.supprimerAnomalieOverte=function(anomalieOuverte){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieOuverte.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesOuverts.pop(anomalieOuverte);
					}
					
					
					/**
					 * ADD ANOMALIE RESOLUS FROM MEP
					 */
					$scope.anomaliesEscalades=[];
					
					$scope.addFormAnomalieEscalade=false;
					$scope.addFormAnomalieEscaladeAction=function(){
						$scope.addFormAnomalieEscalade=true;
					};
					$scope.saveAnomalieEscalade=function(){
					
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieEscalade, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesEscalades.push( $scope.newAnomalieEscalade);
											console.log($scope.anomaliesEscalades);
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie en escalade a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											

																	
												$scope.anomalieEscaladeAddForm.$setPristine();
												$scope.newAnomalieEscalade={};
												$scope.addFormAnomalieEscalade=false;

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie résolue
					 * 
					 */
					$scope.supprimerAnomalieEscalade=function(anomalieEscalade){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieEscalade.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesEscalades.pop(anomalieEscalade);
					}
					
					
//////////////////////////////////////////////////////////////////////////////////////////////////////////
				/**
				 * GESTION DES MEP
				 */				
					
					
					/**
					 * show MEP Menu
					 */
					$scope.showMep=false;
					$scope.showMepAction=function(){
						
						$scope.showHome=false;
						$scope.showEvolution=false;
						$scope.showEvolutionCPR=false;
						$scope.showKpis=false;
						$scope.showUsers=false;
						$scope.showTypeEvolution=false;
						$scope.showLivraison=false;
						$scope.showCPSI=false;
						$scope.showUsine=false;
						$scope.showStatutAnomalie=false;
						
						$scope.showMep=true;
						$scope.showListMeps=false;
						$scope.showEditMep = false;
						$scope.showKpis3=false;
					}
					
					/**
					 * GET LIST OF EVOLUTIONS MGEN FOR DATE MEP
					 */
					$scope.mgens=[];
					$scope.sendMgen = function(dateMep) {
						
						dateMep = $filter('date')(dateMep,'MM/dd/yyyy');
						$http(
								{
									method : 'PUT',
									url : '/meps/evolutions',
									data : "dateMep=" + dateMep ,
									
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function(data) {
									
											
											$scope.mgens=data;
											angular.forEach($scope.mgens, function(item) {
												item.cprecettes = [];
												//console.log(item);
											});
											console.log($scope.mgens);
											
										

										})
								.error(
										function() {
											swal({
												title : "Opération  <small style='color:red'>échouée !</small>",
												html : true
											});
										});

					};
					
					/**
					 * GET DS EVOLUTIONS FOR DATE MEP 
					 */
					$scope.ds=[];
					$scope.sendDS = function(dateMep) {
						dateMep = $filter('date')(dateMep,'MM/dd/yyyy');
					
						$http(
								{
									method : 'PUT',
									url : '/meps/ds',
									data : "dateMep=" + dateMep ,
									
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function(data) {
									
											
											$scope.ds=data;
											angular.forEach($scope.ds, function(item2) {
												item2.cprecettes = [];
												//console.log(item);
											});
										

										})
								.error(
										function() {
											swal({
												title : "Opération  <small style='color:red'>échouée !</small>",
												text : "<span style='color:red'> L'évolution n'a pas été modifié </span> .",
												html : true
											});
										});

					};
					
					/**
					 * ADD MEP
					 */
					$scope.newMep={};
					$scope.saveMep = function() {
						
						$scope.mgens=[];
						$scope.ds=[];
						$scope.newMep.dateMep=$scope.dateMep;
						$scope.newMep.mgen=$scope.mgens;
						$scope.newMep.ds=$scope.ds;
						$scope.newMep.problemesResolus=$scope.anomaliesResolus;
						$scope.newMep.problemesOuverts=$scope.anomaliesOuverts;
						$scope.newMep.problemsEscalade=$scope.anomaliesEscalades;
						$http({
							method : 'POST',
							url : 'meps',
							data : $scope.newMep, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											
											swal({
												title : "<h3 style='color:green'>La MEP a été crée avec succès !</h3>",
												showConfirmButton : false,
												html : true
											});
											$window.location.reload();

										})
								.error(

										function() {
											swal({
												title : "Opération  <small style='color:red'>Mep not creating</small>",
												text : "<span style='color:red'> L'évolution ",
													
												html : true
											});
										});
						
						$scope.mepAddform.$setPristine();
						$scope.newMep={};
						$scope.anomaliesResolus=[];

					};
					
					
					
					//////////////////////////////////////////////////////////////
					/**
					 * ADD ANOMALIE RESOLUS FROM MEP
					 */
					$scope.anomaliesResolus2=[];
					
					$scope.addFormAnomalieResolue2=false;
					$scope.addFormAnomalieResolueAction2=function(){
						$scope.addFormAnomalieResolue2=true;
					}
			
					$scope.saveAnomalieResolus2=function(){
						
					
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieResolue2, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesResolus2.push( $scope.newAnomalieResolue2);
											console.log($scope.anomaliesResolus2);
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie résolue a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											
										

																	
												$scope.anomalieOuvertAddForm.$setPristine();
												$scope.newAnomalieResolue2={};
												$scope.addFormAnomalieResolue2=false;

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie résolue
					 * 
					 */
					$scope.supprimerAnomamlieResolue2=function(anomalieResolue2){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieResolue2.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesResolus2.pop(anomalieResolue2);
					}
					
					
					/**
					 * ADD ANOMALIE OUVERT FROM MEP
					 */
					$scope.anomaliesOuverts2=[];
					$scope.addFormAnomalieOuverte2=false;
					$scope.addFormAnomalieOuverteAction2=function(){
						$scope.addFormAnomalieOuverte2=true;
					};
					$scope.saveAnomalieOuverts2=function(){
						
					
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieOuvert2, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesOuverts2.push( $scope.newAnomalieOuvert2);
											
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie ouverte a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											
										
																	
												$scope.anomalieOuvertAddForm.$setPristine();
												$scope.newAnomalieOuvert2={};
												$scope.addFormAnomalieOuverte2=false;

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie ouverte
					 * 
					 */
					$scope.supprimerAnomalieOverte2=function(anomalieOuverte2){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieOuverte2.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesOuverts2.pop(anomalieOuverte2);
					}
					
					
					/**
					 * ADD ANOMALIE ESCALADE FROM MEP
					 */
					$scope.anomaliesEscalades2=[];
					$scope.addFormAnomalieEscalades2=false;
					$scope.addFormAnomalieEscalades2Action=function(){
						$scope.addFormAnomalieEscalades2=true;
					};
					$scope.saveAnomalieEscalade2=function(){
						
					
						$http({
							method : 'POST',
							url : 'anomalies',
							data : $scope.newAnomalieEscalade2, // forms statut
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											$scope.anomaliesEscalades2.push( $scope.newAnomalieEscalade2);
											swal({
												title : "<h3 style='color:green'> Opérarion réussite !</h3>",
												text : "<div class='alert alert-success'>Une anomalie en escalade a été ajoutée </div>",
												html : true,
												showConfirmButton : false,
												timer:1000
											});
											
											

																	
												$scope.anomalieOuvertAddForm.$setPristine();
												$scope.newAnomalieEscalade2={};
												$scope.addFormAnomalieEscalades2=false;

										
										
										})
								.error(
										function() {
											swal({
												title : "<h3 style='color:red'>Opération échouée</h3>",
												html : true
											});
										});

						
						
					}
					
					/**
					 * delete anomalie résolue
					 * 
					 */
					$scope.supprimerAnomalieEscalade2=function(anomalieEscalade2){
						
						$http({
							method : 'DELETE',
							url : 'anomalies/' + anomalieEscalade2.id,
							headers : {
								'Content-Type' : 'application/JSON'
							}

						});
						$scope.anomaliesEscalades2.pop(anomalieEscalade2);
					}
					
					
					
					
					
					
					/////////////////////////////////////////////////////////////
					
					/**
					 * EDIT MEP 
					 */
					
					$scope.editMep = function(id) {
						$scope.showListMeps = false;
						$scope.showEditMep = true;
						$http
								.get("meps/" + id)
								.success(
										function(response) {
											$scope.editedMep = response;
											
											$scope.anomaliesResolus2= $scope.editedMep.problemesResolus;
											$scope.anomaliesOuverts2=$scope.editedMep.problemesOuverts;
											$scope.anomaliesEscalades2 = $scope.editedMep.problemsEscalade;
											
										}).error(function(){
											alert("not getting mep for edition");
										});

					};
					/**
					 * SHOW MEP
					 */
					$scope.showMepDetails = function(id) {
						
						$http
								.get("meps/" + id)
								.success(
										function(response) {
											$scope.showedMep = response;
											
											
										}).error(function(){
											alert("not getting mep for edition");
										});

					};
					/**
					 * UPDATE MEP
					 */
					/**
					 * ADD MEP
					 */
					$scope.editedMep={};
					$scope.updateMep = function() {
						

						$scope.editedMep.problemesResolus=$scope.anomaliesResolus2;
						$scope.editedMep.problemesOuverts=$scope.anomaliesOuverts2;
						$scope.editedMep.problemsEscalade=$scope.anomaliesEscalades2;
						$http({
							method : 'PUT',
							url : 'meps/'+$scope.editedMep.idMep,
							data : $scope.editedMep, // forms user object
							headers : {
								'Content-Type' : 'application/JSON'
							}

						})
								.success(
										function() {
											
											
											swal({
												title : "<h3 style='color:green'>La MEP a été modifié avec succès !</h3>",
												showConfirmButton : false,
												html : true
											});
											$window.location.reload();

										})
								.error(

										function() {
											swal({
												title : "Opération  <small style='color:red'>Mep not creating</small>",
												text : "<span style='color:red'> L'évolution ",
													
												html : true
											});
										});
						
						$scope.mepAddform2.$setPristine();
						$scope.editedMep={};
						$scope.anomaliesResolus2=[];

					};
					
					
					
					
					
					/**
					 * imprimer la liste des evolutions
					 */
					
					$scope.dowloandPdf=function(){

						
						 html2canvas(document.getElementById('dataTables-example'), {
					            onrendered: function (canvas) {
					                var data = canvas.toDataURL();
					                var docDefinition = {
					                		
					                		
					                		
					                	info:{
					                		title:'liste des évolutions',
					                		author:'Sqli Maroc',
					                		subject: 'évolutions',
					                		keywords:'evolution mgen ds'
					                		
					                	},
					                	pageSize:'A4',
					                	//pageOrientation:'landscape',
					                	pageMargins:[50,50,30,30],
					                		
					                	
					                	footer: function(currentPage,pageCount){
					                		return{
					                			text: currentPage.toString()+ ' / ' +pageCount,
					                			alignment: 'center',
					                		}
					                	},
					                	header:[
					                	        
					                	        {
					                	        	text:'Liste des évolutions',
					                	        	alignment: 'center',
					                	        	fontSize: 20,
					                	        	margin:25,
					                	        	bold: true,
					                	        	
					                	        }
					                	  ],
					                    content: [
					                          

					                          {
					                        image: data,
					                        margin:[20,20],
					                        width: 500,
					                        alignment: 'center',
					                    }]
					                };
					                pdfMake.createPdf(docDefinition).download("liste_evolutions.pdf");
					            }
					        });

					
					}
					
					/**
					 * imprimer le mep
					 */
					
					$scope.dowloandPdfMep=function(){

						
						 html2canvas(document.getElementById('mep-details'), {
					            onrendered: function (canvas) {
					                var data = canvas.toDataURL();
					                var docDefinition = {
					                		
					                		
					                		
					                	info:{
					                		title:'Détails de la MEP',
					                		author:'Sqli Maroc',
					                		subject: 'MEP',
					                		keywords:'mep'
					                		
					                	},
					                	pageSize:'A4',
					                	//pageOrientation:'landscape',
					                	pageMargins:[50,50,30,30],
					                		
					                	header:[
					                	        
					                	        {
					                	        	text:'Détails de la MEP',
					                	        	alignment: 'center',
					                	        	fontSize: 20,
					                	        	margin:25,
					                	        	bold: true,
					                	        	
					                	        }
					                	  ],
					                    content: [
					                          
					                          {
					                        image: data,
					                        margin:[20,20],
					                        width:500 ,
					                        alignment: 'center',
					                    }]
					                };
					                pdfMake.createPdf(docDefinition).download("mep.pdf");
					            }
					        });

					
					}
					
					
					/**
					 * 
					 * ESPACE KPI3
					 */
					// save kpi3
					/**
					 * CALCUL KPI 3 PERIODE OPTION
					 */
					// pour la vue avec table en saisie option periode
					
					
					$scope.saveKpi3Periode = function(option,
							optionPeriodeFrom, optionPeriodeTo) {

						$scope.formKpi3 = false;
						$scope.showTableKpi3OK = true;
						$scope.showTableKpi3KO = true;
						$scope.showButtonRetourNoResult2=true;
						$http(
								{
									method : 'PUT',
									url : 'kpi3Periode',
									data : "option=" + option
											+ "&optionPeriodeFrom="
											+ optionPeriodeFrom
											+ "&optionPeriodeTo="
											+ optionPeriodeTo,
									// forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function() {
											$http
													.get("kpi3OK")
													.success(
															function(response) {
																$scope.kpis3OK = response;
																console
																		.log('kpi3 ok sucsess');
															})
													.error(
															function() {
																console
																		.log('kpi3 ok not entered');
															});
											$http
													.get("kpi3KO")
													.success(
															function(response) {
																$scope.kpis3KO = response;
																console
																		.log('kpi3 periode ko sucsess');
															})
													.error(
															function() {
																console
																		.log('kpi 3 periode ko not entered');
															});

											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<span> chargement du résultat  </span> ",
												html : true,
												showConfirmButton : false,
												timer : 2000

											});
											// alert("save kpi2");
										}).error(function() {
									// alert("erreur sending kpi2 data");
								});
						// $window.location.href = ('evolutionsCprecette')
					};

					// save kpi2
					// pour la vue avec table en saisie option Mois

					/**
					 * CALCUL DU KPI 3 MOIS OPTION
					 */
					$scope.formKpi3 = true;
					$scope.showTableKpi3OK = false;
					$scope.showTableKpi3KO = false;
					$scope.kpisOK = [];
					
					$scope.hideKpi3Form=function(){
						$scope.showKpis3 = false;
						$scope.showHome=true;
						
					}

					$scope.returnKpi3HomePage = function() {
						$scope.formKpi3 = true;
						$scope.showTableKpi3OK = false;
						$scope.showTableKpi3KO = false;
						$scope.showButtonRetourNoResult2=true;
					}

					$scope.saveKpi3Mois = function(option, optionMois) {
						$scope.formKpi3 = false;
						$scope.showTableKpi3OK = true;
						$scope.showTableKpi3KO = true;
						$scope.showButtonRetourNoResult2=true;
					

						$http(
								{
									method : 'PUT',
									url : 'kpi3Mois',
									data : "option=" + option + "&optionMois="
											+ optionMois,

									// forms
									// user
									// object
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function() {
											swal({
												title : "<h3 style='color:green'>Opération réussite !</h3>",
												text : "<span>Chargement du résultat ...  </span> ",
												html : true,
												showConfirmButton : false,

											});
											$http
													.get("kpi3OK")
													.success(
															function(response) {
																swal({
																	title : "<h3 style='color:green'>Données chargées !</h3>",
																	html : true,

																});
																$scope.kpis3OK = response;
																console
																		.log('kpi ok sucsess');
														
												

															})
													.error(
															function() {
																console
																		.log('kpi ok not entered');
															});
											$http
													.get("kpi3KO")
													.success(
															function(response) {
																$scope.kpis3KO = response;
																console
																		.log('kpi periode ko sucsess');
																
															})
													.error(
															function() {
																console
																		.log('kpi periode ko not entered');
															});

											
										}).error(function() {
									// alert("erreur sending kpi2 data" +
									// optionMois);

								});

						// $window.location.href = ('evolutionsCprecette')
					};
					
				
						
				});
