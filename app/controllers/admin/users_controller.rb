class Admin::UsersController < Admin::ApplicationController
  before_action :authenticated_admin!

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
