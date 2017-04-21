module Manages
  class UsersController < ManagesController
    before_action :set_user ,only: [:show, :destroy]

    def index
      @users = User.all
    end
    private
    def set_user
      @user = User.find(params[:id])
    end
  end
end
