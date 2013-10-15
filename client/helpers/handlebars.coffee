Handlebars.registerHelper 'pluralize', (n, thing) ->
  if n is 1
    "#{n} #{thing}"
  else
    "#{n} #{thing}s"
