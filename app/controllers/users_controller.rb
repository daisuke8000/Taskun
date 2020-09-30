class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  def search
    @users = User.where("name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {
        render json: @users
      }
    end
  end

end