require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RestaurantService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.active_storage.replace_on_assign_to_many = false
    config.load_defaults 6.1
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.paths.add 'lib', eager_load: true
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
