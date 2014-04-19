require 'rspec'
require 'paperclip'
require 'fog'
require 'carrierwave'
require 'zipline'

Dir["#{File.expand_path('..', __FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
  config.order = :random
  config.run_all_when_everything_filtered = true
end
