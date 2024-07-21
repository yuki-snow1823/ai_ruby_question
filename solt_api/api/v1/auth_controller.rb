# frozen_string_literal: true

class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      if user.locked?
        render json: { error: "Your account is locked. Please try again later." },
               status: :unauthorized
      else
        token = jwt_encode(user_id: user.id)
        user.unlock_account
        render json: { token: }, status: :ok
      end
    else
      user&.increment_failed_attempts
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def change_password
    if @current_user.authenticate(params[:current_password])
      @current_user.password = params[:new_password]
      @current_user.password_confirmation = params[:new_password_confirmation]
      if @current_user.save
        render json: { message: "Password changed successfully" }, status: :ok
      else
        render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Current password is incorrect" }, status: :unauthorized
    end
  end

  def profile
    render json: @current_user, status: :ok
  end

  private

  def login_params
    params.require(:auth).permit(:email, :password)
  end
end
