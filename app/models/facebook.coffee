class App.Facebook extends Tower.Model
  @field "id", type: "Id"
  @field "identifier", type: "String"
  @field "accessToken", type: "String"
  @timestamps()

  @belongsTo "user"

  @validates "identifier"
    presence: true
    uniqueness: true
  @validates "accessToken"
    presence: true
    uniqueness: true

  @authenticate: (accessToken, profile, promise) ->
    succeeded = (user) ->
      promise.fulfill user
    failed = ->
      promise.fail 'Authentication Failed'
    @.where(identifier: profile.id).includes("user").first (error, connect) =>
      connect ||= @.build
        identifier: profile.id
        accessToken: accessToken
      connect.user().first (error, user) ->
        user ||= connect.user().build
          name: profile.name
          email: profile.email
        connect.set "accessToken", accessToken
        connect.save (error, result) ->
          if error || result == false
            failed
          else
            user.save (error, result) ->
              if error || result == false
                failed
              else
                succeeded user