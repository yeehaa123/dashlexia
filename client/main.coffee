Meteor.subscribe('questions')
Meteor.subscribe('answers')

Deps.autorun ->
  Meteor.subscribe 'answers', Session.get('currentQuestionId')
