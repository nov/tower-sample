module.exports =
  title:        "Tower"
  description:  ""
  keywords:     ""
  author:       "nov matake"
  year:         "2012"
  copyright:    "&copy; undefined nov matake. All rights reserved."
  robots:       "noodp,noydir,index,follow"
  github:       "nov"
  email:        "nov@matake.jp"
  
  titles:
    index: "%{name}"
    show: "%{name} overview"
    new: "Create a new %{name}"
    edit: "Editing %{name}"
  
  links:
    default: "%{name}"
    home: "Home"
    docs: "Docs"
  
  openGraph:
    siteName:       "Tower"
    title:          "Tower"
    description:    ""
    type:           "website"
    url:            ""
    image:          ""

  # NOTE:
  # For some reason, tower.js requires those strings defined..
  model:
    errors:
      uniqueness: "Not Unique"