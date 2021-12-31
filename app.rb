require 'sinatra'
require 'sinatra/reloader'

require './app/public'

class App < Sinatra::Base
    register Sinatra::Namespace

    # Register the public modules.
    register Vulture::Public

    configure :development do
        # Enable auto reload in development.
        register Sinatra::Reloader
    end
    configure :production do
        # Force SSL in production.
        use Rack::SSL
    end

    # Handle unfound pages.
    not_found do
        haml :'404', :layout => :'layouts/simple'
    end
end