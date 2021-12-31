require 'rubygems'
require 'bundler'
Bundler.require

# Disable buffering for Heroku.
$stdout.sync = true

# Add sentry.
require 'raven'

Raven.configure do |config|
    config.server = 'https://b198c8832cfb4ac5a7c9af90fb022e83@o247984.ingest.sentry.io/5591182'
end

use Raven::Rack

require './config/haml.rb'
require './app'
run App