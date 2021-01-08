class PollsIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category
end
  