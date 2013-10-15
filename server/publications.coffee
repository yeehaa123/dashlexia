Meteor.publish 'newQuestions', (limit) ->
  Questions.find({}, {sort: {submitted: -1}, limit: limit})
  
Meteor.publish 'bestQuestions', (limit) ->
  Questions.find({}, {sort: {votes: -1, submitted: -1}, limit: limit})

Meteor.publish 'singleQuestion', (id) ->
  id && Questions.find(id)
  
Meteor.publish 'answers', (questionId) ->
  Answers.find({questionId: questionId})

Meteor.publish 'notifications', ->
  Notifications.find(userId: @userId)
