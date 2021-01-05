class Comment < ApplicationRecord
    belongs_to :poll
    validates_presence_of :comment, :user_name
end
