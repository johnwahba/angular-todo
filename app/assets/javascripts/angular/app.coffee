@todosApp = angular.module('todo', ['ngRoute', 'ngCookies', 'ngResource'])


@todosApp.config [
  "$routeProvider"
  '$locationProvider'
  '$httpProvider'
  ($routeProvider, $locationProvider, $httpProvider) ->
    $httpProvider.defaults.withCredentials = true;
    $locationProvider.html5Mode(false);
    $routeProvider.when "/login", {templateUrl: "/login.html"}
      .when "/home", {templateUrl: "/home.html"}
      .otherwise redirectTo : '/home'
]