Meteor.publish 'questions', ->
  Questions.find()
  
Meteor.publish 'answers', (questionId) ->
  Answers.find({questionId: questionId})

Meteor.publish 'notifications', ->
  Notifications.find(userId: @userId)
