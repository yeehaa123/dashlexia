@Questions = new Meteor.Collection("questions")

Questions.allow
  update: ownsDocument
  remove: ownsDocument

Questions.deny
  update: (userId, question, fieldNames) ->
    (_.without(fieldNames, 'title').length > 0)

Meteor.methods
  post: (questionAttributes) ->
    user = Meteor.user()

    unless user
      throw new Meteor.Error(401, "You need to login to post questions")

    unless questionAttributes.title
      throw new Meteor.Error(422, "Please fill in a question")

    question = _.extend(_.pick(questionAttributes, 'title'), 
      userId: user._id
      author: user.username
      submitted: new Date().getTime()
      answersCount: 0
      upvoters: []
      votes: 0
    )
    
    questionId = Questions.insert(question)

  upvote: (questionId) ->
    user = Meteor.user()
    if not user
      throw new Meteor.Error(401, "You need to login to upvote")

    Questions.update 
      _id: questionId,
      upvoters: {$ne: user.id}
    ,
      $addToSet: {upvoters: user._id}
      $inc: {votes: 1}
