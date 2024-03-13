class UserMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(user)
    @user = user
    @url = 'https://purrfect.fly.dev/users/sign_in'
    mail(to: @user.email, subject: "Welcome to Purrfect!")
  end

  def user_order_email(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for your order")
  end

  def admin_order_email
    mail(to: "niffexeugeci-3221@yopmail.com", subject: "An order was confirmed")
  end
end
