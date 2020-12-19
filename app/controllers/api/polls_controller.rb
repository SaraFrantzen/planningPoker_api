class Api::PollsController < ApplicationController
  
  def index
    polls = Poll.all
    render json: polls, each_serializer: PollsIndexSerializer
  end
end
 