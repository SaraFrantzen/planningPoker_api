class Poll < ApplicationRecord
  validates_presence_of :title, :description, :tasks, :category
  belongs_to :user, class_name: "User"
  serialize :votes
  has_one_attached :image
  has_many :comments
  enum state: [:ongoing, :pending, :closed]
end
