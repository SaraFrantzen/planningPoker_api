class Poll < ApplicationRecord
  validates_presence_of :title, :description
end
