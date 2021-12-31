require 'sinatra/base'

module Vulture
    module Public
        def self.registered app
            app.get '/' do
                @apps = [
                    OpenStruct.new(name: 'Vulture',      tags: '#ios #macos #api', image: 'Vulture',     url: 'https://vulture.fousa.be'),
                    OpenStruct.new(name: 'Aviobook',     tags: '#ipados',          image: 'Aviobook',    url: 'https://aviobook.aero'),
                    OpenStruct.new(name: 'Telenet Flow', tags: '#ios #tvos',       image: 'TelenetFlow', url: 'https://www2.telenet.be/residential/nl/producten/telenet-tv/flow'),
                    OpenStruct.new(name: 'Horizon Go',   tags: '#tvos',            image: 'HorizonGo',   url: 'https://apps.apple.com/sk/app/horizon-tv-app/id1456233801'),
                    OpenStruct.new(name: 'Soaring Book', tags: '#ios #web',        image: 'SoaringBook', url: 'https://apps.apple.com/nl/app/soaring-book-runway/id1422856598'),
                    OpenStruct.new(name: 'Pace Up',      tags: '#watchos',         image: 'PaceUp',      url: 'http://paceup.fousa.be'),
                    OpenStruct.new(name: 'Bolero',       tags: '#ios',             image: 'Bolero',      url: 'https://www.bolero.be/nl/platformen/mobile'),
                    OpenStruct.new(name: 'PoS',          tags: '#ipados',          image: 'PoS',         url: 'https://apps.apple.com/us/app/philips-hue-in-store-app/id1191767292'),
                    OpenStruct.new(name: 'Track',        tags: '#ios #macos',      image: 'Track',       url: 'https://itunes.apple.com/us/app/track/id1197989851?ls=1&mt=8'),
                    OpenStruct.new(name: 'TruliUs',      tags: '#ios',             image: 'TruliUs',     url: 'https://www.trulius.be'),
                    OpenStruct.new(name: 'RASP',         tags: '#ios #api',        image: 'RASP',        url: 'https://apps.apple.com/us/app/rasp/id426040634#'),
                    OpenStruct.new(name: 'GPX Reader',   tags: '#ios #macos',      image: 'GPXReader',   url: 'https://apps.apple.com/be/app/gpx-reader/id543308129')
                ]

                @more_apps = [
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