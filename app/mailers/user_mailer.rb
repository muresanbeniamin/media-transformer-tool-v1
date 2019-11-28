class UserMailer < ApplicationMailer
  def forgot_password(user:, password:)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Transform - Password Recovery')
  end
end
