require 'rubygems'
require 'bundler'
Bundler.require

# Disable buffering for Heroku.
$stdout.sync = true

# Add sentry.
require 'raven'

Raven.configure do |config|
    config.server = 'https://bfa5339476b04f4fb24b71bf46853dbb@o247984.ingest.sentry.io/6129506'
end

use Raven::Rack

require './config/haml.rb'
require './app'

run App