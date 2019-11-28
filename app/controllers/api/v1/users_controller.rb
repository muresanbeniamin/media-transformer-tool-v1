module Api::V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_request
  
    def signin
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
        render json: { auth_token: JsonWebToken.encode(user_id: user.id) }
      else
        render json: { error: user.errors.messages }, status: 422
      end
    end

    private

    def signup_params
      params.permit(:email, :password, :name)
    end
  end
 end