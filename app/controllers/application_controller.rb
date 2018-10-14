class ApplicationController < ActionController::API
  def hello
    render json: {json: 'from rails'}
  end
end
