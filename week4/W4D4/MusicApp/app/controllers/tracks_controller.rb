class TracksController < ApplicationController

  before_action :require_login

  def show
    @track = Track.find_by(id: params[:id])

    if @track
      render :show
    else
      redirect_to album_url(params[:track][:album_id])
    end
  end

  def new
    @track = Track.new
    render :new
  end
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to album_url(params[:track][:album_id])
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])

    if @track
      render :edit
    else
      redirect_to album_url(params[:track][:album_id])
    end
  end
  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      redirect_to album_url(params[:track][:album_id])
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :bonus_track, :lyrics)
  end
end
