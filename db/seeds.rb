Poll.destroy_all
User.destroy_all

user = User.create(name: 'User', email: 'user@mail.com', password: 'password')
user1 = User.create(name: 'Max', email: 'max@epidemicSound.com', password: 'password')
user2 = User.create(name: 'Mattias', email: 'mattias@epidemicSound.com', password: 'password')
user3 = User.create(name: 'Hayne', email: 'hayne@epidemicsound.com', password: 'password')
user4 = User.create(name: 'Björn', email: 'bjorn@epidemicSound.com', password: 'password')
user = User.create(name: 'Sara', email: 'sara@epidemicSound.com', password: 'password')

poll1 = Poll.create(
  title: 'API can provide polls index',
  description: 'As an API. In order to provide a list of polls in DB. I would like to provide an index endpoint for polls.',
  tasks: 'Index action. Routes to the action. Polls model: title, description. Polls Index in serializer',
  votes: { "Sara": 1 },
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)
poll2 = Poll.create(
  title: 'Visitor can see list of polls',
  description: 'As a visitor. In order to see what polls there are. I would like to see the polls listed on a page.',
  tasks: 'GET request. Display polls',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103536110-310c1800-4e92-11eb-87ca-86eef4f147b8.jpg')
poll2.image.attach(io: file, filename: 'image1.jpg')

poll3 = Poll.create(
  title: 'API provides abaility for users to create polls',
  description: 'As an API. In order to allow users to login & create polls. I would like to provide functionality to sign in,
  and an endpoint to create action.',
  tasks: 'Create User model. Devise token auth. Create action. Associations poll-user',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll4 = Poll.create(
  title: 'User can create polls',
  description: 'As a user. In order to make my polls public. I would like to be able to post my polls.',
  tasks: 'Create-new-poll button -> login filter. Sign In form. J-tok Auth. Create-poll form. POST req',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564601-17cd9080-4ebf-11eb-9215-1b4e79ad7a3b.jpg')
poll4.image.attach(io: file, filename: 'create.jpg')

poll5 = Poll.create(
  title: 'API provides ability to see single poll',
  description: 'As an API. In order to provide an specific poll with all its attributes. I would like to have a show action.',
  tasks: 'Show action, routes to that action. Serializer',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll6 = Poll.create(
  title: 'Visitor can see single poll',
  description: 'As a visitor. In order to see the specifications of the published poll. I would like to read the full content of a single poll.',
  tasks: 'Make card clickable. Create Single poll page with GET req',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103560884-df2ab880-4eb8-11eb-8ac1-6f855e6baeaa.jpg')
poll6.image.attach(io: file, filename: 'singlePoll.jpg')

poll7 = Poll.create(
  title: 'User can join pre-existing poll',
  description: 'As a user. In order to join a poll i will be working on. I would like to have a join button.',
  tasks: 'Button "join-poll" - takes visitor to login if not authenticated. PUT req',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103561371-af2fe500-4eb9-11eb-86df-8195d7af5f00.jpg')
poll7.image.attach(io: file, filename: 'join.jpg')

poll8 = Poll.create(
  title: 'API provides ability to join a poll',
  description: 'As an API. In order to let users join a poll. I would like to have a put action',
  tasks: 'Add attribute :team to the polls model. PUT action that updates the team with user.id to specific poll',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll9 = Poll.create(
  title: ' User can vote',
  description: 'As a user. In order to vote on a poll. I vould like to be able to pick a point and click a vote button',
  tasks: 'Form Select with points. Vote button - PUT req. Display voted points',
  votes: { "Sara": 2},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103561744-3d0bd000-4eba-11eb-92c2-91ba76bc93ed.jpg')
poll9.image.attach(io: file, filename: 'vote.jpg')

poll10 = Poll.create(
  title: 'API provides ability to vote on a poll',
  description: 'As an API. In order to let users vote on a poll. I would like to have a put action',
  tasks: 'attribute :votes as a hash with key:value pairs {email:points}',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll11 = Poll.create(
  title: 'Visitor can see voting-points result',
  description: 'As a visitor. In order to see the status of the voting. I would like to see how many users have voted for each point',
  tasks: 'Create loop that iterates over the votes array. Display number of votes for each point',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103562341-2f0a7f00-4ebb-11eb-8304-9b926429f00a.jpg')
poll11.image.attach(io: file, filename: 'currentStatus.jpg')

poll12 = Poll.create(
  title: 'API provides ability to re-vote on a poll ',
  description: 'As an API. In order to let users change their vote. I would like to have a put action for deleting previous vote',
  tasks: 'Delete users previous vote from :votes',
  votes: { "Sara": 2},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll13 = Poll.create(
  title: 'User can re-vote on a poll',
  description: 'As a user. In the case i change my mind regarding my vote. I would like to be able to re-vote',
  tasks: 'Re-vote button -> PUT req - deletes previous vote and then opens the voting form again',
  votes: { "Sara": 2},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564137-56168000-4ebe-11eb-832d-4d878828ee7c.jpg')
poll13.image.attach(io: file, filename: 'reVote.jpg')

poll14 = Poll.create(
  title: 'API provides ability to attach image to poll',
  description: 'As a API. In order for users to attach images to their polls. I would like to be able to attach an image for a specific poll',
  tasks: 'Active-storage. gem: aws-sdk-s3 and configurations for storage. has_one_attached image to polls model. def attach_image in polls controller.',
  votes: { "Sara": 2},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll15 = Poll.create(
  title: 'User can attach image to poll',
  description: 'As a user. In order to make my polls more understandable. I would like to be able to upload a image to my poll.',
  tasks: 'Include image in Polls.create POST req. Functionality for encoding images using toBase64. Cypress-file-upload',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564256-7d6d4d00-4ebe-11eb-875d-e7aed92ec5e1.jpg')
poll15.image.attach(io: file, filename: 'imageUpload.jpg')

poll16 = Poll.create(
  title: 'API provides ability to display pictures in single poll ',
  description: 'As an API. In order to provide an specific poll with all its picture. I would like to include the picture attribute in show action',
  tasks: 'Add images to seedfile. Add images to show serializer',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll17 = Poll.create(
  title: 'Visitor can see pictures in polls',
  description: 'As a visitor. In order to see Lo-fis. Id like to be able to get picture of Lo-Fi displayed with polls',
  tasks: 'Display image',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/103564914-a6daa880-4ebf-11eb-8ce7-96ac6868496a.jpg')
poll17.image.attach(io: file, filename: 'pictureVisible.jpg')

poll18 = Poll.create(
  title: 'API provides ability to comment on a poll',
  description: 'As a API. In order to allow comments on a poll. I would like to have a comments model.',
  tasks: 'Comments controller. Comments model. Routes for comments create',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll19 = Poll.create(
  title: 'User can post a comment to a poll',
  description: 'As a user. In order to be able to discuss the poll. I would like to be able to post a comment.',
  tasks: 'Form for comments. POST request',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/104087255-a8f58c00-525e-11eb-89dd-810473e4234b.jpg')
poll19.image.attach(io: file, filename: 'pictureVisible.jpg')

poll20 = Poll.create(
  title: 'API provides ability to display comments',
  description: 'As an API. In order to be able to display comments. I would like to have a show action for comments.',
  tasks: 'Routes. Comments show serializer. Show action in comments controller.',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll21 = Poll.create(
  title: 'Visitor can see posted comments in poll',
  description: 'As a visitor. In order to know how the discussion regarding the poll goes. I would like to be able to see posted comments. ',
  tasks: 'GET request. Display comments',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/104087596-320dc280-5261-11eb-80b8-ac7ae9f3819c.jpg')
poll21.image.attach(io: file, filename: 'pictureVisible.jpg')

poll22 = Poll.create(
  title: 'API provides ability to change poll state',
  description: 'As an Api. In order to close for voting. I would like to be able to change the poll state attribute',
  tasks: 'Migration: add state to poll. State attr in polls model. Define state_update in polls controller. Add state in polls show serializer',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll23 = Poll.create(
  title: 'User can close voting',
  description: 'As a user. In order to proceed with the poll. I would like to be able to close for voting and see the votings result.',
  tasks: 'PUT request, params "state":"pending". Display who voted what',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/104087945-83b74c80-5263-11eb-8041-ede0f6ac6ad5.jpg')
poll23.image.attach(io: file, filename: 'pictureVisible.jpg')

poll24 = Poll.create(
  title: 'API provides ability to close poll',
  description: 'As an API. In order to change the Poll.state from pending to close. I would like to be able to have a :result attribut.',
  tasks: 'Migration: add result attribute to poll. Define result_update in polls controller',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll25 = Poll.create(
  title: 'User can assign result to poll',
  description: 'As a user. In order to complete a poll. I would like to be able to assign a result value.',
  tasks: 'PUT request to update poll with result value. Display final points in polls card',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/104088179-31772b00-5265-11eb-9a0c-e3277818bfc8.jpg')
poll25.image.attach(io: file, filename: 'pictureVisible.jpg')

poll26 = Poll.create(
  title: 'API can provide polls categorized',
  description: 'As an API. In order to give the client better sorted polls. I would like to be able to send off the polls with their category listed',
  tasks: 'Migration add category to poll. If statement for params category in polls controller. Define enum category in polls model',
  votes: { "Sara": 0},
  team: ['Sara'],
  category: 'api',
  user_id: user.id
)

poll27 = Poll.create(
  title: 'Visitor can select polls out of category',
  description: 'As a visitor. In order to easy find polls im interested in. I would like to be able to choose between different categories',
  tasks: 'If category statement for category in Polls.index GET request. Display category options in MainHeader as links. Checkbox in CreatePollsForm api/client. Category as param in Polls.create POST request',
  votes: { "Sara": 1},
  team: ['Sara'],
  category: 'client',
  user_id: user.id
)
file = URI.open('https://user-images.githubusercontent.com/68189237/104088474-99c70c00-5267-11eb-9d8c-a814be58e7c8.jpg')
poll27.image.attach(io: file, filename: 'pictureVisible.jpg')