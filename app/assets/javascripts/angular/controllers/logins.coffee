@todosApp.controller "LoginController",['$rootScope', "$scope", "Auth", '$http', '$timeout', ($rootScope, $scope, Auth, $http, $timeout) ->
  $scope.login = ->
    response = $http.post('/api/v1/session', $scope.user)
    response.success (data)=>
      Auth.setUser data.user
    response.error (data)=>
      $scope.error = data
      $timeout ()=>
        $scope.error = undefined
      , 1000
  ]