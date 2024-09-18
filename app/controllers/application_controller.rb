class ApplicationController < ActionController::Base

  def default_url_options
    { app_name: :ecommerce_app }
  end

  def health
    render json: {"status": "ok"}, status: 200
  end
end
