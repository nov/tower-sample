h2 "Welcome, #{@currentUser?.get("name") || "Anonymous"}!"

if @currentUser?
  linkTo 'Log Out', everyauth.everymodule.logoutPath()
else
  linkTo 'FB Login', everyauth.facebook.entryPath()