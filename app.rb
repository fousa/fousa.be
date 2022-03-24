require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'

require './app/public'

class App < Sinatra::Base
  helpers Sinatra::ContentFor
  register Sinatra::Namespace

  # Register the public modules.
  register Vulture::Public

  configure :development do
    # Enable auto reload in development.
    register Sinatra::Reloader
  end

  # Handle unfound pages.
  not_found do
    haml :'404'
  end
end
