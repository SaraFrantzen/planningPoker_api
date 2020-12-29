class Api::PollsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def index
    polls = Poll.all
    render json: polls, each_serializer: PollsIndexSerializer
  end

  def create
    poll = current_user.polls.create(poll_params)
    if poll.persisted?
      render json: { message: 'successfully saved', id: poll.id }
    else
      error_message(poll.errors)
    end
  end

  def show
    poll = Poll.find(params[:id])
    render json: poll, serializer: PollsShowSerializer
  rescue StandardError => e
    render json: { error_message: 'Sorry, that poll does not exist' }, status: :not_found
  end

  def update
    if params['poll']['team']
      team_update
    elsif params['poll']['votes']
      points_update
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :description, :tasks, points: [], team: [], votes: {})
  end

  def user_email
    current_user.uid
  end

  def team_update
    poll = Poll.find(params[:id])
    if poll.team.include?(current_user.uid)
      render json: { message: 'You already joined this poll' }, status: :unprocessable_entity
    else
      poll.team.push(current_user.uid)
      poll.save!
      render json: { message: 'successfully joined', team: poll.team }, status: :ok
    end
  end

  def points_update
    poll = Poll.find(params[:id])
    if poll.persisted?
      poll.points.push(params['poll']['points'])
      poll.votes = params['poll']['votes']
      poll.votes.merge!(current_user.uid => params['poll']['points'])
      poll.save!
      render json: { message: 'successfully voted', votes: poll.votes, points: poll.points}, status: :ok
    else
      render status: :unauthorized
    end
  end
end
