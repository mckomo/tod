require 'tod/version'
require 'tod/travis'

module Tod
  def self.from_path(path)
    Travis.new
  end
end
