require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Seeks
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    #jaj Rails "NameError uninitialized constant class" Solution
    #ref https://hackhands.com/rails-nameerror-uninitialized-constant-class-solution/

    config.autoload_paths += %W(#{config.root}/lib)
  end
end
