class Admin::UsersController < Admin::ApplicationController
  before_action :authenticated_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
