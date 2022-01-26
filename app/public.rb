require 'yaml'

require 'sinatra/base'
require './app/helpers/struct'

module Vulture
    module Public
        def self.registered app
            app.get '/' do
                config = YAML.load_file 'config/app/index.yml'
                
                # Prepare the texts.
                text = config['text'].to_struct
                @developer_text = text.developer
                @gliding_text = text.gliding
                
                # Prepare the apps.
                @apps = config['apps'].map { |app| app.to_struct }

                haml :index, :layout => :'layouts/main'
            end

            app.get '/work' do
                config = YAML.load_file 'config/app/work.yml'

                #Prepare the projects
                @technologies = config['technologies'].map do |technology| 
                    struct = technology.to_struct
                    struct.projects = struct.projects.map do |project|
                        project.to_struct
                    end
                    struct
                end

                # Count the projects
                @project_count = @technologies.inject(0) do |count, technology|
                    count += technology.projects.count
                end

                haml :work, :layout => :'layouts/page'
            end
        end
    end
end