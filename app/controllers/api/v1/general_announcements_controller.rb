class Api::V1::GeneralAnnouncementsController < ApplicationController
  def index
    @general_announcements = GeneralAnnouncement.all
  end

  def show
    @general_announcement = GeneralAnnouncement.find(params[:id])
  end
end
