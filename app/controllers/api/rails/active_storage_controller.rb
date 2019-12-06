module Api::Rails
  class ActiveStorageController < ApplicationController
    skip_before_action :authenticate_request
    def direct_uploads

      blob = ActiveStorage::Blob.create_before_direct_upload!(filename: direct_uploads_params[:filename],
                                                              checksum: direct_uploads_params[:checksum],
                                                              content_type: direct_uploads_params[:content_type],
                                                              byte_size: direct_uploads_params[:byte_size])
      render json: { url: blob.service_url_for_direct_upload }
    end

    private

    def direct_uploads_params
      params.require(:blob).permit(:filename, :content_type, :checksum, :byte_size, :metadata)
    end
  end
end