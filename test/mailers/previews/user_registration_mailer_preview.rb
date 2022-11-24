# Preview all emails at http://localhost:3000/rails/mailers/user_registration_mailer
class UserRegistrationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_registration_mailer/register_notification
  def register_notification
    UserRegistrationMailer.register_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_registration_mailer/login_notification
  def login_notification
    UserRegistrationMailer.login_notification
  end

end
