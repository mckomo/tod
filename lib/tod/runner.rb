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
        result = @executor.execute(command) { |line| puts line }
        return result.code if result.error?
      end

      Result::OK
    end

    private

    def setup_env
      @travis.env.each do |key, val|
        @environment.store(key.to_s, val.to_s)
      end
    end
  end
end
