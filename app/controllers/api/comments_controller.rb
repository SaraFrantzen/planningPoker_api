class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    poll = Poll.find(params[:poll_id])
    comment = poll.comments.create(params[:comment].permit(:user_name, :comment))
    if comment.persisted?
      render json: { message: 'successfully saved', comment: comment }
    else
      error_message(comment.errors)
    end
  end

  def show
    comments = Comment.where(poll_id: params['id'])
    render json: comments, each_serializer: CommentsShowSerializer
  end
end
