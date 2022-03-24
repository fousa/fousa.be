require 'yaml'

require 'sinatra/base'
require './app/helpers/struct'

module Vulture
  module Public
    def self.registered(app)
      app.get '/' do
        config = YAML.load_file 'config/app/index.yml'

        # Prepare the texts.
        text = config['text'].to_struct
        @developer_text = text.developer
        @gliding_text = text.gliding

        # Prepare the apps.
        @apps = config['apps'].map { |app| app.to_struct }

        haml :index
      end

      app.get '/projects' do
        config = YAML.load_file 'config/app/projects.yml'

        # Prepare the projects
        @technologies = config['technologies'].map do |technology|
          struct = technology.to_struct
          struct.projects = struct.projects.map do |project|
            project.to_struct
          end
          struct
        end

        # Count the projects
        @project_count = @technologies.inject(0) do |count, technology|
          count + technology.projects.count
        end

        haml :projects
      end

      app.get '/projects/:id' do
        config = YAML.load_file 'config/app/projects.yml'

        # Find the project
        projects = config['technologies'].inject([]) do |projects, technology|
          projects + technology['projects']
        end
        project = projects.detect { |p| p['id'] == params[:id] }
        pass if project.nil?

        @project = project.to_struct

        haml :project
      end

      app.get '/apps/:id' do
        config = YAML.load_file 'config/app/apps.yml'

        app = config['apps'].detect { |p| p['id'] == params[:id] }
        pass if app.nil?

        @app = app.to_struct

        haml :app
      end
    end
  end
end
