module Manages
  class PhotosController < ManagesController
    before_action :set_photo, only: [:show, :destroy]

    def index
      @photos = Photo.all
    end

    def destroy
      @photo.destroy
      redirect_to manages_photos_url
    end

    private
      def set_photo
        @photo = Photo.find(params[:id])
      end
  end
end
