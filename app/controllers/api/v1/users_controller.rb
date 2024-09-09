class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  # DO NOT USE devise_token_auth's controller when user leaves the app.
  # Because devise_token_auth's controller delete user's information completely from database.
  def destroy
    return nil unless @user == current_user

    params = { left_at: Time.current, email: "alda+#{@user.id}@example.com", uid: "alda+#{@user.id}@example.com" }

    if current_user.update!(params)
      render json: { status: 'success', message: "User id: #{@user.id} has left the app." }
    else
      render json: { status: 'error', message: 'Failed to leave the app.' }, status: :internal_server_error
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
