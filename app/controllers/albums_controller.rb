class AlbumsController < ApplicationController

  def new
    @band_id = params[:band_id]
    render :new
  end

  def create
    band_id = params[:band_id]
    if Album.create(album_params)
      redirect_to band_url
    else
      # error
    end
  end

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end

end
