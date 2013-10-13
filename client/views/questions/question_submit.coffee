Template.questionSubmit.events
  "submit form": (e) ->
    e.preventDefault()
    question =
      title: $(e.target).find('[name=question]').val()


    Meteor.call 'post', question, (error, id) ->
      if error
        Errors.throw(error.reason)
      else
        Meteor.Router.to('questionPage', id)
