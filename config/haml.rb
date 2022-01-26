require 'haml'

module Haml::Helpers
    def partial template, options={}, &block
        source_dir = File.expand_path '..', File.dirname(__FILE__)
        path = File.join source_dir, 'views', 'partials', "#{template}.haml"
        template = File.read(path)
        engine = Haml::Engine.new(template)
        engine.render(Object.new, options) do
            capture_haml(&block) if block_given?
        end
    end
end