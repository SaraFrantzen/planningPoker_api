class PollsShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tasks, :points
end