class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from Api::Error,              with: :api_error
  rescue_from Api::UnauthorizedError,  with: :api_error
  rescue_from Api::BadRequestError,    with: :api_error
  rescue_from Api::ForbiddenError,     with: :api_error
  rescue_from Api::NotFoundError,      with: :api_error
  rescue_from Api::UnprocessableError, with: :api_error
  rescue_from ActionController::ParameterMissing do |exception|
    api_error(Api::BadRequestError.new(exception.to_s.humanize))
  end
  rescue_from ActiveRecord::RecordNotFound do |_|
    api_error(Api::NotFoundError.new('Resource not found.'))
  end

  def raise_unprocessable(object)
    object_type = object.class.to_s.camelize(:lower)
    calling_method = caller_locations(1, 1).first.label
    raise Api::UnprocessableError.new("Failed to #{calling_method} #{object_type}", object.errors.full_messages)
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def api_error(exception)
    render json: exception.to_json, status: exception.status
  end
end
