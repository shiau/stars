RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem 'authlogic'
  config.gem 'facebooker'
  config.gem 'hoptoad_notifier'
end

