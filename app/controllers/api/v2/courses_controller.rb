class Api::V2::CoursesController < Api::V2::ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end
end
