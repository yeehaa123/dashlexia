Template.questionPage.helpers
  currentQuestion: ->
    Questions.findOne(Session.get('currentQuestionId'))
