class Api::V1::RegisterationsController < ApplicationController
  def register
    salt = SecureRandom.hex(16)
    hashed_password = Digest::SHA256.hexdigest(salt + register_params[:password])
    user = User.new(name: register_params[:name], email: register_params[:email], password: hashed_password, salt: salt)
    if user.save
      render json: { message: "ユーザー登録が完了しました" }
    else
      render json: { message: "ユーザー登録に失敗しました" }
    end
  end

  private

  def register_params
    params.require(:register).permit(:name, :email, :password, :password_confirmation)
  end
end
