class HomepageController < ApplicationController
  before_action :set_photo, only: [:show]
  def index
    @photos = Photo.order(:created_at => :desc).all
    @hotphotos= Photo.order(:cached_votes_up => :desc).first(4)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

end
