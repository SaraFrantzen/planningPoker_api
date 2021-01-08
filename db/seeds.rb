Poll.destroy_all
User.destroy_all

user = User.create(name: "User", email: "user@mail", password: "password")
user1 = User.create(name: "Max", email: "max@epidemicSound.com", password: "password")
user2 = User.create(name: "Mattias", email: "mattias@epidemicSound.com", password: "password")
user = User.create(name: "Sara", email: "sara@epidemicSound.com", password: "password")

poll1 = Poll.create(
  title: 'API can provide polls index',
  description: 'As an API. In order to provide a list of polls in DB. I would like to provide an index endpoint for polls.',
  tasks: 'Index action. Routes to the action. Polls model: title, description. Polls Index in serializer',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)
poll2 = Poll.create(
  title: 'Visitor can see list of polls',
  description: 'As a visitor. In order to see what polls there are. I would like to see the polls listed on a page.',
  tasks: 'GET request. Display polls',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103536110-310c1800-4e92-11eb-87ca-86eef4f147b8.jpg')
poll2.image.attach(io: file, filename: 'image1.jpg')

poll3 = Poll.create(
  title: 'API provides abaility for users to create polls',
  description: 'As an API. In order to allow users to login & create polls. I would like to provide functionality to sign in, 
  and an endpoint to create action.',
  tasks: 'Create User model. Devise token auth. Create action. Associations poll-user',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll4 = Poll.create(
  title: 'User can create polls',
  description: 'As a user. In order to make my polls public. I would like to be able to post my polls.',
  tasks: 'Create-new-poll button -> login filter. Sign In form. J-tok Auth. Create-poll form. POST req',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564601-17cd9080-4ebf-11eb-9215-1b4e79ad7a3b.jpg')
poll4.image.attach(io: file, filename: 'create.jpg')

poll5 = Poll.create(
  title: 'API provides ability to see single poll',
  description: 'As an API. In order to provide an specific poll with all its attributes. I would like to have a show action.',
  tasks: 'Show action, routes to that action. Serializer',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll6 = Poll.create(
  title: 'Visitor can see single poll',
  description: 'As a visitor. In order to see the specifications of the published poll. I would like to read the full content of a single poll.',
  tasks: 'Make card clickable. Create Single poll page with GET req',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103560884-df2ab880-4eb8-11eb-8ac1-6f855e6baeaa.jpg')
poll6.image.attach(io: file, filename: 'singlePoll.jpg')

poll7 = Poll.create(
  title: 'User can join pre-existing poll',
  description: 'As a user. In order to join a poll i will be working on. I would like to have a join button.',
  tasks: 'Button "join-poll" - takes visitor to login if not authenticated. PUT req',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103561371-af2fe500-4eb9-11eb-86df-8195d7af5f00.jpg')
poll7.image.attach(io: file, filename: 'join.jpg')

poll8 = Poll.create(
  title: 'API provides ability to join a poll',
  description: 'As an API. In order to let users join a poll. I would like to have a put action',
  tasks: 'Add attribute :team to the polls model. PUT action that updates the team with user.id to specific poll',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll9 = Poll.create(
  title: ' User can vote',
  description: 'As a user. In order to vote on a poll. I vould like to be able to pick a point and click a vote button',
  tasks: 'Form Select with points. Vote button - PUT req. Display voted points',
  points: [2],
  votes: { "Sara": 2},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103561744-3d0bd000-4eba-11eb-92c2-91ba76bc93ed.jpg')
poll9.image.attach(io: file, filename: 'vote.jpg')

poll10 = Poll.create(
  title: 'API provides ability to vote on a poll',
  description: 'As an API. In order to let users vote on a poll. I would like to have a put action',
  tasks: 'attribute :votes as a hash with key:value pairs {email:points}',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll11 = Poll.create(
  title: 'Visitor can see voting-points result',
  description: 'As a visitor. In order to see the status of the voting. I would like to see how many users have voted for each point',
  tasks: 'Create loop that iterates over the votes array. Display number of votes for each point',
  points: [0],
  votes: { "Sara": 0},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103562341-2f0a7f00-4ebb-11eb-8304-9b926429f00a.jpg')
poll11.image.attach(io: file, filename: 'currentStatus.jpg')

poll12 = Poll.create(
  title: 'API provides ability to re-vote on a poll ',
  description: 'As an API. In order to let users change their vote. I would like to have a put action for deleting previous vote',
  tasks: 'Delete users previous vote from :votes',
  points: [2],
  votes: { "Sara": 2},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll13 = Poll.create(
  title: 'User can re-vote on a poll',
  description: 'As a user. In the case i change my mind regarding my vote. I would like to be able to re-vote',
  tasks: 'Re-vote button -> PUT req - deletes previous vote and then opens the voting form again',
  points: [2],
  votes: { "Sara": 2},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564137-56168000-4ebe-11eb-832d-4d878828ee7c.jpg')
poll13.image.attach(io: file, filename: 'reVote.jpg')

poll14 = Poll.create(
  title: 'API provides ability to attach image to poll',
  description: 'As a API. In order for users to attach images to their polls. I would like to be able to attach an image for a specific poll',
  tasks: 'Active-storage. gem: aws-sdk-s3 and configurations for storage. has_one_attached image to polls model. def attach_image in polls controller.',
  points: [2],
  votes: { "Sara": 2},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll15 = Poll.create(
  title: 'User can attach image to poll',
  description: 'As a user. In order to make my polls more understandable. I would like to be able to upload a image to my poll.',
  tasks: 'Include image in Polls.create POST req. Functionality for encoding images using toBase64. Cypress-file-upload',
  points: [1],
  votes: { "Sara": 1},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564256-7d6d4d00-4ebe-11eb-875d-e7aed92ec5e1.jpg')
poll15.image.attach(io: file, filename: 'imageUpload.jpg')

poll16 = Poll.create(
  title: 'API provides ability to display pictures in single poll ',
  description: 'As an API. In order to provide an specific poll with all its picture. I would like to include the picture attribute in show action',
  tasks: 'Add images to seedfile. Add images to show serializer',
  points: [0],
  votes: { "Sara": 0},
  team: ["Sara"],
  category: "api",
  user_id: user.id
)

poll17 = Poll.create(
  title: 'Visitor can see pictures in polls',
  description: 'As a visitor. In order to see Lo-fis. Id like to be able to get picture of Lo-Fi displayed with polls',
  tasks: 'Display image',
  points: [0],
  votes: { "Sara": 0},
  team: ["Sara"],
  category: "client",
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564914-a6daa880-4ebf-11eb-8ce7-96ac6868496a.jpg')
poll17.image.attach(io: file, filename: 'pictureVisible.jpg')
