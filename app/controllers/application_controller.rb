class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['HTTP_USER'], password: ENV['HTTP_PASSWORD']

  private

  def render_no_layout
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
