@todosApp.controller "SignupController", ['$cookieStore', '$rootScope', "$scope", "Auth", '$http', '$timeout', ($cookieStore, $rootScope, $scope, Auth, $http, $timeout) ->
  $scope.signUp = ->
    response = $http.post('/api/v1/user', $scope.user)
    response.success (data)=>
      Auth.setUser data.user
    response.error (data)=>
      $scope.error = data
      $timeout ()=>
        $scope.error = undefined
      , 1000
  ]