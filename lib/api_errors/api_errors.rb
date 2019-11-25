module Api
  class Error < StandardError
    attr_reader :message, :status, :errors

    def initialize(message, errors = nil, status = nil)
      super(message)
      @message  = message
      @errors   = errors
      @status   = status
    end

    def to_json
      error_object = {
        status:   status,
        message:  message,
        errors:   Array(errors).presence || [message]
      }

      error_object[:details] = errors.to_h if errors.instance_of?(ActiveModel::Errors)
      
      error_object.to_json
    end
  end

  class BadRequestError < Error
    def status
      400
    end
  end

  class UnauthorizedError < Error
    def status
      401
    end
  end

  class ForbiddenError < Error
    def status
      403
    end
  end

  class NotFoundError < Error
    def status
      404
    end
  end

  class UnprocessableError < Error
    def status
      422
    end
  end
end
