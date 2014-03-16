class V1::SessionsController < ApplicationController
  skip_before_action :authenticate
  
  def destroy
    @user = User.find_by(email: user_params[:email])
    @user.try(:update_attributes, session_token: nil)
    head :ok
  end
  
  def create
    @user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    if @user
      @user.set_session_token
      render and return
    else
      render json: {message: 'Bad Credentials'}, status: :unauthorized
    end
  end
  
  def show
  end

  private
  def user_params
    params.permit(:email, :password)
  end


end
