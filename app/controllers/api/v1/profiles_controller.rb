# typed: true

class Api::V1::ProfilesController < Api::V1::ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end
end
