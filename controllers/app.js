"use strict";

/*angular  app configuration  */
var app = angular.module('henrik', ['ngRoute']);

app.config (['$routeProvider', function ($routeProvider) {
	$routeProvider.
 	  when('/home', {
        templateUrl: 'views/home.html',
        controller: 'HomeController'
      }).
      when('/ingredients/search', {
        templateUrl: 'views/courses.html',
        controller: 'IngredientSearchResultsController'
      }).
      when('/ingredients/my', {
        templateUrl: 'views/selection.html',
        controller: 'IngredientSelsectionController'
      }).
      when('/ingredients/:categoryId', {
        templateUrl: 'views/ingredients.html',
        controller: 'IngredientsController'
      }).
      when('/courses/lastused', {
        templateUrl: 'views/courses.html',
        controller: 'LastUsedController'
      }).
      when('/course/:courseId', {
        templateUrl: 'views/course.html',
        controller: 'CourseDetailController'
      }).
      otherwise({
        redirectTo: '/home'
      });

}]);

// directive for custom icon background
app.directive('backImg', function(){
    return function(scope, element, attrs){
        var url = attrs.backImg;
        element.css({
            'background-image': 'url(' + url +')',
            'background-size' : 'cover'
        });
    };
});

// global variables 
//var apiBaseUrl = 'http://resxedit.com/api.php';
var apiBaseUrl = 'api.php';

var globalCache = {
	categories : null,
	selectedIngredients : null,
	courses : {},

	fetchCategories : function($http, callback) {
		if (globalCache.categories != null)
			callback(globalCache.categories);
		else 
 		$http.get(apiBaseUrl + '?q=categories').success(function (data, status) {
            globalCache.categories = data;
            callback(globalCache.categories);
        }).error(function (data, status) {
            alert('Service is not available. Pleasae try onece again later')
        });			
	},

	fetchCourse : function($http, courseId, callback) {
		if (globalCache.courses[courseId] != null)
			callback(globalCache.courses[courseId]);
		else 
 		$http.get(apiBaseUrl + '?q=course&id='+courseId).success(function (data, status) {
            globalCache.courses[courseId] = data;
            callback(globalCache.courses[courseId]);
        }).error(function (data, status) {
            alert('Service is not available. Pleasae try onece again later')
        });			
	}


};





function henrikController($scope, $http, $timeout, $window)  {


	$scope.GoBack = function() {
	  $window.history.back();
	};	
}


function HomeController($scope, $http, $location) {
	globalCache.fetchCategories($http, function (categories) {
		$scope.Categories = categories; 
	});

	$scope.navigateToIngredients = function (category) {
		$location.path('/ingredients/' + category.CategoryID);
	}
}

function IngredientsController($scope, $http, $routeParams, $location) {
	$scope.search = { };
	$scope.SelectedCategoryId = $routeParams.categoryId;
	// reset selection on init 
	globalCache.selectedIngredients = [];
	for(var ic in $scope.Categories){
		for (var i in $scope.Categories[ic].Ingredients){
			if ($scope.Categories[ic].Ingredients[i].IsSelected){
				globalCache.selectedIngredients.push($scope.Categories[ic].Ingredients[i].IngredientID);
			}
		}
	}


	globalCache.fetchCategories($http, function (categories) {
		$scope.Categories = categories; 
	});

	$scope.CategoryActiveClass = function (category) {
		return category.CategoryID == $scope.SelectedCategoryId ? 'active' : '';
	};

	$scope.ProceedLookup = function() {
		globalCache.selectedIngredients = [];
		for(var ic in $scope.Categories){
			for (var i in $scope.Categories[ic].Ingredients){
				if ($scope.Categories[ic].Ingredients[i].IsSelected){
					globalCache.selectedIngredients.push($scope.Categories[ic].Ingredients[i].IngredientID);
				}
			}
		}
		$location.path('/ingredients/search');
		return false;
	};
}

function IngredientSearchResultsController($scope, $http) {
	$scope.Title = 'Treff';
 		$http.get(apiBaseUrl + '?q=findcourses&ingredients='+JSON.stringify(globalCache.selectedIngredients)).success(function (data, status) {
 			$scope.Courses = data;
        }).error(function (data, status) {
            alert('Service is not available. Pleasae try onece again later')
        });	
}
function LastUsedController($scope, $http) {
	$scope.Title = 'Sist brukte';
 		$http.get(apiBaseUrl + '?q=lastusedcourses').success(function (data, status) {
 			$scope.Courses = data;
        }).error(function (data, status) {
            alert('Service is not available. Pleasae try onece again later')
        });	
}
function CourseDetailController($scope, $http, $location, $routeParams, $window) {
	$scope.CourseId = $routeParams.courseId;
	globalCache.fetchCourse($http, $scope.CourseId, function (course) {
		$scope.Course = course;
	});


}

function IngredientSelsectionController($scope, $http, $location, $routeParams, $window) {
		// reset selection on init 


	$scope.AnySelected = globalCache.selectedIngredients != null &&  globalCache.selectedIngredients.length > 0;

	globalCache.fetchCategories($http, function (categories) {
		$scope.Categories = categories; 
		globalCache.selectedIngredients = [];
		for(var ic in $scope.Categories){
			for (var i in $scope.Categories[ic].Ingredients){
				if ($scope.Categories[ic].Ingredients[i].IsSelected){
					globalCache.selectedIngredients.push($scope.Categories[ic].Ingredients[i].IngredientID);
				}
			}
		}		
		/*
		for(var ic in $scope.Categories){
			for (var i in $scope.Categories[ic].Ingredients){
				
				for (var si in globalCache.selectedIngredients)
					if ($scope.Categories[ic].Ingredients[i].IngredientID == globalCache.selectedIngredients[si]){
						$scope.Categories[ic].Ingredients[i].IsSelected = true;
					}

			}
		}
		*/				
		$scope.AnySelected = globalCache.selectedIngredients != null &&  globalCache.selectedIngredients.length > 0;
	});

	$scope.updteSelectionEntries = function () {
		globalCache.selectedIngredients = [];
		for(var ic in $scope.Categories){
			for (var i in $scope.Categories[ic].Ingredients){
				if ($scope.Categories[ic].Ingredients[i].IsSelected){
					globalCache.selectedIngredients.push($scope.Categories[ic].Ingredients[i].IngredientID);
				}
			}
		}		
		$scope.AnySelected = globalCache.selectedIngredients != null &&  globalCache.selectedIngredients.length > 0;
	}

	$scope.clearAll = function () {
		for(var ic in $scope.Categories){
			for (var i in $scope.Categories[ic].Ingredients){
				$scope.Categories[ic].Ingredients[i].IsSelected = false;
			}
		}

		globalCache.selectedIngredients = [];
		$scope.AnySelected = false;
	};

	$scope.DeleteIngredient = function(ingredient) {
		ingredient.IsSelected = false;

		$scope.updteSelectionEntries();
	};

}
