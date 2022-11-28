class TicketMailer < ApplicationMailer
	def ticket_book(user)

    mail to: "user@gmail.com", from: "admin@gmail.com" ,subject: "Booked Successfully"
  end

end
