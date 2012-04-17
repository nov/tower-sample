everyauth = require "everyauth"

unless Tower.env is 'production'
  Tower.config.credentials.facebook.key = Tower.config.credentials.facebook.development.key
  Tower.config.credentials.facebook.secret = Tower.config.credentials.facebook.development.secret
else
  Tower.config.credentials.facebook.key = Tower.config.credentials.facebook.production.key
  Tower.config.credentials.facebook.secret = Tower.config.credentials.facebook.production.secret

# Logout Handling
everyauth.everymodule.logoutPath('/logout')
everyauth.everymodule.logoutRedirectPath('/')
everyauth.everymodule.handleLogout (request, response) ->
  request.logout()
  request.session.userId = undefined
  @redirect response, @logoutRedirectPath()

# Facebook Login
everyauth.facebook.appId(
  Tower.config.credentials.facebook.key
).appSecret(
  Tower.config.credentials.facebook.secret
).scope(
  'email'
).handleAuthCallbackError(
  (request, response) ->
    response.redirect("/login")
).findOrCreateUser(
  (session, accessToken, accessTokenExtra, profile) ->
    promise = @Promise()
    promise.callback (user) ->
      session.userId = user.get("id")
      session.save()
    App.Facebook.authenticate accessToken, profile, promise
    promise
).redirectPath('/')
