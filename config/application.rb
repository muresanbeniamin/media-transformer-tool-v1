require_relative 'boot'
require 'rails/all'
require_relative '../lib/api_errors/api_errors.rb'

Bundler.require(*Rails.groups)

module MediaTransformerToolV1
  class Application < Rails::Application
    config.load_defaults 6.0
    config.autoload_paths << Rails.root.join('lib')
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  end
end
