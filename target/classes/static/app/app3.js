var app = angular.module('evolution-app', []);






app.controller('evolution-controller', function($scope, $http, $timeout, $location,
		$window, $filter, $anchorScroll) {
	$scope.cprs = [];
	


	
	// get list of evolutions with specific username in login form
	$http.get("evolutions2/").success(function(response) {
		$scope.users = response;
		console.log($scope.users);

	}).error(function() {
		console.log('not enter in evolution2');
	});
	$http.get("initialiser");
	$http.get("etatRecettes");
	
	
	
	$scope.utilisateurs=[];
	//get users infos
	$http.get("users").success(function(response) {
		$scope.utilisateurs = response;
		//console.log ($scope.utilisateurs);

	}).error(function() {
		console.log('not get users infos');
	});
	
	
	
	$scope.sortKey='-dateMepSouhaitee';
	$scope.sort = function(keyname) {
		$scope.sortKey = keyname; // set the sortKey to the
		// param passed
		$scope.reverse = !$scope.reverse; // if true make it
		// false and vice
		// versa
		$scope.nombrePage;
		$scope.typeEvolution;
	};

	$scope.picker = {
		opened : false
	};

	$scope.openPicker = function() {
		$timeout(function() {
			$scope.picker.opened = true;
		});
	};

	$scope.closePicker = function() {
		$scope.picker.opened = false;
	};

	$http.get("cprecettes").success(function(data) {
		$scope.cprs = data; // ajax request to fetch data into
		// $scope.data
	}).error(function() {
		console.log("erreur cprecette get non valide");
	});

	$http.get("cpsi").success(function(data) {
		$scope.cpsi = data; // ajax request to fetch data into
		// $scope.data
	}).error(function() {
		console.log("erreur cpsi get non valide");
	});

	// pour la vue avec table en saisie
	$scope.save = function(data1, data2, data3) {

		$http({
			method : 'PUT',
			url : 'evolutions',
			data : "id=" + data1 + "&rafjh=" + data2 + "&rafcastest=" + data3, // forms
			// user
			// object
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		}).error(function() {
			console.log("erreur sending  data put");
		});
		$window.location.href = ('evolutionsCprecette')

	};
	
	
	 $scope.checkAll = function () {
	        if ($scope.selectedAll) {
	            $scope.selectedAll = false;
	        } else {
	            $scope.selectedAll = true;
	        }
	        angular.forEach($scope.themen, function (item) {
	            item.checked = $scope.selectedAll;
	        });
	 }
	 
	 
	 /**
	  * 	 $scope.checkAllEvolutions = function () {
	        if ($scope.selectAllEvolutions) {
	            $scope.selectAllEvolutions = '0';
	            console.log($scope.selectAllEvolutions);
	        } else {
	            $scope.selectAllEvolutions = '1';
	            console.log($scope.selectAllEvolutions);
	        }
	        angular.forEach($scope.users, function (item) {
	            item.evolutionSelected = $scope.selectAllEvolutions;
	            console.log(item.evolutionSelected);
	        });
	 }
	  * 
	  */


	
	
	//save checkboxes in session treeeeeeeeees important
	if ($window.localStorage.getItem('themen') === null) {
		$scope.themen = [ {
			name : "REF",
			checked : true,
			type	: "optionRef"
		}, {
			name : "Déscription",
			checked : true,
			type	: "optionDescription"

		}, {
			name : "CP SI",
			checked : true,
			type	: "optionCpsi"

		}, {
			name : "CP Recette",
			checked : true,
			type	: "optionCpr"

		}, {
			name : "Etat livraison",
			checked : true,
			type	: "optionEtatLivraison"

		},
		 {
			name : "Date MEP",
			checked : true,
			type	: "optionMep"

		},
		 {
			name : "Date début",
			checked : false,
			type	: "optionDateDebut"

		},
		 {
			name : "Date fin prévue",
			checked : true,
			type	: "optionDateFin"

		},
		{
			name : "Date fin effictive",
			checked : true,
			type	: "optionDateFinEffective"

		},
		{
			name : "Date prévue cahier de test",
			checked : true,
			type	: "optionDatePrevueCahier"

		},
		{
			name : "Date effective cahier de test",
			checked : true,
			type	: "optionDateEffectiveCahier"

		},
		{
			name : "Avancement",
			checked : true,
			type	: "optionAvancement"

		},
		{
			name : "Commentaires",
			checked : true,
			type	: "optionCommentaires"

		},
		{
			name : "Charge JH",
			checked : true,
			type	: "optionChargeJH"

		},
		{
			name : "RAF JH",
			checked : true,
			type	: "optionRAFJH"

		},
		{
			name : "Nombre de cas de tests",
			checked : true,
			type	: "optionNbrCasTests"

		},
		{
			name : "RAF en cas de tests",
			checked : true,
			type	: "optionRAFCasTests"

		},

		];
	} else {
		$scope.themen = JSON.parse($window.localStorage['themen']);
	};

	$scope.updateThemaLocalStorage = function(items) {
		$window.localStorage['themen'] = JSON.stringify(items);
	};
	
	console.log($scope.themen);
	//********************
	$scope.saveCpsi = function(refEvolution, chargeJH, rafJH, nombreCasTests,
			rafEnCasTests, dateMepSouhaitee, dateDebutTests, dateFinTests,
			avancement) {

		if (rafJH == null)
			rafJH = 0;

		if (dateMepSouhaitee == null)
			dateMepSouhaitee = dateFinTests;

		$http(
				{
					method : 'PUT',
					url : 'evolutionsCpsi',
					data : "refEvolution=" + refEvolution + "&chargeJH="
							+ chargeJH + "&rafJH=" + rafJH + "&nombreCasTests="
							+ nombreCasTests + "&rafEnCasTests="
							+ rafEnCasTests + "&dateMepSouhaitee="
							+ dateMepSouhaitee + "&dateDebutTests="
							+ dateDebutTests + "&dateFinTests=" + dateFinTests
							+ "&avancement=" + avancement, // forms
					// user
					// object
					headers : {
						'Content-Type' : 'application/x-www-form-urlencoded'
					}
				}).success(function(){
					$window.location.href = ('evols');
				}).error(function() {
			alert("L'évolution n'a pas été modifiée");
		});
		
	};
	
	//getsuserProfiles
	$scope.userProfiles=[];
	$http.get("userProfiles").success(function(data) {
		$scope.userProfiles = data; // ajax request to fetch data into
		console.log("enter UserProfile");
		// $scope.data
	}).error(function() {
		console.log("erreur userProfile get non valide");
	});

	// pour la redirection same page
	$scope.gotoUpEvolution = function() {
		// set the location.hash to the id of
		// the element you wish to scroll to.
		$location.hash('haut-page-evolution');

		// call $anchorScroll()
		$anchorScroll();
	};

	$scope.edit2 = function(id) {

		$location.hash('update-form-evolution');

		// call $anchorScroll()
		$anchorScroll();
		$http.get("evolutions/" + id)
				.success(
						function(response) {
							$scope.evolution = response; // ajax request to
							// fetch
							// data into
							// $scope.data

							// transmettre les date afin que jakson les lise
							$scope.evolution.dateMepSouhaitee = $filter('date')
									($scope.evolution.dateMepSouhaitee,
											'yyyy-MM-dd');

							$scope.evolution.dateDebutTests = $filter('date')(
									$scope.evolution.dateDebutTests,
									'yyyy-MM-dd');

							$scope.evolution.dateFinTests = $filter('date')
									($scope.evolution.dateFinTests,
											'yyyy-MM-dd');

							$scope.evolution.dateFinEffective = $filter('date')
									($scope.evolution.dateFinEffective,
											'yyyy-MM-dd');

							$scope.evolution.datePrevuCahier = $filter('date')(
									$scope.evolution.datePrevuCahier,
									'yyyy-MM-dd');

							$scope.evolution.dateEffectiveCahier = $filter(
									'date')(
									$scope.evolution.dateEffectiveCahier,
									'yyyy-MM-dd');

							console.log("enter edit function");

						}).error('errrrrr');

	};
	
	//souvegarder checkboxes 
	$scope.saveChexboxesColumns = function() {
		$http({
			method : 'POST',
			url : 'checkboxes',
			data : $scope.themen, // forms user object
			headers : {
				'Content-Type' : 'application/JSON'
			}
			
		}).success(function(){
				//console.log($scope.themen);
			alert("L'état des colonnes à exporter a été souvegardée");


		}).error(function() {
			alert("Erreur saving checkboxes");
		});

	};
	//

	$scope.update = function() {

		// calcul nombre de lignes dans un texbox
		var texbox = angular.element($('#texbox-commentaires')).val();

		numberOfLineBreaks = (texbox.match(/\n/g) || 0).length;
		characterCount = texbox.length + numberOfLineBreaks;
		console.log(numberOfLineBreaks + 1);
		$scope.evolution.kpi3 = numberOfLineBreaks + 1;

		$http({
			method : 'PUT',
			url : 'evolutions/' + $scope.evolution.idEvolution,
			data : $scope.evolution, // forms user object
			headers : {
				'Content-Type' : 'application/JSON'
			}
		}).error(function() {
			console.log("erreur sending  data");
		});

		$window.location.href = ('evols')

	}

	$scope.selectionner = function(id, selected) {
		$http({
			method : 'PUT',
			url : 'selection',
			data : "id=" + id + "&selected=" + selected, // forms
			// user
			// object
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		}).success(function() {
			console.log("success");
		}).error(function() {
			console.log("erreur sending  data put");
		});
	};
	$scope.showacceptation = {};
	$scope.EvolutionAudit = [];

	$scope.LoadAudit = function(idx, idEvolution) {
		$http.get('revisionEvolution/' + idEvolution).success(
				function(response) {
					$scope.EvolutionAudit = response;
					$scope.showacceptation[idx] = true;
					console.log($scope.EvolutionAudit);

				}).error('Audit Evolution failded');

	}
	
	
	//formulaire de modification du user
	$scope.utilisateur=[];
	$scope.editUser = function(id) {

		$location.hash('update-form-user');

		// call $anchorScroll()
		$anchorScroll();
		$http.get("users/" + id)
				.success(
						function(response) {
							$scope.utilisateur = response; // ajax request to
							// fetch
							// data into
							// $scope.data

							// transmettre les date afin que jakson les lise
						

							console.log("enter edit User form \n");
							console.log($scope.utilisateur);

						}).error('erreur getting user with id'+ id);

	};

	
	//update user informations
	$scope.updateUser = function() {
		
		if($scope.utilisateur2!=null){
			$scope.utilisateur.password=$scope.utilisateur2.password;
		}

		$http({
			method : 'PUT',
			url : 'users/' + $scope.utilisateur.id,
			data : $scope.utilisateur, // forms user object
			headers : {
				'Content-Type' : 'application/JSON'
			}
		}).error(function() {
			console.log("erreur updating user");
		});

		$window.location.href = ('listUsers')

	}
	

});


