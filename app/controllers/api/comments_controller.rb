class Api::CommentsController < ApplicationController
    def create
        @poll = Poll.find(params[:poll_id])
        @comment = @poll.comments.create(params[:comment].permit(:name, :comment))
    end
end
