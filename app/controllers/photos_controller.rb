class PhotosController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :upvote, :downvote]
  before_action :set_photo, only: [:show]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @hotphotos= Photo.order(:cached_votes_up => :desc).first(4)
  end

  # GET /photos/new
  def new

    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @photo = Photo.find(params[:id])
    @photo.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @photo = Photo.find(params[:id])
    @photo.downvote_by current_user
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image).merge(user_id: current_user.id)
    end

end
