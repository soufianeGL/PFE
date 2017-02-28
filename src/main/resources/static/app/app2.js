var app = angular.module('angularTable2', [ 'ngMessages' ]);

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

app.factory('FlashService', function ($rootScope) {

    return {
        show: function (message) {
            $rootScope.flash = message;
            return message;
        },
        clear: function () {
            $rootScope.flash = '';
            return null;
        }
    };
});

app.controller('cprController', function($scope, $http, $location, $window,FlashService) {
	$http.get("cprecettes").success(function(data) {
		$scope.cprs = data; // ajax request to fetch data into
		// $scope.data
	}).error(function() {
		console.log("erreur cprecette get non valide");
	});

	// post data
	$scope.evolution = {};
	$scope.utilisateurs=[];

	$http.get("cpsi").success(function(data) {
		$scope.cpsi = data; // ajax request to fetch data into
		
		console.log("enter ../cpsi");
		// $scope.data
	}).error(function() {
		console.log("erreur cpsi get non valide");
	});
	
	
	
	//getsuserProfiles
	$scope.userProfiles=[];
	$http.get("userProfiles").success(function(data) {
		$scope.userProfiles = data; // ajax request to fetch data into
		console.log("enter UserProfile");
		// $scope.data
	}).error(function() {
		console.log("erreur userProfile get non valide");
	});
	


	//souvegarder Evolution 
	$scope.save = function() {
		var myEl = angular.element($('#type1')).val();
		$scope.evolution.refEvolution = myEl;
		console.log("enter evolutions");


		$http({
			method : 'POST',
			url : 'evolutions',
			data : $scope.evolution, // forms user object
			headers : {
				'Content-Type' : 'application/JSON'
			}
			
		}).success(function(){
			
				//FlashService.show("created evolution successfully");
				$window.location.href = ('home');


		}).error(function() {
			alert("Erreur lors de l'enregistrement de l'évolution");
		});

	};
	//souvegarder Cpsi
	$scope.saveUser = function() {

		$http({
			method : 'POST',
			url : 'user',
			data : $scope.utilisateur, // forms user object
			headers : {
				'Content-Type' : 'application/JSON'
			}
		}).success(function(){
			$window.location.href = ('listUsers')

		}).error(function() {
			alert("Utilisateur non enregistré");
		});


	};

});