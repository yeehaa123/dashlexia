Template.answerSubmit.events
  'submit form': (e, template) ->
    e.preventDefault()

    $body = $(e.target).find('[name=body]')
    answer = 
      body: $body.val(),
      questionId: template.data._id

    Meteor.call 'answer', answer, (error, answerId) ->
      if error
        Errors.throw(error.reason)
      else
        $body.val('')
