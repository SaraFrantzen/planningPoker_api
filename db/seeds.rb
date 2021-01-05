Poll.destroy_all
User.destroy_all

user1 = User.create(name: "Max", email: "max@epidemicSound.com", password: "password")
user2 = User.create(name: "Mattias", email: "mattias@epidemicSound.com", password: "password")
user = User.create(name: "Sara", email: "sara@epidemicSound.com", password: "password")

poll1 = Poll.create(
  title: 'API can provide polls index',
  description: 'As an API. In order to provide a list of polls in DB. I would like to provide an index endpoint for polls.',
  tasks: 'Index action. Routes to the action. Polls model: title, description. Polls Index in serializer',
  points: [1],
  user_id: user.id
)

