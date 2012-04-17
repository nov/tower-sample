class App.User extends Tower.Model
  @field "id", type: "Id"
  @field "name", type: "String", default: "Anonymous"
  @field "email", type: "String"
  @timestamps()

  @hasOne "facebook"

  @validates "email", presence: true, uniqueness: true
