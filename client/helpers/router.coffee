Meteor.Router.add
  '/': {to: 'newQuestions', as: 'home'}
  '/best': 'bestQuestions'
  '/new': 'newQuestions'
  
  '/questions/:_id':
    to: 'questionPage'
    and: (id) ->
      Session.set('currentQuestionId', id)

  '/questions/:_id/edit':
    to: 'questionEdit'
    and: (id) ->
      Session.set('currentQuestionId', id)


Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      page
    else if Meteor.loggingIn()
      'loading'
    else
      'accessDenied'

  'clearErrors': (page) ->
    Errors.clearSeen()
    page

# Meteor.Router.filter('requireLogin')
Meteor.Router.filter('clearErrors')
