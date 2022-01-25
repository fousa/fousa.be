require 'yaml'

require 'sinatra/base'
require './app/helpers/struct'

module Vulture
    module Public
        def self.registered app
            app.get '/' do
                config = YAML.load_file 'config/home.yml'
                
                # Prepare the texts.
                text = config['text'].to_struct
                @developer_text = text.developer
                @gliding_text = text.gliding
                
                # Prepare the apps.
                @apps = config['apps'].map { |app| app.to_struct }

                @more_apps = [
                    OpenStruct.new(name: 'Connective',             url: 'https://apps.apple.com/be/app/connective-esignatures/id1214838024?l=nl'),
                    OpenStruct.new(name: 'Isabel',                 url: 'https://apps.apple.com/be/app/isabel-multibanking/id973114090?l=nl'),
                    OpenStruct.new(name: 'Geluidshuis',            url: 'https://apps.apple.com/be/app/geluidshuis/id1114955258?l=nl'),
                    OpenStruct.new(name: '1Limburg',               url: 'https://apps.apple.com/nl/app/1limburg/id911802784'),
                    OpenStruct.new(name: 'Marvin Gaye Tour',       url: 'https://apps.apple.com/be/app/marvin-gaye-tour/id1532912190?l=nl'),
                    OpenStruct.new(name: 'SkySight Wave (Perlan)', url: 'http://perlanproject.org'),
                    OpenStruct.new(name: 'Pivot',                  url: 'http://pivot.fousa.be'),
                    OpenStruct.new(name: 'Punch',                  url: 'http://pivot.fousa.be'),
                    OpenStruct.new(name: '22',                     url: 'https://apps.apple.com/us/app/22-socially-accepted-dating/id1046641168?ls=1'),
                    OpenStruct.new(name: 'Factura',                url: 'https://apps.apple.com/us/app/factura/id548954914?mt=12'),
                    OpenStruct.new(name: 'Spoty',                  url: 'https://apps.apple.com/us/app/spoty/id446227723'),
                    OpenStruct.new(name: 'Belins'),
                    OpenStruct.new(name: 'Huvepharma'),
                    OpenStruct.new(name: 'De Mol'),
                    OpenStruct.new(name: 'Fleetexpert'),
                    OpenStruct.new(name: 'Luan'),
                    OpenStruct.new(name: 'Report'),
                    OpenStruct.new(name: 'Besix'),
                    OpenStruct.new(name: 'Courir'),
                    OpenStruct.new(name: 'Pomidor'),
                    OpenStruct.new(name: 'Eggy'),
                    OpenStruct.new(name: 'Snabb'),
                    OpenStruct.new(name: 'Periodica'),
                    OpenStruct.new(name: 'Twunch'),
                    OpenStruct.new(name: 'FaceTeam'),
                    OpenStruct.new(name: 'IGC Reader'),
                    OpenStruct.new(name: '7am'),
                    OpenStruct.new(name: 'DSX'),
                    OpenStruct.new(name: 'Biegel')
                ]

                haml :index, :layout => :'layouts/site'
            end
        end
    end
end