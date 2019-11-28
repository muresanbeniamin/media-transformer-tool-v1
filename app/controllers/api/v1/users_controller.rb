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
      user.save or raise_unprocessable(user)
      render json: { auth_token: JsonWebToken.encode(user_id: user.id) }
    end

    def recover_password
      user = User.find_by(email: params.permit(:email)[:email])
      if user.present? 
        new_password = SecureRandom.hex(8)
        user.update(password: new_password)
        UserMailer.forgot_password(user: user, password: new_password).deliver_later
        render json: { message: 'You will receive an email shortly' }
      else
        render json: { error: 'Email not found' }, status: 404
      end
    end

    private

    def signup_params
      params.permit(:email, :password, :full_name)
    end
  end
 end