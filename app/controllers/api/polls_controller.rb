class Api::PollsController < ApplicationController
  def index
    binding.pry
    polls = Poll.all
    render json: polls
  end
end
