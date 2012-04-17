class App.ApplicationController extends Tower.Controller
  @layout "application"

  @beforeAction (next) ->
    App.User.where(id: @request.session.userId).first (error, user) =>
      @currentUser = user
      next()

  welcome: ->
    @render "welcome"
