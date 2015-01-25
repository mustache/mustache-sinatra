require 'mustache/sinatra/version'
require 'mustache'
require 'mustache/sinatra/helpers'

class Mustache
  module Sinatra

    # Called when you `register Mustache::Sinatra` in your Sinatra app.
    def self.registered(app)
      app.helpers Mustache::Sinatra::Helpers
    end
  end
end

Sinatra.register Mustache::Sinatra
