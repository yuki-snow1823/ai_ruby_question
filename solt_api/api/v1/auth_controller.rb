# frozen_string_literal: true

class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      if user.locked?
        render json: { error: 'Your account is locked. Please try again later.' },
               status: :unauthorized
      else
        token = jwt_encode(user_id: user.id)
        user.unlock_account
        render json: { token: }, status: :ok
      end
    else
      user&.increment_failed_attempts
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:auth).permit(:email, :password)
  end
end
