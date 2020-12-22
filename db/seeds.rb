Poll.destroy_all
User.destroy_all

user = User.create(name: "Sara", email: "sara@epidemicSound.com", password: "password")
user1 = User.create(name: "Max", email: "max@epidemicSound.com", password: "password")
user2 = User.create(name: "Mattias", email: "mattias@epidemicSound.com", password: "password")

poll1 = Poll.create(
  title: 'API can provide polls index',
  description: 'As an API.
      In order to provide a list of polls in DB.
      I would like to provide an index endpoint for polls.',
  tasks: '
  Index action. Routes to the action. Polls model: title, description. Polls Index in serializer'
  
)
poll2 = Poll.create(
  title: 'Visitor can see list of polls',
  description: 'As a visitor.
      In order to see what polls there are.
      I would like to see the polls listed on a page.',
  tasks: 'GET request. Display polls'
)
poll3 = Poll.create(
  title: 'API provides abaility for users to create polls',
  description: 'As an API.
      In order to allow users to login & create polls.
      I would like to provide functionality to sign in & an endpoint to create action.',
  tasks: 'Create User model. Devise token auth. Create action. Associations poll-user'
)
poll4 = Poll.create(
  title: 'User can create polls',
  description: 'As a user.
      In order to make my polls public.
      I would like to be able to post my polls.',
  tasks: 'Create-new-poll button -> login filter. Sign In form. J-tok Auth. Create-poll form. POST req'
)
