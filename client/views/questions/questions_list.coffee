Template.newQuestions.helpers
  options: ->
    sort: {submitted: -1}
    handle: newQuestionsHandle

Template.bestQuestions.helpers
  options: ->
    sort: {votes: -1, submitted: -1}
    handle: bestQuestionsHandle

Template.questionsList.helpers
  questions: ->
    Questions.find({}, {sort: @sort, limit: @handle.limit()})

  questionsReady: ->
    @handle.ready()

  allQuestionsLoaded: ->
    @handle.ready() and Questions.find().count() < @handle.loaded()

Template.questionsList.events
  'click .load-more': (e) ->
    e.preventDefault()
    @handle.loadNextPage()
