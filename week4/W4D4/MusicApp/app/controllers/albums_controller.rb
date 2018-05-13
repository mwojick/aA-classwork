class AlbumsController < ApplicationController

  before_action :require_login

  def show
    @album = Album.find_by(id: params[:id])

    if @album
      render :show
    else
      redirect_to band_url(params[:album][:band_id])
    end
  end

  def new
    @album = Album.new
    render :new
  end
  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to band_url(params[:album][:band_id])
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])

    if @album
      render :edit
    else
      redirect_to band_url(params[:album][:band_id])
    end
  end
  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to band_url(params[:album][:band_id])
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live_album)
  end
end
