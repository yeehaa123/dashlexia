Meteor.publish 'questions', ->
  Questions.find()
  
Meteor.publish 'answers', (questionId) ->
  Answers.find({questionId: questionId})
