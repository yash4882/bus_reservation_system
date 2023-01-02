class ReviewsController < ApplicationController
	def create
    @ticket = Ticket.find(params[:ticket_id])
    @review = @ticket.reviews.create(review_params)
    redirect_to ticket_path(@ticket)
  end

  private
    def review_params
      params.require(:review).permit(:name, :review)
    end
end
