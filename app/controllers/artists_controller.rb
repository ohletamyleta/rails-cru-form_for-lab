class ArtistsController < ApplicationController

  def new
   @artist = Artist.new
  end

  def index 
   @artist = Artist.all 
  end

  def create 
   @artist = Artist.new(artist_params(:name, :bio))
	 @artist.save
	  redirect_to artist_path(@artist)
  end

  def show 
   @artist = Artist.find(params[:id])
  end

  def edit 
   @artist = Artist.find(params[:id])
  end

  def update 
   @artist = Artist.find(params[:id])
   @artist.update(artist_params(:name, :bio))
    redirect_to artists_path(@artist)
  end
  private
 
  def artist_params(*args)
    params.require(:artist).permit(*args)
  end


end