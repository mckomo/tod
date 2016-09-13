require 'yaml'

require 'tod/version'
require 'tod/travis'
require 'tod/runner'


module Tod

  def self.build(path: '.travis.yml')
    Runner.new({})
  end

end
