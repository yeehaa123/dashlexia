Template.header.helpers
  activeRouteClass: (bla) ->
    args = Array.prototype.slice.call(arguments, 0)
    args.pop()

    active = _.any args, (name) ->
      location.pathname is Meteor.Router["#{name}Path"]()

    return active and 'active'
