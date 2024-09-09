class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    return unless @user == current_user
    # ここに、ユーザーが退会するときの処理を書く。
    # ただし、物理削除にはせず、退会フラグを立てて、メールアドレス+uidをマスキングするに留める
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
