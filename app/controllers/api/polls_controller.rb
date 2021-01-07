class Api::PollsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def index
    polls = Poll.all
    render json: polls, each_serializer: PollsIndexSerializer
  end

  def create
    poll = current_user.polls.create(poll_params)
    if poll.persisted? && attach_image(poll) || poll.persisted?
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
    elsif params['poll']['state']
      state_update
    elsif params['poll']['result']
      result_update
    end
  end

  private

  def attach_image(poll)
    params_image = params[:poll][:image]
    DecodeService.attach_image(params_image, poll.image) if params_image.present?
  end

  def poll_params
    params.require(:poll).permit(:title, :description, :tasks, points: [], team: [], votes: {})
  end

  def team_update
    poll = Poll.find(params[:id])
    if poll.team.include?(current_user.name)
      render json: { message: 'You already joined this poll' }, status: :unprocessable_entity
    else
      poll.team.push(current_user.name)
      poll.save!
      render json: { message: 'successfully joined', team: poll.team }, status: :ok
    end
  end

  def points_update
    poll = Poll.find(params[:id])
    user = current_user.name
    poll.votes = ({}) unless poll.votes
    if params['poll']['points'].nil? && !poll.votes.include?(user)
      render json: { error_message: 'You need to pick a value to vote' }, status: :unprocessable_entity
    elsif !poll.votes.include?(user)
      poll.points.push(params['poll']['points'])
      poll.votes[user] = params['poll']['points']
      poll.save!
      render json: { message: 'successfully voted', votes: poll.votes, points: poll.points }, status: :ok
    elsif poll.votes.include?(user)
      poll.points.delete(poll.votes[user])
      poll.votes.except!(user)
      poll.save!
      render json: { message: 'successfully un-voted', votes: poll.votes, points: poll.points }, status: :ok
    else
      render json: { error_message: 'Unauthorized, You need to sign in before you can proceed' }, status: :unauthorized
    end
  end

  def state_update
    poll = Poll.find(params[:id])
    poll.update!(update_params)
    render json: { message: 'Voting succesfully closed', state: poll.state, votes: poll.votes }, status: :ok
  end

  def update_params
    params.require(:poll).permit(:state, :result)
  end

  def result_update
    poll = Poll.find(params[:id])
    if poll.result.nil?
    poll.update!(update_params)
    poll.update!({state: "closed"})
    render json: { message: 'result successfully assigned', state: poll.state, result: poll.result }, status: :ok
    else
      render json: { message: 'result is already assigned' }, status: :unprocessable_entity
    end
  end
end
