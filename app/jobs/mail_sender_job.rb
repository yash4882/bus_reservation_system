class MailSenderJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserRegistrationMailer.register_notification(id).deliver_later
  end
end
