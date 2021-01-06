class CommentsShowSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user_name 
end
