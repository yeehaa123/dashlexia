Template.questionItem.helpers
  ownQuestion: ->
    @userId is Meteor.userId()

  upvotedClass: ->
    userId = Meteor.userId()
    if userId and not _.include(@upvoters, userId)
      'btn-primary upvotable'
    else
      'disabled'

Template.questionItem.events
  'click .upvotable': (e) ->
    e.preventDefault()
    Meteor.call('upvote', @_id)
