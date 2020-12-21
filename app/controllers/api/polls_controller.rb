class Api::PollsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    polls = Poll.all
    render json: polls, each_serializer: PollsIndexSerializer
  end

  def create
    poll = current_user.polls.create(poll_params)

    if poll.persisted?
      render json: { message: 'successfully saved' }
    else
      error_message(poll.errors)
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :description, :tasks, points: [])
  end
end
