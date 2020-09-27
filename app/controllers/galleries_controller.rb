class GalleriesController < ApplicationController
  before_action :galleries, only: [:index, :create]

  def index
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      respond_to do |format|
        format.html { redirect_to galleries_path }
        format.json { render json: { caption: @gallery.caption, user_id: @gallery.user_id } }
      end
    end
  end

  def show
  end

  private

  def check_user
    redirect_to root_path unless user_signed_in?
  end

  def gallery_params
    params.require(:gallery).permit(:caption, :image, :user_id)
  end

  def galleries
    @galleries = Gallery.all.order('created_at DESC')
  end
end
