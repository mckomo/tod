require 'open3'

module Tod
  class Runner

    def initialize(travis, executor: Executor.new, environment: ENV)
      @travis = travis
      @executor = executor
      @environment = environment
    end

    def run(section)

      setup_env

      @travis.section(section).each do |command|

        result = @executor.execute(command)

        puts result.output unless result.output.empty?

        if result.error?
          return result.code
        end

      end

      result_code = 0

    end

    private

    def setup_env
      @travis.env.each do |key, val|
        @environment.store(key.to_s, val.to_s)
      end
    end

  end
end
