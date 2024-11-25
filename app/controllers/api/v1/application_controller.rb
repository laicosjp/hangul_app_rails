
class Api::V1::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
end
