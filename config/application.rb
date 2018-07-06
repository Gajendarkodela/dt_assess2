require_relative 'boot'

require 'rails/all'
require "will_paginate-bootstrap"
require "will_paginate/collection"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
<<<<<<< 5a6446cd5e2fbc5e626f8caf113d98726bbf5d22
Bundler.require(*Rails.groups)

=======

Bundler.require(*Rails.groups)
>>>>>>> User Login
module DtAssess
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
<<<<<<< 5a6446cd5e2fbc5e626f8caf113d98726bbf5d22

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
=======
    config.assets.precompile << %w( *.scss *.js )
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.before_configuration do
	  	env_file = File.join(Rails.root, 'config', 'local_env.yml')
	  	YAML.load(File.open(env_file)).each do |key, value|
	    ENV[key.to_s] = value
    end if File.exists?(env_file)
end
>>>>>>> User Login
  end
end
