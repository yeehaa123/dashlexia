questionsData = [
  title: "What am I doing here?"
, 
  title: "How long is this going to take?"
]

Template.questionsList.helpers
  questions: ->
    Questions.find()
