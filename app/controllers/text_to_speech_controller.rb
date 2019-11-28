class TextToSpeechController < ApplicationController
  def create
    text_to_speech_params[:text].to_file "en", "tmp/#{text_to_speech_params[:file_name]}.mp3"
    render json: { message: 'success'}
  end

  private

  def text_to_speech_params
    params.require(:text_to_speech).permit(:text, :file_name)
  end
end