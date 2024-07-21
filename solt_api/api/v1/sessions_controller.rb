class Api::V1::SessionsController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user && user.password == Digest::SHA256.hexdigest(user.salt + login_params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
      render json: { token: token }
    else
      render json: { message: "ログイン失敗" }
    end
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
