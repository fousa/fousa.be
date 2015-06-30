class AuthenticatedController < ApplicationController
  before_action :authenticate

  def layout_by_resource
    if controller_name == 'apps' && action_name == 'show'
      super
    else
      "dashboard"
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic("Application") do |name, password|
      name == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
    end
  end
end
