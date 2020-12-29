class Poll < ApplicationRecord
  validates_presence_of :title, :description, :tasks
  belongs_to :user, class_name: "User"
  serialize :votes
=begin   @poll = Poll.new
  @poll.votes = {:email =>:points}
=end

end
