class Poll < ApplicationRecord
  validates_presence_of :title, :description, :tasks, :points
  belongs_to :user, class_name: "User"
end
