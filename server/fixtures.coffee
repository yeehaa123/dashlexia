if Questions.find().count() is 0
  now = new Date().getTime()
  day = 3600 * 1000

  yeehaaId = Meteor.users.insert
    profile: { name: "Jan Hein Hoogstad" }

  yeehaa = Meteor.users.findOne(yeehaaId)

  marijnId = Meteor.users.insert
    profile: { name: "Marijn Koolen" }

  marijn = Meteor.users.findOne(marijnId)
  
  questionId = Questions.insert
    title: "What am I doing here?"
    userId: yeehaa._id
    author: yeehaa.profile.name
    submitted: now - 7 * day
    answersCount: 1
    upvoters: []
    votes: 0
    
  Answers.insert
    questionId: questionId
    userId: marijn._id
    author: marijn.profile.name
    submitted: now - 5 * day
    body: "Because you have to Jan Hein"

  for num in [1..30] 
    Questions.insert
      title: "Test #{num}"
      userId: yeehaa._id
      author: yeehaa.profile.name
      submitted: now - num * day
      answersCount: 0
      upvoters: []
      votes: 0

