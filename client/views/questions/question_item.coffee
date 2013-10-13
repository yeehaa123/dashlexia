Template.questionItem.helpers
  ownQuestion: () ->
    @userId is Meteor.userId()
