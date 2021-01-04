class Poll < ApplicationRecord
  validates_presence_of :title, :description, :tasks
  belongs_to :user, class_name: "User"
  serialize :votes
  has_one_attached :image
end
