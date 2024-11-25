class ApplicationController < ActionController::Base

  def authenticated_admin!
    raise "you are not admin!" unless current_user&.admin?
  end
end
