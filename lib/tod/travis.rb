require 'yaml'
require 'active_support/hash_with_indifferent_access'

module Tod

  class Travis

    def initialize(yml)
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

    def install
      Array(@yml[:before_install]) || []
    end

  end
end
