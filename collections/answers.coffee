@Answers = new Meteor.Collection('answers')

Meteor.methods
  answer: (answerAttributes) ->
    user = Meteor.user()
    question = Questions.findOne(answerAttributes.questionId)

    if not user
      throw new Meteor.Error(401, "You need to login to make comments")
    
    if not answerAttributes.body
      throw new Meteor.Error(422, "Please write some content")

    if not answerAttributes.questionId
      throw new Meteor.Error(422, "You must comment on a post")

    answer = _.extend _.pick(answerAttributes, 'questionId', 'body'),
      userId: user._id
      author: user.username,
      submitted: new Date().getTime()

    Questions.update(answer.questionId, {$inc: {answersCount: 1}})

    Answers.insert(answer)
