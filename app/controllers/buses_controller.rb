class BusesController < ApplicationController
  load_and_authorize_resource

  def index
    if (params[:query1] && params[:query2]).present?
      @buses = Bus.where("bus_number || source ||destination ||date LIKE ?", "%#{params[:query1]}#{params[:query2]}%").page(params[:page])
      else
        @buses = Bus.all.page(params[:page])
      end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def new
    @bus = Bus.new 
    # authorize! :create, @bus
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save
      flash[:success] = "Bus created Successfully."
      redirect_to @bus
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])

    if @bus.update(bus_params)
      redirect_to @bus
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy

    flash[:danger] = "Bus deleted Successfully."
    redirect_to buses_path, status: :see_other
  end

  private
    def bus_params
      params.require(:bus).permit(:manager_id, :bus_number, :source, :destination, :date, :time, :bus_type)
    end
end
