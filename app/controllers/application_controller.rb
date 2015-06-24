class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def layout_by_resource
    "application"
  end

  private

  def render_no_layout
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
