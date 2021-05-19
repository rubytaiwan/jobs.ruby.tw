# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
run JobsRubyTw::Application
Rails.application.load_server