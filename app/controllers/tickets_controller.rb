class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all

  end

  def show
    @ticket =  current_user.tickets.find(params[:id])
    @passengers = @ticket.passengers
  end

  def new
    @ticket =  current_user.tickets.new(bus_id: params[:bus_id])
  end

  def create
    debugger
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      TicketMailer.ticket_book(@ticket).deliver_now
      redirect_to @ticket
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ticket = current_user.tickets.find(params[:id])
  end

  def update
    @ticket =  current_user.tickets.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy

    redirect_to root_path, status: :see_other
  end

  # def booked_seats
  #   bookings.pluck(:seat).sum
  # end

  # def available_seats
  #   seats.count - booked_seats
  # end

  private
  def ticket_params
    params.require(:ticket).permit(:bus_id, passengers_attributes: [:id ,:name, :age, :gender, :contact,:_destroy])
  end
end
