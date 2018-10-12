class ApplicationController < ActionController::API
  def hello
    render json: {json: 'working'}
  end
end
