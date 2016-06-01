class UserMailer < ApplicationMailer
  default from: 'ianroberts131@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = new_user_session_path
    mail(to: @user.email, subject: 'Welcome to Blocmarks!')
  end
end
