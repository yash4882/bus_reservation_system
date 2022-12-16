class TicketMailer < ApplicationMailer
	def ticket_book(id)
    @ticket = Ticket.find(id)
    @bus = Ticket.find(id).bus
    @passenger = Ticket.find(id).passengers.count
    
    @current_user = Ticket.find(id).user
    mail to: @current_user.email, from: "admin@gmail.com" ,subject: "Booked Successfully"
  end
end
