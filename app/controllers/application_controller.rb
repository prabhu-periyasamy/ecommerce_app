class ApplicationController < ActionController::Base
  def health
    render json: {"status": "ok"}, status: 200
  end
end
