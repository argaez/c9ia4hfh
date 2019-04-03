class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
      flash[:notice] = "Su habitación ha sido agregada correctamente"
    else
      flash[:alert] = "Su habitación, no pudo ser guardada"
      render :new
    end
  end

  def edit
  @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy

    redirect_to rooms_path
    flash[:alert] = "La habitación ha sido eliminada" 
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url, :price_per_night)
    end
end
