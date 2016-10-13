require 'open3'

module Tod
  class Executor
    def execute(command, &block)
      process = Open3.popen2e(command.to_s) do |_, stdoe, wait_thread|
        read_thread(stdoe, &block).join
        wait_thread.value
      end

      Result.new(process.exitstatus)
    end

    private

    def read_thread(stream)
      Thread.new do
        stream.each { |line| yield(line) if block_given? }
      end
    end
  end
end
