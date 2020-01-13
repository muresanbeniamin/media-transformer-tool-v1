module Api::V1
  class TextToSpeechController < ApplicationController
    def create
      media_history = MediaHistory.create
      file_name = "#{text_to_speech_params[:file_name]}.mp3"
      text_to_speech_params[:text].to_file "en", "tmp/#{file_name}.mp3"
      media_history.media_file.attach(io: File.open("tmp/#{file_name}.mp3") , filename: file_name)
      render json: { audio_file_url: media_history.media_file.service_url }
    end

    private

    def text_to_speech_params
      params.require(:text_to_speech).permit(:text, :file_name)
    end
  end
end