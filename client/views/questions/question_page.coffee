Template.questionPage.helpers
  currentQuestion: ->
    Questions.findOne(Session.get('currentQuestionId'))

  answers: ->
    Answers.find({questionId: this._id })
