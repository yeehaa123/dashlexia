Template.questionSubmit.events
  "submit form": (e) ->
    e.preventDefault()
    question =
      title: $(e.target).find('[name=question]').val()

    question._id = Questions.insert(question)
    Meteor.Router.to('questionPage', question)
