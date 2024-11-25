class Api::V1::GeneralAnnouncementsController < Api::V1::ApplicationController
  def index
    @general_announcements = GeneralAnnouncement.all
  end

  def show
    @general_announcement = GeneralAnnouncement.find(params[:id])
  end
end
