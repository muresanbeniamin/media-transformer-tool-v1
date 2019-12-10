module Api::V1
  class MediaHistoriesController < ApplicationController
    def create
      media_history = MediaHistory.create
      media_history.media_file.attach(io: params[:attachment].tempfile, filename: params[:name])
      render json: media_history
    end
  end
end