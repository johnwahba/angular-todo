class V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.id
      @user.set_session_token
      @user.set_api_key
      render and return
    else
      render json: {message: 'Invalid sign up'}, status: :unauthorized
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end


end
