class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_validation_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_error(detail, status:)
    render json: { detail: detail }, status: status
  end

  def render_validation_error(error)
    render_error(error.message, status: :unprocessable_entity)
  end

  def render_not_found
    render_error("Resource not found", status: :not_found)
  end
end
