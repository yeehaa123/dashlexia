Package.describe
  summary: "A pattern to display application errors to the user"

Package.on_use (api, where) ->
  api.use(['coffeescript', 'minimongo', 'mongo-livedata', 'templating'], 'client')

  api.add_files(['errors.coffee', 'errors_list.html', 'errors_list.coffee'], 'client')
  
  if (api.export)
    api.export('Errors')

Package.on_test (api) ->
  api.use('errors', 'client')

  api.use(['coffeescript', 'tinytest', 'test-helpers'], 'client')

  api.add_files('errors_tests.coffee', 'client')
