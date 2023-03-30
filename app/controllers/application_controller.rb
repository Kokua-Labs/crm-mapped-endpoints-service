class ApplicationController < ActionController::API
  before_action :check_authorization

  private

  def check_authorization
    return denied_access unless authorized?
    
  rescue ActionController::ParameterMissing
    render json: { error: 'Missing parameter' }, status: 400
  end

  def permitted_params
    params.permit(:rid)
  end

  def denied_access
    head :forbidden
  end

  def authorized?
    rid == ENV['RID_PARAM']
  end

  def rid
    permitted_params.fetch(:rid)
  end
end
