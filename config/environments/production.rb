Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
 config.log_level = :info
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  config_file = YAML.load_file("config/configs.yml")["production"].deep_symbolize_keys!
  default_url_options = { protocol: 'https', host: 'idv.herokuapp.com' }

  url_options = (config_file[:url_options][:host] && config_file[:url_options][:protocol]) ? config_file[:url_options] : default_url_options

  config.action_mailer.default_url_options = url_options
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
