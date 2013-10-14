@Notifications = new Meteor.Collection('notifications')

Notifications.allow
  update: ownsDocument

@createAnswerNotification = (answer) ->
  question = Questions.findOne(answer.questionId)

  if answer.userId isnt question.userId
    Notifications.insert
      userId: question.userId
      questionId: question._id
      answerId: answer._id
      answererName: answer.author
      read: false
