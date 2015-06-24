class AuthenticatedController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_USER'], password: ENV['HTTP_PASSWORD']

  def layout_by_resource
    "dashboard"
  end
end
