Meteor.Router.add
  '/': 'questionsList'
  
  '/questions:_id':
    to: 'questionPage'
    and: (id) ->
      Session.set('currentQuestionId', id)
