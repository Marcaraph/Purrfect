class UserMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(user)
    @user = user
    @url = 'https://purrfect.fly.dev/users/sign_in'
    mail(to: @user.email, subject: "Bienvenue sur notre site!")
  end
end
