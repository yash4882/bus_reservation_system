class ReviewsController < ApplicationController
	def create
    @ticket = Ticket.find(params[:ticket_id])
    @review = @ticket.reviews.create(review_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @ticket = Ticket.find(params[:ticket_id])
    @review = @ticket.reviews.find(params[:id])
    @review.destroy
    redirect_to ticket_path(@ticket), status: :see_other
  end

  private
    def review_params
      params.require(:review).permit(:name, :review)
    end
end
