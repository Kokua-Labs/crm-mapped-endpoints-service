class Landing::FormsController < ApplicationController
  # Idea: Have all permitted params in a constant, and build the permitted params hash
  # based on this accepted params (so that we avoid not wanted params to be submitted)
  VALID_PARAMS = ['first_name', 'contact_email', 'last_name', 'comment', 'requested_service', 'rid']

  def data
    binding.pry
    # Here the params are built dynamically, and we will pass only those that are accepted
    # And permitted.
    # Workflow.call(permitted_params)
  end

  private

  def build_parameters
    params.select! do |p|
      VALID_PARAMS.include?(p)
    end
  end

  def permitted_params
    params.permit(build_parameters.keys)
  end
end
