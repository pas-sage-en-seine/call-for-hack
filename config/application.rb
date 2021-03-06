require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require *Rails.groups

module Orga
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.i18n.default_locale = :fr
    config.time_zone           = 'Paris'

    if url = ENV['SMTP_URL']
      url                                  = URI.parse url
      settings                             = {
        port:    url.port,
        address: url.host
      }.compact
      settings[:port]                      &&= settings[:port].to_i
      ap settings: settings

      config.action_mailer.perform_deliveries = true
      #config.action_mailer.delivery_method = :sendmail
      config.action_mailer.smtp_settings   = settings
    end
  end
end
