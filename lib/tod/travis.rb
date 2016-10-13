require 'yaml'
require 'active_support/hash_with_indifferent_access'

module Tod
  class Travis
    def initialize(yml = {})
      @yml = yml.symbolize_keys
    end

    def env
      Hash(@yml[:env]) || {}
    end

    def script
      Array(@yml[:script]) || []
    end

    def before
      Array(@yml[:before_script]) || []
    end

    def setup
      Array(@yml[:before_install]) || []
    end

    def section(section)
      send(section.to_sym)
    end
  end
end
