@todosApp.controller "TodosController", ['$resource','$http', "$scope","Auth","$location", ($resource, $http, $scope, Auth, $location) ->
  Todos = $resource('/api/v1/todos/:id', {api_key: Auth.user().api_key}, 
    {update: { method: 'PUT', params: {id: '@id'}  }})
  
  $scope.todos = Todos.query()
  $scope.new = true

  $scope.update = (todo) ->
    Todos.update(todo)
    todo.editing = false
  
  $scope.create = (todo) ->
    Todos.save(todo)
    $scope.currentTodo = {}

  $scope.destroy = (todo) ->
    Todos.delete(todo)
    Todos.query (data)->
      $scope.todos = data

  $scope.edit = (todo) ->
    $scope.new = false
    $scope.currentTodo = todo

  $scope.logout= ->
    $http.delete('/api/v1/session', Auth.user())
    Auth.unsetUser()
  ]

