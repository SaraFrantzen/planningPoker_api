class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def error_message(errors)
    error_message = errors.full_messages.to_sentence

    render json: { message: error_message }, status: 422
  end
end
