class MailerJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserRegistrationMailer.login_notification(id).deliver_later
  end
end
