Poll.destroy_all
Poll.create(
  [
    {
      title: 'API can provide polls index',
      description: 'As an API
      In order to provide a list of polls in DB
      I would like to provide an index endpoint for polls'
    },
    {
      title: 'Visitor can see list of polls',
      description: 'As a visitor
      In order to see what polls there are
      I would like to see the polls listed on a page'
    }, {
      title: 'API provides abaility for users to create polls',
      description: 'As an API
      In order to allow users to login & create polls
      I would like to provide functionality to sign in & an endpoint to create action'
    }, {
      title: 'User can create polls',
      description: 'As a user
      In order to make my polls public
      I would like to be able to post my polls'
    }
  ]
)
