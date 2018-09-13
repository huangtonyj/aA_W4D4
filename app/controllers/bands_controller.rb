class BandsController < ApplicationController

  def index
    @bands = Band.all.order(:id)
    render :index
  end

  def create
    if Band.create(band_params)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Band already taken"]
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find([params[:id]])
    render :show
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Band already taken"]
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = ["Deleting error"]
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
