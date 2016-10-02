$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'tod'

RSpec.configure do |config|
  config.mock_with :mocha
end
