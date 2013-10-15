@newQuestionsHandle = Meteor.subscribeWithPagination('newQuestions', 10)
@bestQuestionsHandle = Meteor.subscribeWithPagination('bestQuestions', 10)

Meteor.subscribe('answers')

Deps.autorun ->
  Meteor.subscribe 'singleComment', Session.get('currentQuestionId')
  Meteor.subscribe 'answers', Session.get('currentQuestionId')

Meteor.subscribe('notifications')
