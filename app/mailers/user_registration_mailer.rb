class UserRegistrationMailer < ApplicationMailer


  def register_notification(user)
    @greeting = "Hi"


    mail to: "user@gmail.com", from: "admin@gmail.com" ,subject: "Registered Successfully"
  end

  def login_notification(user)
    @greeting = "Hi"

    mail to: "user@gmail.com", from: "admin@gmail.com" ,subject: "Login Successfully"
  end
end
