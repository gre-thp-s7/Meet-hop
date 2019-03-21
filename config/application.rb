require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

class Application < Rails::Application
  config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  config.i18n.default_locale = :fr
  config.load_defaults 5.2

  # Resque ranslation errors
  #config.action_view.raise_on_missing_translations = false
  config.i18n.enforce_available_locales = false

  config.time_zone = 'Paris'
  config.active_record.default_timezone = :local

end
module DashboardThpFp
    # Initialize configuration defaults for originally generated Rails version.

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
end
