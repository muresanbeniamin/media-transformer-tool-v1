class UsersController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
 
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def signup
    user = User.new(signup_params)
    if user.save
      render json: user
    else
      render json: { error: user.errors.messages }, status: signup_error
    end
  end

  private

  def signup_params
    params.permit(:email, :password)
  end
 end
 