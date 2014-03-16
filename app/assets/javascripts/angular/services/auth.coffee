@todosApp.factory "Auth",['$location', '$cookieStore', ($location, $cookieStore)->
  {
    unsetUser: ->
      $cookieStore.put('user', '')
      $location.path '/login'  
    setUser: (aUser) ->
      $cookieStore.put('user', aUser)
      $location.path '/home'  
    isLoggedIn: ->
      !!$cookieStore.get('user')
    user: ->
      $cookieStore.get('user')
  }
  ]

@todosApp.run ["$rootScope", "$location", "Auth", ($rootScope, $location, Auth) ->
    $rootScope.$on "$routeChangeStart", ->
      unless Auth.isLoggedIn()
        event.preventDefault()
        $location.path "/login"
      else
        $location.path '/home'
    # $rootScope.$watch Auth.isLoggedIn(), (value, oldValue) ->
    #   if not value && $location.path is not "/login"
    #     $location.path "/login"
    #   else if value && $location.path is not "/home"
    #     $location.path "/home"
  ]
