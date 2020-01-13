module Api::V1
  class MediaHistoriesController < ApplicationController
    def index
      render json: current_user.media_histories
    end

    def create
      media_history = MediaHistory.create
      media_history.media_file.attach(io: params[:attachment].tempfile, filename: params[:name])
      render json: { image_url: media_history.media_file.service_url }
    end
  end
end