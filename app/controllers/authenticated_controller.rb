class AuthenticatedController < ApplicationController
  layout 'dashboard'

  http_basic_authenticate_with name: ENV['HTTP_USER'], password: ENV['HTTP_PASSWORD']
end
