class ApplicationController < ActionController::API
  def hello
    render json: {json: 'rails get response'}
  end

  def poster
    puts("params:")
    puts(params[:_json])
    render json: {json: "rails post response with params #{params[:_json]}"}
  end
end
