require 'yaml'

require 'tod/version'
require 'tod/travis'
require 'tod/result'
require 'tod/executor'
require 'tod/runner'
require 'tod/runner'

module Tod
  module_function

  def build(from_yml: '.travis.yml')
    yaml = YAML.load_file(from_yml)
    travis = Travis.new(yaml)
    Runner.new(travis)
  end
end
