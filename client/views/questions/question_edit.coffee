Template.questionEdit.helpers
  question: ->
    Questions.findOne(Session.get('currentQuestionId'))

Template.questionEdit.events
  "submit form": (e) ->
    e.preventDefault()

    currentQuestionId = Session.get('currentQuestionId')

    questionProperties = 
      title: $(e.target).find('[name=question]').val()

    Questions.update currentQuestionId, {$set: questionProperties}, (error) ->
      if error
        Errors.throw(error.reason)
      else
        Meteor.Router.to('questionPage', currentQuestionId)

  "click .delete": (e) ->
    e.preventDefault()

    if confirm("Delete this question?")
      currentQuestionId = Session.get('currentQuestionId')
      Questions.remove(currentQuestionId)
      Meteor.Router.to('questionsList')
